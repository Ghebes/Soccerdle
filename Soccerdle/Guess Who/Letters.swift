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
    @AppStorage("guessWho") var guessWho: [Bool] = Array(repeating: false, count: LevelInformation().levels.count)
    @AppStorage("level") var currentLevel: Int = 1
    
    @State var calledOnce: Bool = false
    @State var calculateCoins = {}
    @State var level: Level = LevelInformation().levels[0]
    @Binding var guesses: [LetterType]
    @State var letterOrder: Int  = 0
    @State var finalLettersTest: [LetterType] = []
    @State var clickedArray : [Bool] = Array(repeating: false, count: 14)
    @Binding var won: Bool
    @Binding var incorrect: Bool
    @Binding var hint: Bool
    @Binding var reveal: Bool
    @Binding var instructions: Bool
    
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
            
            for index in level.letters.indices{
                if(guesses[index].character != level.letters[index].character){
                    DispatchQueue.main.async {
                        won = false
                        withAnimation(.easeInOut(duration: 0.5).repeatCount(2)){
                            incorrect = true
                        }
                    }
                   
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2){
                        withAnimation(.easeOut(duration: 0.5)){
                            incorrect = false
                        }
                    }
                    return false
                }
                
            }

            //taking time to restart for some reason
            DispatchQueue.main.async {
                
                
                won = true
                print("ONCE ", calledOnce)
                if(!calledOnce){
                    
                    calculateCoins()
                    calledOnce = true
                    currentLevel += 1
                    print(currentLevel)
                    print("STOP")
                }
                if(level.number < 3000 ){
                    guessWho[level.number - 1] = true
                }
                incorrect = false
                
            }
            return true
        }else{
            DispatchQueue.main.async {
                won = false
                incorrect = false
            }
            
            
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
    
    
    
    var body: some View {
        VStack(spacing: 10){
            HStack{
                ForEach(level.letters.indices){ index in
                    GuessingLetters(guesses: $guesses, position: index, incorrect: $incorrect)
                    
                    
                }
            }
            .offset(y: incorrect ? 2 : -2)
            
            
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
            .frame(maxWidth: .infinity, alignment: .leading)
            .onAppear{
                finalLettersTest = allLetters
                
            }
        }
        .blur(radius: ((playerWon() && reveal) || hint || instructions)  ? 10: 0)
        
        
    }
}

struct Letters_Previews: PreviewProvider {
    static var previews: some View {
        Letters(calculateCoins: {},guesses: .constant([LetterType(character: "2"),LetterType(character: "2"),LetterType(character: "2"),LetterType(character: "2"),LetterType(character: "2")]), won: .constant(false), incorrect: .constant(false), hint: .constant(false), reveal: .constant(false), instructions: .constant(false))
    }
}
