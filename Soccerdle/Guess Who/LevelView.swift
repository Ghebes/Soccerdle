//
//  LevelView.swift
//  Soccerdle
//
//  Created by Michael Ghebranious on 6/19/23.
//

import SwiftUI

struct LevelView: View {
    @AppStorage("level") var currentLevel: Int = 1
    @AppStorage("coins") var coinsAmount: Int = 100
    @State var level: Level = LevelInformation().levels[0]
    @ObservedObject var navigationValues: NavigationValues
    var body: some View {
        
        ZStack{
            Button{
                navigationValues.showAllLevels = false
                navigationValues.showHome = false
                navigationValues.showStore = false
                navigationValues.showSoccerdle = false
                navigationValues.showGuessWho = true

            }label: {
                Text(String(level.number))
                    .font(.custom("PT Sans Caption Bold", size: 28))
            }
            
        }
        .foregroundColor(.black)
        .frame(width: 55, height: 55)
        .background(currentLevel == level.number ? .white : currentLevel > level.number ? Color("correct") : Color("wordleBackground"))
        .cornerRadius(15)
        .disabled(currentLevel != level.number)
 
        
    }
}
