//
//  Item.swift
//  App
//
//  Created by Zach Eriksen on 3/3/19.
//
import FluentSQLite
import Vapor
import Authentication

struct Currency: CodeAndBuildable {
    var pp: Int
    var gp: Int
    var ep: Int
    var sp: Int
    var cp: Int
    
    init() {
        pp = 0
        gp = 0
        ep = 0
        sp = 0
        cp = 0
    }
}

final class Item: SQLiteModel, Buildable {
    var id: Int?
    var name: String
    var description: String
    var visualDescription: String
    var image: String
    var stackAmount: Int
    var value: Currency
    var rarity: Int
    
    init() {
        id = nil
        name = "n/a"
        description = "n/a"
        visualDescription = "n/a"
        image = "n/a"
        stackAmount = 0
        value = Currency()
        rarity = 0
    }
}

extension Item: Content {}
extension Item: Migration {}
extension Item: Parameter {}
