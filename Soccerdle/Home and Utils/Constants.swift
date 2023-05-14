//
//  Constants.swift
//  Soccerdle
//
//  Created by Michael Ghebranious on 5/14/23.
//

import Foundation

enum Constants: String {
    case specificPosition = "specificPosition"
    case generalPosition = "generalPosition"
    case nation = "nation"
    case league = "league"
    case club = "club"
    case age = "age"
}

enum Club {
    
}

enum League: String{
    case premier = "Premier"
    case laLiga = "La Liga"
    case bundesliga = "Bundesliga"
    case serieA = "Serie A"
    case ligue1 = "Ligue 1"
    
    
}

enum SpecificPosition: String{
    case rw = "RW"
    case st = "ST"
    case lw = "LW"
    case cf = "CF"
    case cam = "CAM"
    case cdm = "CDM"
    case lm = "LM"
    case rm = "RM"
    case cm = "CM"
    case lb = "LB"
    case lwb = "LWB"
    case rb = "RB"
    case rwb = "RWB"
    case cb = "CB"
    case gk = "GK"
}

enum GeneralPosition: String {
    case def = "DEF"
    case att = "ATT"
    case mid = "MID"
}
