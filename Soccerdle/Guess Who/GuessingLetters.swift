//
//  GuessingLetters.swift
//  Soccerdle
//
//  Created by Michael Ghebranious on 6/29/23.
//

import SwiftUI

struct GuessingLetter: View {
    @Binding var guesses: [LetterType]
    var position: Int = 0
    var body: some View {
        VStack{
            Text(guesses[position].character == " " ? "" : String(guesses[position].character))
                .font(.custom("PT Sans Caption Bold", size: 24))
        }
        .frame(width: 34, height: 34)
        .background(guesses[position].character != " " ? Color("questionMark") : .white)
        .overlay{
            RoundedRectangle(cornerRadius: 5)
                .stroke(lineWidth: 1)
        }
        .cornerRadius(5)
        .shadow(radius: 6)
        
        
        
    }
}
