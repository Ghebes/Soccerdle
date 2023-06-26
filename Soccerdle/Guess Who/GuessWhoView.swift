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
    
    var body: some View {
        VStack{
            HeaderView(coinsAmount: coinsAmount, action: dismiss, title: "Guess Who")
                .padding(.bottom, 30)
            
            DisappearingImageView(image: level.imageName)

            //Answer
            HStack(spacing: 13){
                ForEach(level.letters) { letters in
                    Letter(character: letters.letter, hidden: true)
                }
            }
            .padding(.top, 20)
            
            LetterOptions(level: $level)
            Spacer()
            
            FooterView(hintScreen: $hintScreen, revealAnswerAlert: $revealAnswer, showInstructions: $showInstructions)
           
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Color("background"))
        .navigationBarBackButtonHidden()
            
    }
}


struct GuessWhoView_Previews: PreviewProvider {
    static var previews: some View {
        GuessWhoView(level: Binding.constant(levels[0]))
    }
}
