//
//  GuessingLetters.swift
//  Soccerdle
//
//  Created by Michael Ghebranious on 6/29/23.
//

import SwiftUI

struct GuessingLetters: View {
    @Binding var guesses: [LetterType]
    var position: Int = 0
    
    var body: some View {
        VStack{
            Text(guesses[position].character == "2" ? "" : String(guesses[position].character))
                .font(.custom("PT Sans Caption Bold", size: 24))
        }
        .frame(width: 34, height: 34)
        .background(guesses[position].character != "2" ? Color("questionMark") : .clear)
        .overlay{
            RoundedRectangle(cornerRadius: 5)
                .stroke(lineWidth: 1)
        }
        .shadow(radius: 4)
        
        
    }
}

struct GuessingLetters_Previews: PreviewProvider {
    static var previews: some View {
        GuessingLetters(guesses: .constant([LetterType(character: Character("A")), LetterType(character: Character("B"))]), position: 0)
    }
}
