//
//  NormalLetter.swift
//  Soccerdle
//
//  Created by Michael Ghebranious on 8/23/23.
//

import SwiftUI

struct LetterType: Identifiable {
    var id = UUID()
    var character: Character
}

struct NormalLetter: View {
    @State var letter: LetterType = LetterType(character: Character((" ")))
    @Binding var clicked: Bool
    @State var guessesFilled: Bool = false
    @Binding var guesses: [LetterType]
    

    var body: some View {
        VStack{
            Text(String(letter.character))
                .font(.custom("PT Sans Caption Bold", size: 24))
        }
        .frame(width: 37, height: 37, alignment: .center)
        .background(clicked ? Color("wordleBackground").opacity(0.6) : Color("questionMark"))
        .cornerRadius(5)
        .onTapGesture {
            if(!guessesFilled){
                clicked = true
                
                if let i = guesses.firstIndex(where: {$0.character == Character(" ")}){
                    guesses[i] = letter
                    
                }
            }
            
            
        }
        .disabled(clicked)
    }
}

