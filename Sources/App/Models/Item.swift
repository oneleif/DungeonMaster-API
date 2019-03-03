//
//  Item.swift
//  App
//
//  Created by Zach Eriksen on 3/3/19.
//
import FluentSQLite
import Vapor
import Authentication

struct Currency: Codable {
    var pp: Int
    var gp: Int
    var ep: Int
    var sp: Int
    var cp: Int
}

final class Item: SQLiteModel {
    var id: Int?
    var name: String
    var description: String
    var visualDescription: String
    var image: String
    var stackAmount: Int
    var value: Currency
    var rarity: Int
    
    init(id: Int? = nil, name: String, description: String, visualDescription: String,
         image: String, stackAmount: Int, value: Currency, rarity: Int) {
        self.id = id
        self.name = name
        self.description = description
        self.visualDescription = visualDescription
        self.image = image
        self.stackAmount = stackAmount
        self.value = value
        self.rarity = rarity
    }
}

extension Item: Content {}
extension Item: Migration {}
extension Item: Parameter {}
