//
//  Levels.swift
//  Soccerdle
//
//  Created by Michael Ghebranious on 6/19/23.
//

import Foundation
import SwiftUI
struct Level: Identifiable {
    var id = UUID()
    init(number: Int, playerName: String, lastName: String){
        self.number = number
        self.playerName = playerName
        self.lastName = lastName
    }
    let number: Int
    let playerName: String
    let lastName: String
    var neededCharacters: [Character] {
        return Array(lastName.uppercased())
    }
    var letters: [LetterType]{
        var count = 0
        var array: [LetterType] = []
        while count < neededCharacters.count {
            array.append(LetterType(character: neededCharacters[count]))
            count += 1
        }
        return array
    }
    var imageName: Image {
        return Image("gw" + lastName.lowercased())
    }
    
}

class LevelInformation : ObservableObject{
    
    @Published var levels: [Level] = [
        Level(number: 1, playerName: "Lionel Messi", lastName:"Messi"),
        Level(number: 2, playerName: "Lionel Mesis", lastName:"Messi"),
        Level(number: 3, playerName: "Lionel Messi", lastName:"Messi"),
        Level(number: 4, playerName: "Lionel Messi", lastName:"Messi"),
        Level(number: 5, playerName: "Lionel Messi", lastName:"Messi"),
        Level(number: 6, playerName: "Lionel Messi", lastName:"Messi"),
        Level(number: 7, playerName: "Lionel Messi", lastName:"Messi"),
        Level(number: 8, playerName: "Lionel Messi", lastName:"Messi"),
        Level(number: 9, playerName: "Lionel Messi", lastName:"Messi"),
        Level(number: 10, playerName: "Lionel Messi", lastName:"Messi"),
    ]
}
