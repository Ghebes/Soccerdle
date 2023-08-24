//
//  ContentView.swift
//  GuessWhoScreenRemake
//
//  Created by Michael Ghebranious on 8/14/23.
//

import SwiftUI

class AllCharacters{
    @AppStorage("level") var currentLevel: Int = 1
    
    final var allCharacters: [LetterType] {
        var necessaryLetters = LevelInformation().levels[currentLevel - 1].letters
        while(necessaryLetters.count < 14){
            let randomNumber = Int.random(in: 65..<91)
            let randomUnicodeScalar = UnicodeScalar(randomNumber)!
            let randomCharacter = Character(randomUnicodeScalar)
            necessaryLetters.append(LetterType(character: randomCharacter))
        }
        
        return necessaryLetters.shuffled()
    }
}
