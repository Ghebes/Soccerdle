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
    @Binding var letterOrder: Int
    @Binding var clickedArray: [Bool]
    @Binding var allLetters: [LetterType]
    
    var clickedValue: Bool {
        guard let index = allLetters.firstIndex(where: {$0.id == letter.id}) else {
            print("ERROR")
            return false
        }
        return clickedArray[index]
    }
    func guessesFilled() -> Bool {
        var bool = true
        for guess in guesses {
            if(guess.character == Character("2")){
                bool = false
            }
        }
        return bool
    }
    

    var body: some View {
        VStack{
            Text(String(letter.character))
                .font(.custom("PT Sans Caption Bold", size: 24))
        }
        .frame(width: 37, height: 37, alignment: .center)
        .background(clickedValue ? Color("wordleBackground").opacity(0.6) : Color("questionMark"))
        .cornerRadius(5)
        .onTapGesture {
            if(!guessesFilled()){
                guard let index = allLetters.firstIndex(where: {$0.id == letter.id}) else {
                    print("ERROR")
                    return
                }
                clickedArray[index] = true
                
                if let i = guesses.firstIndex(where: {$0.character == Character("2")}){
                    guesses[i] = letter
                    
                    letterOrder += 1
                }
            }
            
            
        }
        .disabled(clickedValue)
        }
}

struct Letter_Previews: PreviewProvider {
    static var previews: some View {
        Letter(guesses: .constant([]), letterOrder: .constant(0), clickedArray: .constant(Array(repeating: false, count: 14)), allLetters: .constant([]))
    }
}
