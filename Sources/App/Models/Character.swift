//
//  Character.swift
//  App
//
//  Created by Zach Eriksen on 3/8/19.
//

import FluentSQLite
import Vapor

enum CharacterType: Int, Codable {
    case player
    case npc
    case monster
}


final class Character: SQLiteModel, Buildable {
    var id: Int?
    var name: String
    var size: Int
    var type: String
    var subType: String
    var alignment: Int
    var ac: Int
    var hp: Int
    var speed: Int
    var coreStats: Stats
    var savingThrows: Stats
    var skills: Skills
    var resistances: [String]
    var invulnerabilities: [String]
    var senses: [String]
    var languages: [String]
    var level: Int
    var experience: Int
    var abilities: [Ability]
    var characterType: CharacterType
    
    init() {
        id = nil
        name = "n/a"
        size = 0
        type = "n/a"
        subType = "n/a"
        alignment = 0
        ac = 0
        hp = 0
        speed = 0
        coreStats = Stats()
        savingThrows = Stats()
        skills = Skills()
        resistances = []
        invulnerabilities = []
        senses = []
        languages = []
        level = 0
        experience = 0
        abilities = []
        characterType = .player
    }
}

extension Character: Content {}
extension Character: Migration {}
extension Character: Parameter {}
