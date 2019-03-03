//
//  ItemController.swift
//  App
//
//  Created by Zach Eriksen on 3/3/19.
//

import Vapor
import FluentSQL
import Crypto
import Authentication


class ItemController: RouteCollection {
    func boot(router: Router) throws {
        
        let authSessionRouter = router.grouped(User.authSessionsMiddleware())
        let protectedRouter = authSessionRouter.grouped(RedirectMiddleware<User>(path: "/login"))
        
        protectedRouter.get("items", use: list)
        protectedRouter.post("items", use: create)
        protectedRouter.post("items", Item.parameter, "update", use: update)
        protectedRouter.post("items", Item.parameter, "delete", use: delete)
        
    }
    
    // view with Items
    func list(_ req: Request) throws -> Future<[Item]> {
        return Item.query(on: req).all()
    }
    
    // create a new Item
    func create(_ req: Request) throws -> Future<Item> {
        return try req.content.decode(Item.self).flatMap { Item in
            return Item.save(on: req).map { item in
                return item
            }
        }
    }
    
    func update(_ req: Request) throws -> Future<Item> {
        return try req.parameters.next(Item.self).flatMap { item in
            return try req.content.decode(Item.self).flatMap { updatedItem in
                item.name = updatedItem.name
                return item.save(on: req).map { item in
                    return item
                }
            }
        }
    }
    
    func delete(_ req: Request) throws -> Future<HTTPStatus> {
        return try req.parameters.next(Item.self).flatMap { Item in
            return Item.delete(on: req).map { item in
                return .noContent
            }
        }
    }
}
