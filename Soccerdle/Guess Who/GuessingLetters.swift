//
//  GuessingLetters.swift
//  Soccerdle
//
//  Created by Michael Ghebranious on 6/29/23.
//

import SwiftUI

struct GuessingLetters: View {
    @State var letter = LetterType(character: "2", clicked: false)
    
    var body: some View {
        VStack{
            Text(letter.character == "2" ? "" : String(letter.character))
                .font(.custom("PT Sans Caption Bold", size: 24))
        }
        .frame(width: 34, height: 34)
        .background(letter.clicked ? Color("questionMark") : .clear)
        .overlay{
            RoundedRectangle(cornerRadius: 5)
                .stroke(lineWidth: 1)
        }
        .shadow(radius: 4)
    }
}

struct GuessingLetters_Previews: PreviewProvider {
    static var previews: some View {
        GuessingLetters()
    }
}
