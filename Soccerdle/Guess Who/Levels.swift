//
//  Levels.swift
//  Soccerdle
//
//  Created by Michael Ghebranious on 6/19/23.
//

import Foundation
import SwiftUI
struct Level {
    let number: Int
    let playerName: String
    let lastName: String
    let completed: Bool
    var neededCharacters: [Character] {
        return Array(lastName)
    }
    var imageName: Image {
        return Image("gw" + lastName.lowercased())
    }
    
}

var levels: [Level] = [
    Level(number: 1, playerName: "Lionel Messi", lastName:"Messi", completed: false)
]
