//
//  Player.swift
//  Soccerdle
//
//  Created by Michael Ghebranious on 5/13/23.
//

import Foundation
import SwiftUI

struct Player: Hashable{
    let name: String
    let generalPosition: GeneralPosition
    let specificPosition: SpecificPosition
    let club: String
    let league: League
    let nation: String
    let age: Int
    
    var playerImage: Image {
        return Image(name)
    }
   
}



var players: [Player] = [
    Player(name: "Lionel Messi", generalPosition: GeneralPosition.att, specificPosition: SpecificPosition.rw, club: "PSG", league: League.ligue1, nation: "Argentina", age: 35)
]
