//
//  CharacterController.swift
//  App
//
//  Created by Zach Eriksen on 3/8/19.
//

import Vapor
import FluentSQL
import Authentication

class CharacterController: RouteCollection {
    func boot(router: Router) throws {
        
        let authSessionRouter = router.grouped(User.authSessionsMiddleware())
        let protectedRouter = authSessionRouter.grouped(RedirectMiddleware<User>(path: "/login"))
        
        protectedRouter.get("characters", use: list)
        protectedRouter.post("characters", use: create)
        protectedRouter.post("characters", Character.parameter, "update", use: update)
        protectedRouter.post("characters", Character.parameter, "delete", use: delete)
        
    }
    
    // view with Items
    func list(_ req: Request) throws -> Future<[Character]> {
        return Character.query(on: req).all()
    }
    
    // create a new Item
    func create(_ req: Request) throws -> Future<Character> {
        return try req.content.decode(Character.self).flatMap { Character in
            return Character.save(on: req).map { character in
                return character
            }
        }
    }
    
    func update(_ req: Request) throws -> Future<Character> {
        return try req.parameters.next(Character.self).flatMap { character in
            return try req.content.decode(Character.self).flatMap { updatedCharacter in
                character.name = updatedCharacter.name
                return character.save(on: req).map { character in
                    return character
                }
            }
        }
    }
    
    func delete(_ req: Request) throws -> Future<HTTPStatus> {
        return try req.parameters.next(Character.self).flatMap { character in
            return character.delete(on: req).map { character in
                return .noContent
            }
        }
    }
}
