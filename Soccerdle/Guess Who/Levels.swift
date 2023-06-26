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
        return Array(lastName.uppercased())
    }
    var letters: [Letters] {
        var letters: [Letters] = []
        var count = 0
        while count < lastName.count {
            var letter: Character =  lastName[String.Index(utf16Offset: count, in: lastName)]
            letters.append(Letters(letter: Character(letter.uppercased())))
            count += 1
        }
        return letters
    }
    var imageName: Image {
        return Image("gw" + lastName.lowercased())
    }
    
}

var levels: [Level] = [
    Level(number: 1, playerName: "Lionel Messi", lastName:"Messi", completed: false),
    Level(number: 2, playerName: "Lionel Messi", lastName:"Messi", completed: false),
    Level(number: 3, playerName: "Lionel Messi", lastName:"Messi", completed: false),
    Level(number: 4, playerName: "Lionel Messi", lastName:"Messi", completed: false),
    Level(number: 5, playerName: "Lionel Messi", lastName:"Messi", completed: false),
    Level(number: 6, playerName: "Lionel Messi", lastName:"Messi", completed: false),
    Level(number: 7, playerName: "Lionel Messi", lastName:"Messi", completed: false),
    Level(number: 8, playerName: "Lionel Messi", lastName:"Messi", completed: false),
    Level(number: 9, playerName: "Lionel Messi", lastName:"Messi", completed: false),
    Level(number: 10, playerName: "Lionel Messi", lastName:"Messi", completed: false),
]
