//
//  LetterOptions.swift
//  Soccerdle
//
//  Created by Michael Ghebranious on 6/24/23.
//

import SwiftUI


struct LetterOptions: View {
    
    @Binding var level: Level
    
    private var letters: [Character] {
        var characters = level.neededCharacters
        
        while characters.count < 14 {
            let randomValue: Int = .random(in: 65..<90)
            let addedCharacter = Character(UnicodeScalar(randomValue)!)
            characters.append(addedCharacter)
        }
        
        return characters
    }
    
    var body: some View {
        VStack{
            HStack{
                ForEach(letters.prefix(7), id: \.asciiValue){ letter in
                    Letter(character: letter)
                }
            }
            .onAppear{
                print(letters)
            }
            HStack{
                ForEach(letters, id: \.asciiValue){ letter in
                    Letter(character: letter)
                }
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: 45)
        .padding(.horizontal, 22)
        .onAppear{
            print(letters)
            print(letters.count)
        }
    }
}

struct LetterOptions_Previews: PreviewProvider {
    static var previews: some View {
        LetterOptions(level: Binding.constant(levels[0]))
    }
}
