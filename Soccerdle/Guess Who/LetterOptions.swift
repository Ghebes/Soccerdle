//
//  LetterOptions.swift
//  Soccerdle
//
//  Created by Michael Ghebranious on 6/24/23.
//

import SwiftUI


struct Letters: Identifiable, Equatable {
     
    var id = UUID()
    let letter: Character
    var clicked: Bool = false
}

struct LetterOptions: View {
    
    @Binding var level: Level
    @State var guesses: [Letters] = []
    
    private var letters: [Letters] {
        var characters = level.letters
        
        while characters.count < 14 {
            let randomValue: Int = .random(in: 65..<90)
            let addedCharacter = Character(UnicodeScalar(randomValue)!)
            characters.append(Letters(letter: addedCharacter))
        }

        return characters.shuffled()
    }
    
    
    var body: some View {
        VStack(spacing: 10.0){
            
            //Answer
            HStack(spacing: 10){
                ForEach(level.letters) { letters in
                    GuessingLetter(letterClicked: letters, guessed: guesses)
                }
            }
            .padding(.top, 20)
            
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 40))]){
                ForEach(letters) { letter in
                    Letter(letter: letter, guesses: guesses)
                       
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: 90)
        .padding(.horizontal, 22)
        .onAppear{
            guesses = Array(repeating: Letters(letter: Character("1")), count: level.letters.count)
        }
    }
}

struct LetterOptions_Previews: PreviewProvider {
    static var previews: some View {
        LetterOptions(level: Binding.constant(levels[0]))
    }
}
