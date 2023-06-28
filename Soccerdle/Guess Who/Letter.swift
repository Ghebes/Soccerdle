//
//  Letter.swift
//  Soccerdle
//
//  Created by Michael Ghebranious on 6/24/23.
//

import SwiftUI

struct Letter: View {
    @State var letter: Letters = Letters(letter: Character("A"))
    @State var guesses: [Letters] = []
    var body: some View {
        VStack{
            Text(String(letter.letter))
                    .font(.custom("PT Sans Caption Bold", size: 24))
        }
        .frame(width: 40, height: 40)
        .background(letter.clicked ? Color("wordleBackground").opacity(0.6) : Color("questionMark"))
        .cornerRadius(5)
        .overlay{
            RoundedRectangle(cornerRadius: 5)
                .stroke(style: StrokeStyle(lineWidth: 1))
        }
        .onTapGesture {
            letter.clicked = true
            guesses.append(letter)
            print(guesses)
        }

        
    }
        
}

struct Letter_Previews: PreviewProvider {
    static var previews: some View {
        Letter()
    }
}

