//
//  Ability.swift
//  App
//
//  Created by Zach Eriksen on 3/8/19.
//

import Foundation

struct Ability: CodeAndBuildable {
    var damageBonus: Int
    var damageDice: String
    var attackBonus: Int
    var description: String
    var name: String
    
    init() {
        damageBonus = 0
        damageDice = "n/a"
        attackBonus = 0
        description = "n/a"
        name = "n/a"
    }
}
