//
//  GuessLevelsView.swift
//  Soccerdle
//
//  Created by Michael Ghebranious on 6/19/23.
//

import SwiftUI

struct GuessLevelsView: View {
    @AppStorage("coins") var coinsAmount: Int = 100
    @Environment(\.dismiss) var dismiss
    let columns: [GridItem] = Array(repeating: GridItem(.flexible()), count: 5)
    
    var body: some View {
        NavigationStack{
            VStack{
                ScrollView(.vertical){
                    HeaderView(coinsAmount: coinsAmount, action: dismiss, title: "Guess Who ")
                    
                    LazyVGrid(columns: columns, spacing: 30){
                        ForEach(LevelInformation().levels){level in
                            LevelView(level: level)
                            
                            
                        }
                    }
                    
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color("background"))
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .navigationBarBackButtonHidden()
        }
        .navigationBarBackButtonHidden()
        .frame(maxHeight: .infinity, alignment: .top)
    }
}

struct GuessLevelsView_Previews: PreviewProvider {
    static var previews: some View {
        GuessLevelsView()
    }
}
