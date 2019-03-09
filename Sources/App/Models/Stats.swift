//
//  Stats.swift
//  App
//
//  Created by Zach Eriksen on 3/8/19.
//

import Foundation

struct Stats: CodeAndBuildable {
    var strength: Int
    var dexterity: Int
    var constitution: Int
    var intelligence: Int
    var wisdom: Int
    var charisma: Int
    
    init() {
        strength = 0
        dexterity = 0
        constitution = 0
        intelligence = 0
        wisdom = 0
        charisma = 0
    }
}
