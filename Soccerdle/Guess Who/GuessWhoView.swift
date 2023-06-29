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
        VStack(spacing: 30){
            HeaderView(coinsAmount: coinsAmount, action: dismiss, title: "Guess Who")
            
            DisappearingImageView(image: level.imageName)
            
            
            
         
            
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
