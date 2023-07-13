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
    
    var body: some View {
        VStack{
            NavigationLink{
                    GuessWhoView(level: $level)
                
            }label: {
                Text(String(level.number))
                    .foregroundColor(level.completed ? .white : .black)
                    .font(.custom("PT Sans Caption Bold", size: 28))
            }
        }
        .frame(width: 55, height: 55)
        .background(currentLevel == level.number ? .white: level.completed ? Color("correct") : Color("wordleBackground"))
        .cornerRadius(15)
        .onAppear {
            print("HERE")
        }
    }
}

struct LevelView_Previews: PreviewProvider {
    static var previews: some View {
        LevelView(level: levels[0])
    }
}
