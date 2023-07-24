//
//  GuessWhoView.swift
//  Soccerdle
//
//  Created by Michael Ghebranious on 6/19/23.
//

import SwiftUI

struct GuessWhoView: View {
    @AppStorage("coins") var coinsAmount: Int = 100
    @Environment(\.dismiss) var dismiss
    
    @Binding var level: Level
    
    @State var calledOnce: Bool = false
    @State var guesses: [LetterType] = Array(repeating: LetterType(character: "2"), count: 5)
    @State var addedCoins: Int = 0
    @State var hintScreen: Bool = true
    @State var revealAnswer: Bool = false
    @State var showInstructions: Bool = false
    @State var won: Bool = false
    @State var incorrect: Bool = false
    @State var nextLevel: Level = LevelInformation().levels[0]
    @State var imagesRemoved: Int = 0

    private var winScreen: some View {
        VStack(spacing: 2.0){
            HStack(alignment: .center, spacing: 10.0){
                Text(String(addedCoins))
                    .foregroundColor(Color("correct"))
                    .font(.custom("PT Sans Caption Bold", size: 34))
                
                Image("coins")
                    .resizable()
                    .foregroundColor(Color("correct"))
                    .frame(width: 30, height: 30)
            }
            
            Text("Correct!")
                .foregroundColor(Color("correct"))
                .padding(.horizontal, 10)
                .font(.custom("PT Sans Caption Bold", size: 36))
                .overlay{
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(lineWidth: 4)
                        .foregroundColor(Color("correct"))
                    
                }
            
            Image("balloons")
                .resizable()
                .frame(width: 150, height: 150)
            
            NavigationLink{
                //check if there is a next level
                if(level.number <= LevelInformation().levels.count){
                    GuessWhoView(level: $nextLevel)
                }else{
                    GuessLevelsView()
                }
            }label: {
                Text("Next Level")
                    .foregroundColor(.black)
                    .padding(.horizontal, 20)
                    .frame(width: 150, height: 30)
                    .background(Color("correct"))
                    .cornerRadius(10)
                    .font(.custom("PT Sans Caption", size: 20))
                
            }
            
            
            
        }
        .frame(width: 225 , height: 350)
        .background(.white)
        .cornerRadius(50)
        .offset(y: -30)
        .onAppear{
            guard let levelNext = LevelInformation().levels.first(where: {$0.number == level.number + 1}) else {
                nextLevel = Level(number: 10000, playerName: "", lastName: "")
                return
            }
            nextLevel = levelNext
            calledOnce = false
            print("HELLO THERE ", won)
        }
        .opacity(won ? 1 : 0)
    }
    
    private var hint: some View {
        VStack{
            Text("Are you sure you want to spend 50 coins for a hint?")
                .foregroundColor(.black)
                .font(.custom("PT Sans Caption Bold", size: 25))
                .padding(.horizontal, 10)
                .multilineTextAlignment(.center)
            
            HStack(spacing: 10){
                Button{
                    coinsAmount -= 50
                    var leftLetters: [LetterType] = []
                    for index in level.letters.indices {
                        if(guesses[index].character == "2"){
                            leftLetters.append(level.letters[index])
                        }
                    }
                    print(leftLetters)
                    print(level.letters)
                    guard let correctLetter = leftLetters.randomElement(),
                          let index = level.letters.firstIndex(where: {$0.id == correctLetter.id})
                    else {
                        print("OOPS")
                        return
                    }
                    print(correctLetter)
                   
                    
                    guesses[index] = level.letters[index]
                    print(guesses)
                }label: {
                    Text("YES")
                        .foregroundColor(.white)
                        
                        
                }
                .frame(maxWidth: .infinity, maxHeight: 50)
                .background(Color("correct"))
                .cornerRadius(10)
                .padding(.leading, 10)
                
                Button{
                    hintScreen = false
                }label: {
                    Text("NO")
                        .foregroundColor(.white)
                    
                }
                .frame(maxWidth: .infinity, maxHeight: 50)
                .background(Color("wrong"))
                .cornerRadius(10)
                .padding(.trailing, 10)
            }
        }
        .frame(width: 225 , height: 250)
        .background(.white)
        .cornerRadius(30)
        .offset(y: -30)
        .opacity(hintScreen ? 1 : 0)
    }
    
    private var instructions: some View {
        VStack{
            Text("INSTRUCTIONS")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
        .opacity(showInstructions ? 1 : 0)
    }
    
    private var reveal: some View {
        VStack{
            Text("Reveal Answer")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.green)
        .opacity(revealAnswer ? 1 : 0)
    }
    
   
    func calculateCoins() {
        addedCoins = 9 - imagesRemoved
        coinsAmount += addedCoins
    }
    
    
    var body: some View {
        ZStack{
            VStack(spacing: 30){
                HeaderView(coinsAmount: coinsAmount, action: dismiss, title: "Guess Who")
                
                DisappearingImageView(image: level.imageName, won: $won, imagesRemoved: $imagesRemoved)
                
                Letters(calledOnce: calledOnce, calculateCoins: calculateCoins, level: level, guesses: $guesses, won: $won, incorrect: $incorrect)
                
                FooterView(hintScreen: $hintScreen, revealAnswerAlert: $revealAnswer, showInstructions: $showInstructions)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .background(Color("background"))
            .navigationBarBackButtonHidden()
            
            winScreen
            
            hint
            instructions
            reveal
        }
        
    }
    
}



struct GuessWhoView_Previews: PreviewProvider {
    static var previews: some View {
        GuessWhoView(level: Binding.constant(LevelInformation().levels[0]))
    }
}
