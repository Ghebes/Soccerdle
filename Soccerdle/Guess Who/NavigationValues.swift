//
//  NavigationValues.swift
//  Soccerdle
//
//  Created by Michael Ghebranious on 8/29/23.
//

import SwiftUI

class NavigationValues: ObservableObject {
    @Published var showAllLevels: Bool = false
    @Published var showGuessWho: Bool = false
    @Published var showStore: Bool = false
    @Published var showHome: Bool = true
    @Published var showSoccerdle: Bool = false
}

struct AllNavigation: View {
    @AppStorage("level") var currentLevel: Int = 1
    @StateObject var navigation = NavigationValues()
    var body: some View {
        VStack{
            if(navigation.showHome){
                HomeView(navigationValues: navigation)
                    .transition(.asymmetric(insertion: .move(edge: .leading) , removal: .move(edge: .trailing)).combined(with: .opacity))
                    .animation(.default)
            }else if(navigation.showStore){
                Store(navigationValues: navigation)
                    .transition(.asymmetric(insertion: .move(edge: .leading) , removal: .move(edge: .trailing)))
                    .animation(.default)
            }else if(navigation.showAllLevels){
                GuessLevelsView(navigationValues: navigation)
                    .transition(.asymmetric(insertion: .move(edge: .trailing) , removal: .move(edge: .trailing).combined(with: .opacity)))
                    .animation(.default)
            }else if (navigation.showGuessWho){
                if(currentLevel - 1 < LevelInformation().levels.count){
                    GuessWhoView(navigationValues: navigation, level: LevelInformation().levels[currentLevel - 1], guesses: Array(repeating: LetterType(character: " "), count: LevelInformation().levels[currentLevel - 1].letters.count), won: false)
                        .transition(.asymmetric(insertion: .move(edge: .trailing) , removal: .opacity))
                        .animation(.default)
                }else{
                    GuessLevelsView(navigationValues: navigation)
                        .onAppear{
                            navigation.showGuessWho = false
                            navigation.showAllLevels
                        }
                }
            }else if(navigation.showSoccerdle){
                SoccerdleView(navigationValues: navigation)
                    .transition(.asymmetric(insertion: .move(edge: .trailing) , removal: .opacity))
                    .animation(.default)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Color("background"))
        
    }
}


