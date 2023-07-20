//
//  LevelView.swift
//  Soccerdle
//
//  Created by Michael Ghebranious on 6/19/23.
//

import SwiftUI

struct LevelView: View {
    @State var level : Level
    @AppStorage("level") var currentLevel: Int = 1
    @AppStorage("guessWho") var guessWho: [Bool] = Array(repeating: false, count: LevelInformation().levels.count)
    
    var body: some View {
        VStack{
            NavigationLink{
                    GuessWhoView(level: $level)
            }label: {
                Text(String(level.number))
                    .foregroundColor(guessWho[level.number - 1] ? .white : .black)
                    .font(.custom("PT Sans Caption Bold", size: 28))
            }
        }
        .frame(width: 55, height: 55)
        .background(currentLevel == level.number ? .white: guessWho[level.number - 1] ? Color("correct") : Color("wordleBackground"))
        .cornerRadius(15)
        .disabled(currentLevel == level.number ? false : true)
        .onAppear{
            print(currentLevel)
        }
    }
}

struct LevelView_Previews: PreviewProvider {
    static var previews: some View {
        LevelView(level: LevelInformation().levels[0])
    }
}
