//
//  SoccerdleApp.swift
//  Soccerdle
//
//  Created by Michael Ghebranious on 5/13/23.
//

import SwiftUI

@main
struct SoccerdleApp: App {
    @AppStorage("coins", store: .standard) var coins: Int = 100
    //@AppStorage("guessWho", store: .standard) var guess: [Bool] = [false, false]
    @AppStorage("level", store: .standard) var currentLevel: Int = 1
    var body: some Scene {
        WindowGroup {
            GuessLevelsView()
                .preferredColorScheme(.light)
            
        }
    }
}
