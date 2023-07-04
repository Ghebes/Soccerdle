//
//  Letters.swift
//  Soccerdle
//
//  Created by Michael Ghebranious on 6/29/23.
//

import SwiftUI
struct LetterType: Identifiable {
    let id = UUID()
    let character: Character
    var clicked: Bool = false
}

/**
 What's happening is that the incremented value of position is working; however, whenever the view finishes appearing the position is set to 4
 Therefore whenever the 4th element is added, all of the GuessingLetters are filled in
 */
struct Letters: View {
    
    @State var level: Level = levels[0]
    @State var guesses: [LetterType] = Array(repeating: LetterType(character: "2"), count: 5)
    @State var letterOrder: Int  = 0
    
    var allLetters: [LetterType] {
        var necessaryLetters = level.letters
        
        while (necessaryLetters.count <= 13) {
            let randomNumber: Int = .random(in: 65..<91)
            let randomCharacter: Character = Character(unicodeScalarLiteral: .init(Unicode.Scalar(randomNumber)!))
            necessaryLetters.append(LetterType(character: randomCharacter))
        }
        return necessaryLetters.shuffled()
    }
    
    func amountFilled() -> Int {
        var count = 0
        for guess in guesses {
            if(guess.character != Character("2")){
                count += 1
            }
        }
        return count
    }
    var body: some View {
        VStack(spacing: 10){
            HStack{
                ForEach(level.letters.indices){ index in
                    GuessingLetters(guesses: $guesses, position: index)
                        
                        
                }
            }
            
            HStack{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 35))]){
                    ForEach(allLetters){ letter in
                        Letter(letter: letter, guesses: $guesses, letterOrder: $letterOrder)
                    }
                }
                .frame(width: 330)
                
                VStack{
                    Image(systemName: "delete.left")
                        .resizable()
                        .frame(width: 20, height: 25)
                }
                .foregroundColor(.white)
                .frame(width: 40, height: 80)
                .background(Color("wrong"))
                .cornerRadius(10)
                .onTapGesture {
                    if(amountFilled() != 0){
                        print(amountFilled())
                        guesses[amountFilled() - 1] = LetterType(character: "2")
                    }
                }
                
                    
                    
            }
            .frame(width: .infinity, alignment: .leading)
        }
    }
}

struct Letters_Previews: PreviewProvider {
    static var previews: some View {
        Letters()
    }
}
