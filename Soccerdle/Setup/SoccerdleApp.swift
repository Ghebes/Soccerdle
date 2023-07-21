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
    @AppStorage("level", store: .standard) var currentLevel: Int = 1
    @AppStorage("guessWho", store: .standard) var guessWho: [Bool] = Array(repeating: false, count: LevelInformation().levels.count)
    var body: some Scene {
        WindowGroup {
            HomeView()
                .preferredColorScheme(.light)
            
        }
    }
}


extension Array: RawRepresentable where Element: Codable {
    public init?(rawValue: String) {
        guard let data = rawValue.data(using: .utf8),
              let result = try? JSONDecoder().decode([Element].self, from: data)
        else {
            return nil
        }
        self = result
    }

    public var rawValue: String {
        guard let data = try? JSONEncoder().encode(self),
              let result = String(data: data, encoding: .utf8)
        else {
            return "[]"
        }
        return result
    }
}
