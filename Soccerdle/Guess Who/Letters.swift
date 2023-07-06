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


struct Letters: View {
    
    @State var level: Level = levels[0]
    @State var guesses: [LetterType] = Array(repeating: LetterType(character: "2"), count: 5)
    @State var letterOrder: Int  = 0
    @State var finalLettersTest: [LetterType] = []
    @State var clickedArray : [Bool] = Array(repeating: false, count: 14)
    @Binding var won: Bool
    @State var incorrect: Bool = false
    
    var allLetters: [LetterType] {
        
        var necessaryLetters = level.letters
        
        while (necessaryLetters.count <= 13) {
            let randomNumber: Int = .random(in: 65..<91)
            let randomCharacter: Character = Character(unicodeScalarLiteral: .init(Unicode.Scalar(randomNumber)!))
            necessaryLetters.append(LetterType(character: randomCharacter))
        }
        return necessaryLetters.shuffled()
    }
    
    func playerWon() -> Bool{
        if(amountFilled() == level.letters.count){
            //check to see if the answer is correct
            print(guesses)
            print(level.letters)
            
            for index in level.letters.indices{
                if(guesses[index].character != level.letters[index].character){
                    won = false
                    incorrect = true
                    print(won)
                    print(incorrect)
                    return false
                    
                }
            }
            
            won = true
            incorrect = false
            return true
        }else{
            won = false
            incorrect = false
            return false
        }
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

    /*
     The issue is that the clicked attribute is assigned to the letter and not to the array so changing the array does nothing
     */
    
    
    var body: some View {
            VStack(spacing: 10){
                HStack{
                    ForEach(level.letters.indices){ index in
                        GuessingLetters(guesses: $guesses, position: index)
                            
      
                    }
                }
                
                
                HStack{
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 35))]){
                        ForEach(finalLettersTest){ letter in
                            Letter(letter: letter, guesses: $guesses, letterOrder: $letterOrder, clickedArray: $clickedArray, allLetters: $finalLettersTest)
                                
                                
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
                            
                            let idToRemove = guesses[amountFilled() - 1].id
                            
                           //look for id
                            guard let correctIndex = finalLettersTest.firstIndex(where: {$0.id == idToRemove}) else {
                                print("ERROR")
                                return
                            }
                            clickedArray[correctIndex] = false
                            
                            
                            guesses[amountFilled() - 1] = LetterType(character: "2")
                        }
                    }
                    
                        
                        
                }
                .frame(width: .infinity, alignment: .leading)
                .onAppear{
                    finalLettersTest = allLetters
                    
                }
            }
            .blur(radius: playerWon() ? 10: 0)
           
        
    }
}

struct Letters_Previews: PreviewProvider {
    static var previews: some View {
        Letters( won: .constant(false))
    }
}
