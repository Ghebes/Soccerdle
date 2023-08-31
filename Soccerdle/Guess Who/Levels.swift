//
//  Levels.swift
//  Soccerdle
//
//  Created by Michael Ghebranious on 6/19/23.
//

import Foundation
import SwiftUI
struct Level: Identifiable, Hashable {
    var id = UUID()
    let number: Int
    let playerName: String
    let lastName: String
    var neededCharacters: [Character] {
        return Array(lastName.uppercased())
    }
    
    var letters: [LetterType]{
        var count = 0
        var array: [LetterType] = []
        while(count < neededCharacters.count){
            array.append(LetterType(character: neededCharacters[count]))
            count += 1
        }
        return array
    }
    
    var imageName: Image {
        return Image("gw" + lastName.lowercased())
    }
}

class LevelInformation: ObservableObject{
    @Published var levels: [Level] = [
        Level(number: 1, playerName: "Lionel Messi", lastName:"Messi"),
        Level(number: 2, playerName: "Lionel Messi", lastName:"Messi"),
        Level(number: 3, playerName: "Lionel Messi", lastName:"Messi"),
        Level(number: 4, playerName: "Christiano Ronaldo", lastName:"Ronaldo"),
        Level(number: 5, playerName: "Christiano Ronaldo", lastName:"Ronaldo"),
        Level(number: 6, playerName: "Lionel Messi", lastName:"Messi"),
        Level(number: 7, playerName: "Lionel Messi", lastName:"Messi"),
        Level(number: 8, playerName: "Lionel Messi", lastName:"Messi"),
        Level(number: 9, playerName: "Christiano Ronaldo", lastName:"Ronaldo"),
        Level(number: 10, playerName: "Lionel Messi", lastName:"Messi"),
        Level(number: 11, playerName: "Lionel Messi", lastName:"Messi"),
        Level(number: 12, playerName: "Lionel Messi", lastName:"Messi"),
        Level(number: 13, playerName: "Lionel Messi", lastName:"Messi"),
        Level(number: 14, playerName: "Lionel Messi", lastName:"Messi"),
        Level(number: 15, playerName: "Lionel Messi", lastName:"Messi"),
        Level(number: 16, playerName: "Lionel Messi", lastName:"Messi"),
        Level(number: 17, playerName: "Lionel Messi", lastName:"Messi"),
        Level(number: 18, playerName: "Lionel Messi", lastName:"Messi"),
        Level(number: 19, playerName: "Lionel Messi", lastName:"Messi"),
        Level(number: 20, playerName: "Lionel Messi", lastName:"Messi"),
        Level(number: 21, playerName: "Lionel Messi", lastName:"Messi"),
        Level(number: 22, playerName: "Lionel Mesis", lastName:"Messi"),
        Level(number: 23, playerName: "Lionel Messi", lastName:"Messi"),
        Level(number: 24, playerName: "Lionel Messi", lastName:"Messi"),
        Level(number: 25, playerName: "Lionel Messi", lastName:"Messi"),
        Level(number: 26, playerName: "Lionel Messi", lastName:"Messi"),
        Level(number: 27, playerName: "Lionel Messi", lastName:"Messi"),
        Level(number: 28, playerName: "Lionel Messi", lastName:"Messi"),
        Level(number: 29, playerName: "Lionel Messi", lastName:"Messi"),
    ]
}
