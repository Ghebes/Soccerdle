//
//  GuessWhoNavigation.swift
//  Soccerdle
//
//  Created by Michael Ghebranious on 8/29/23.
//

import SwiftUI
class NavigationValues: ObservableObject {
    @Published var showAllLevels: Bool = true
    @Published var showGuessWho: Bool = false
    @Published var showStore: Bool = false
    @Published var showHome: Bool = false
}

struct GuessWhoNavigation: View {
    @AppStorage("level") var currentLevel: Int = 1
    @StateObject var navigation = NavigationValues()
    var body: some View {
        if(navigation.showAllLevels){
            GuessLevelsView()
        }else if (navigation.showGuessWho){
            GuessWhoView(level: LevelInformation().levels[currentLevel - 1], won: false)
        }else if(navigation.showStore){
            Store()
        }else if(navigation.showHome){
            HomeView(navigationValues: navigation)
        }
    }
}

struct GuessWhoNavigation_Previews: PreviewProvider {
    static var previews: some View {
        GuessWhoNavigation()
    }
}
