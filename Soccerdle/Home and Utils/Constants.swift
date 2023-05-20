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

enum Club: String {
    //Premier League
    case bournemouth = "Bournemouth"
    case arsenal = "Arsenal"
    case astonVilla = "Aston Villa"
    case brentford = "Brentford"
    case brighton = "Brighton"
    case chelsea = "Chelsea"
    case crystal = "Crystal Palace"
    case everton = "Everton"
    case fulham = "Fulham"
    case leeds = "Leeds"
    case leicester = "Leicester"
    case liverpool = "Liverpool"
    case manCity = "ManCity"
    case manUnited = "ManUnited"
    case newcastle = "Newcastle"
    case nottingham = "Nottingham"
    case southampton = "Southampton"
    case tottenham = "Tottenham"
    case westHam = "West Ham"
    case wolves = "Wolves"
    
    //La Liga
    case barcelona = "Barcelona"
    case realMadrid = "Real Madrid"
    case althetico = "Athletico Madrid"
    case realSociedad = "Real Sociedad"
    case villareal = "Villareal"
    case realBetis = "Real Betis"
    case athletic = "Athletic"
    case sevilla = "Sevilla"
    case valencia = "Valencia"
    
    
    //Ligue 1
    case psg = "PSG"
    case lens = "Lens"
    case marseille = "Marseille"
    case monaco = "Monaco"
    case losc = "LOSC"
    case rennes = "Rennes"
    case lyon = "Lyon"
    
    //Bundesliga
    case bayern = "Bayern"
    case dortmund = "Dortmund"
    case rbLeipzig = "RB Leipzig"
    case wolfsburg = "Wolfsburg"
    case leverkusen = "Leverkusen"
    case frankfurt = "Frankfurt"
    
    //Serie A
    case napoli = "Napoli"
    case juventus = "Juventus"
    case inter = "Inter"
    case milan = "Milan"
    case lazio = "Lazio"
    case roma = "Roma"
    case atlanta = "Atlanta"
    case fiorentina = "Fiorentina"
    
}

enum Nation: String {
    case albania = "Albania"
    case algeria = "Algeria"
    case angola = "Angola"
    case argentina = "Argentina"
    case armenia = "Armenia"
    case australia = "Australia"
    case austria = "Austria"
    case belgium = "Belgium"
    case bosnia = "Bosnia"
    case brazil = "Brazil"
    case bulgaria = "Bulgaria"
    case burkina = "Burkina"
    case cameroon = "Cameroon"
    case canada = "Canada"
    case capeVerde = "Cape Verde Islands"
    case centralAfrican = "Central African Republic"
    case chile = "Chile"
    case colombia = "Colombia"
    case congodr = "Congo DR"
    case costa = "Costa Rica"
    case coteDeIvoire = "Cote de Ivoire"
    case croatia = "Croatia"
    case czech = "Czech Republic"
    case denmark = "Denmark"
    case ecuador = "Ecuador"
    case egypt = "Egypt"
    case england = "England"
    case equatorial = "Equatorial Guinea"
    case finland = "Finland"
    case france = "France"
    case macedonia = "FYR Macedonia"
    case gabon = "Gabon"
    case gambia = "Gambia"
    case georgia = "Georgia"
    case germany = "Germany"
    case ghana = "Ghana"
    case greece = "Greece"
    case guinea = "Guinea"
    case honduras = "Honduras"
    case hungary = "Hungary"
    case iceland = "Iceland"
    case iran = "Iran"
    case israel = "Israel"
    case italy = "Italy"
    case jamaica = "Jamaica"
    case japan = "Japan"
    case kenya = "Kenya"
    case korea = "Korea Republic"
    case kosovo = "Kosovo"
    case liberia = "Liberia"
    case libya = "Libya"
    case mali = "Mali"
    case malta = "Malta"
    case mexico = "Mexico"
    case montenegro = "Montenegro"
    case morocco = "Morocco"
    case mozambique = "Mozambique"
    case namibia = "Namibia"
    case netherlands = "Netherlands"
    case newZealand = "New Zealand"
    case nigeria = "Nigeria"
    case northernIreland = "Northern Ireland"
    case norway = "Norway"
    case paraguay = "Paraguay"
    case peru = "Peru"
    case poland = "Poland"
    case portugal = "Portugal"
    case ireland = "Republic of Ireland"
    case romania = "Romania"
    case russia = "Russia"
    case saudi = "Saudi Arabia"
    case scotland = "Scotland"
    case senegal = "Senegal"
    case serbia = "Serbia"
    case slovakia = "Slovakia"
    case slovenia = "Slovenia"
    case southAfrica = "South Africa"
    case spain = "Spain"
    case suriname = "Suriname"
    case sweden = "Sweden"
    case switzerland = "Switzerland"
    case togo = "Togo"
    case trinidad = "Trinidad and Tobago"
    case tunisia = "Tunisia"
    case turkey = "Turkey"
    case ukraine = "Ukraine"
    case unitedStates = "United States"
    case uruguay = "Uruguay"
    case uzbekistan = "Uzbekistan"
    case venezuela = "Venezuela"
    case wales = "Wales"
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


