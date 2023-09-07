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
    @ObservedObject var navigationValues: NavigationValues

    var body: some View {
            VStack{
                ScrollView(.vertical){
                    HeaderView(coinsAmount: coinsAmount, action: dismiss, navigationValues: navigationValues, title: "Guess Who ")
                    
    
                        LazyVGrid(columns: columns, spacing: 30){
                            ForEach(LevelInformation().levels){level in
                                LevelView(level: level, navigationValues: navigationValues)
                                
                                
                            }
                        }
                    
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
        }
        .navigationBarBackButtonHidden()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        
    }
}
