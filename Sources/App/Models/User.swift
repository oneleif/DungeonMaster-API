//
//  User.swift
//  App
//
//  Created by Zach Eriksen on 2/28/19.
//

import FluentSQLite
import Vapor
import Authentication


final class User: SQLiteModel, Buildable {
    var id: Int?
    var email: String
    var password: String
    
    init() {
        id = nil
        email = "n/a"
        password = "n/a"
    }
}

extension User: Content {}
extension User: Migration {}
extension User: PasswordAuthenticatable {
    static var usernameKey: WritableKeyPath<User, String> {
        return \User.email
    }
    static var passwordKey: WritableKeyPath<User, String> {
        return \User.password
    }
}
extension User: SessionAuthenticatable {}
