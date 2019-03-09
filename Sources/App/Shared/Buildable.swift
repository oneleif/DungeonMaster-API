//
//  Buildable.swift
//  App
//
//  Created by Zach Eriksen on 3/8/19.
//

import Foundation

protocol CodeAndBuildable: Codable, Buildable {}

protocol Buildable {
    init()
    init(_ build: (inout Self) -> Self)
}

extension Buildable {
    init(_ build: (inout Self) -> Self) {
        var s = Self()
        self = build(&s)
    }
}
