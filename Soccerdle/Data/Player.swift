//
//  Player.swift
//  Soccerdle
//
//  Created by Michael Ghebranious on 5/13/23.
//

import Foundation
import SwiftUI

struct Player{
    let name: String
    let generalPosition: String
    let specificPosition: String
    let club: String
    let league: String
    let nation: String
    let age: String
    
    var playerImage: Image {
        return Image(name)
    }
    
    var leagueImage: Image{
        return Image(league)
    }
    
    var clubImage: Image {
        return Image(club)
    }
}
