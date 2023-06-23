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
    
    var body: some View {
        VStack{
            HeaderView(coinsAmount: coinsAmount, action: dismiss, title: "Guess Who")
                .padding(.bottom, 40)
            
           
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Color("background"))
            
    }
}

struct GuessWhoView_Previews: PreviewProvider {
    static var previews: some View {
        GuessWhoView(level: Binding.constant(levels[0]))
    }
}
