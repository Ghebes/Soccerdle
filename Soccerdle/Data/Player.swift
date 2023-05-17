//
//  Player.swift
//  Soccerdle
//
//  Created by Michael Ghebranious on 5/13/23.
//

import Foundation
import SwiftUI

struct Player: Hashable{
    let firstName: String
    let lastName: String
    let generalPosition: GeneralPosition
    let specificPosition: SpecificPosition
    let club: Club
    let league: League
    let nation: Nation
    let age: Int

    
    var playerImage: Image {
        return Image(name)
    }
    
    var name: String {
        return firstName + " " + lastName
    }
   
}



var players: [Player] = [
    Player(firstName: "Lionel", lastName: "Messi", generalPosition: GeneralPosition.att, specificPosition: SpecificPosition.rw, club: .psg, league: League.ligue1, nation: .argentina, age: 35),
    Player(firstName: "Karim", lastName: "Benzema", generalPosition: .att, specificPosition: .cf, club: .realMadrid, league: .laLiga, nation: .france, age: 35),
    Player(firstName: "Robert", lastName: "Lewandowski", generalPosition: .att, specificPosition: .st, club: .barcelona, league: .laLiga, nation: .poland, age: 34),
    Player(firstName: "Kylian", lastName: "Mbappe", generalPosition: .att, specificPosition: .st, club: .psg, league: .ligue1, nation: .france, age: 24),
    Player(firstName: "Kevin De", lastName: "Bruyne", generalPosition: .mid, specificPosition: .cm, club: .manCity, league: .premier, nation: .belgium, age: 31),
    Player(firstName: "Mohamed", lastName: "Salah", generalPosition: .att, specificPosition: .rw, club: .liverpool, league: .premier, nation: .egypt, age: 30),
    Player(firstName: "Virgil", lastName: "Van Dijk", generalPosition: .def, specificPosition: .cb, club: .liverpool, league: .premier, nation: .netherlands, age: 31),
    Player(firstName: "Thibaut", lastName: "Courtois", generalPosition: .def, specificPosition: .gk, club: .realMadrid, league: .laLiga, nation: .belgium, age: 31),
    Player(firstName: "Manuel", lastName: "Neuer", generalPosition: .def, specificPosition: .gk, club: .bayern, league: .bundesliga, nation: .germany, age: 37),
    
]
