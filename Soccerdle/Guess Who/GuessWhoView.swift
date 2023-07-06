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
    
    @State var hintScreen: Bool = false
    @State var revealAnswer: Bool = false
    @State var showInstructions: Bool = false
    @State var won: Bool = false
    @State var incorrect: Bool = false
    
    private var winScreen: some View {
        VStack{
            Text("WON")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.red)
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
    var body: some View {
        ZStack{
            VStack(spacing: 30){
                HeaderView(coinsAmount: coinsAmount, action: dismiss, title: "Guess Who")
                
                DisappearingImageView(image: level.imageName)
                
                Letters(level: level, won: $won, incorrect: $incorrect)
    
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
        GuessWhoView(level: Binding.constant(levels[0]))
    }
}
