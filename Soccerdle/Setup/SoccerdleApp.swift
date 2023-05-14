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
    
    var body: some Scene {
        WindowGroup {
            HomeView()
            
        }
    }
}
