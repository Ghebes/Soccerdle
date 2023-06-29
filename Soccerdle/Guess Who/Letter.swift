//
//  Letter.swift
//  Soccerdle
//
//  Created by Michael Ghebranious on 6/29/23.
//

import SwiftUI

struct Letter: View {
    @State var letter: LetterType = LetterType(character: Character(("A")))
    @Binding var guesses: [LetterType]
    var id: UUID {
        return UUID()
    }
    var body: some View {
        VStack{
            Text(String(letter.character))
                .font(.custom("PT Sans Caption Bold", size: 24))
        }
        .frame(width: 37, height: 37, alignment: .center)
        .background(letter.clicked ? Color("wordleBackground").opacity(0.6) : Color("questionMark"))
        .cornerRadius(5)
        .onTapGesture {
            letter.clicked = true
            guesses.append(letter)
            print(guesses)
        }
    }
}

struct Letter_Previews: PreviewProvider {
    static var previews: some View {
        Letter(guesses: .constant([]))
    }
}
