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
    
    @State var addedCoins: Int = 0
    @State var hintScreen: Bool = false
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
            won = false
        }
        .opacity(won ? 1 : 0)
    }
    
    private var hint: some View {
        VStack{
            Text("HINT")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.blue)
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
                
                Letters(calledOnce: calledOnce, calculateCoins: calculateCoins, level: level, won: $won, incorrect: $incorrect)
                
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
