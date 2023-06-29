//
//  Letters.swift
//  Soccerdle
//
//  Created by Michael Ghebranious on 6/29/23.
//

import SwiftUI
struct LetterType: Identifiable {
    let id = UUID()
    let character: Character
    var clicked: Bool = false
}

struct Letters: View {
    
    @State var level: Level = levels[0]
    @State var guesses: [LetterType] = []
    
    var allLetters: [LetterType] {
        var necessaryLetters = level.letters
        
        while (necessaryLetters.count <= 13) {
            let randomNumber: Int = .random(in: 65..<91)
            let randomCharacter: Character = Character(unicodeScalarLiteral: .init(Unicode.Scalar(randomNumber)!))
            necessaryLetters.append(LetterType(character: randomCharacter))
        }
        return necessaryLetters.shuffled()
    }
    
    var body: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 40))]){
            ForEach(allLetters){ letter in
                Letter(letter: letter, guesses: $guesses)
            }
        }
        .frame(width: 350)
    }
}

struct Letters_Previews: PreviewProvider {
    static var previews: some View {
        Letters()
    }
}
