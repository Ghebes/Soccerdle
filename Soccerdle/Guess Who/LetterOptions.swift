//
//  LetterOptions.swift
//  Soccerdle
//
//  Created by Michael Ghebranious on 6/24/23.
//

import SwiftUI


struct Letters: Identifiable {
     
    var id = UUID()
    let letter: Character

}

struct LetterOptions: View {
    
    @Binding var level: Level
    @State var first: [Letters] = []
    @State var second: [Letters] = []
    
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
        VStack{
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 40))]){
                ForEach(letters) { letter in
                    Letter(character: letter.letter)
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: 90)
        .padding(.horizontal, 22)
        
    }
}

struct LetterOptions_Previews: PreviewProvider {
    static var previews: some View {
        LetterOptions(level: Binding.constant(levels[0]))
    }
}
