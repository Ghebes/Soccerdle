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
    let level: Int

    
    var playerImage: Image {
        return Image(name)
    }
    
    var name: String {
        if(firstName == ""){
            return lastName
        }
        return firstName + " " + lastName
    }
    
    var guessImage: Image {
        return Image(lastName)
    }
   
}


//players from rating 85 are level 1
//players between 82 and 85 are level 2
//players between 80 and 82 are level 3
//level for guess who will do random of different levels


var players: [Player] = [
    Player(firstName: "Lionel", lastName: "Messi", generalPosition: GeneralPosition.att, specificPosition: SpecificPosition.rw, club: .psg, league: League.ligue1, nation: .argentina, age: 35, level: 1),
    Player(firstName: "Karim", lastName: "Benzema", generalPosition: .att, specificPosition: .cf, club: .realMadrid, league: .laLiga, nation: .france, age: 35, level: 1),
    Player(firstName: "Robert", lastName: "Lewandowski", generalPosition: .att, specificPosition: .st, club: .barcelona, league: .laLiga, nation: .poland, age: 34, level: 1),
    Player(firstName: "Kylian", lastName: "Mbappe", generalPosition: .att, specificPosition: .st, club: .psg, league: .ligue1, nation: .france, age: 24, level: 1),
    Player(firstName: "Kevin De", lastName: "Bruyne", generalPosition: .mid, specificPosition: .cm, club: .manCity, league: .premier, nation: .belgium, age: 31, level: 1),
    Player(firstName: "Mohamed", lastName: "Salah", generalPosition: .att, specificPosition: .rw, club: .liverpool, league: .premier, nation: .egypt, age: 30, level: 1),
    Player(firstName: "Virgil", lastName: "Van Dijk", generalPosition: .def, specificPosition: .cb, club: .liverpool, league: .premier, nation: .netherlands, age: 31, level: 1),
    Player(firstName: "Thibaut", lastName: "Courtois", generalPosition: .def, specificPosition: .gk, club: .realMadrid, league: .laLiga, nation: .belgium, age: 31, level: 1),
    Player(firstName: "Manuel", lastName: "Neuer", generalPosition: .def, specificPosition: .gk, club: .bayern, league: .bundesliga, nation: .germany, age: 37, level: 1),
    //START PHOTOS FROM HERE
    Player(firstName: "", lastName: "Neymar", generalPosition: .att, specificPosition: .lw, club: .psg, league: .ligue1, nation: .brazil, age: 31, level: 1),
    Player(firstName: "Heung Min", lastName: "Son", generalPosition: .att, specificPosition: .lw, club: .tottenham, league: .premier, nation: .korea, age: 30, level: 1),
    Player(firstName: "Sadio", lastName: "Mane", generalPosition: .att, specificPosition: .lw, club: .bayern, league: .bundesliga, nation: .senegal, age: 31, level: 1),
    Player(firstName: "Joshua", lastName: "Kimmich", generalPosition: .mid, specificPosition: .cdm, club: .bayern, league: .bundesliga, nation: .germany, age: 28, level: 1),
    Player(firstName: "", lastName: "Casemiro", generalPosition: .mid, specificPosition: .cdm, club: .manUnited, league: .premier, nation: .brazil, age: 31, level: 1),
    Player(firstName: "", lastName: "Alisson", generalPosition: .def, specificPosition: .gk, club: .liverpool, league: .premier, nation: .brazil, age: 30, level: 1),
    Player(firstName: "Harry", lastName: "Kane", generalPosition: .att, specificPosition: .st, club: .tottenham, league: .premier, nation: .england, age: 29, level: 1),
    Player(firstName: "", lastName: "Ederson", generalPosition: .def, specificPosition: .gk, club: .manCity, league: .premier, nation: .brazil, age: 30, level: 1),
    Player(firstName: "N'Golo", lastName: "Kante", generalPosition: .mid, specificPosition: .cdm, club: .chelsea, league: .premier, nation: .france, age: 32, level: 1),
    Player(firstName: "Jan", lastName: "Oblak", generalPosition: .def, specificPosition: .gk, club: .althetico, league: .laLiga, nation: .slovenia, age: 30, level: 1),
    Player(firstName: "Erling", lastName: "Haaland", generalPosition: .att, specificPosition: .st, club: .manCity, league: .premier, nation: .norway, age: 22, level: 1),
    Player(firstName: "Toni", lastName: "Kroos", generalPosition: .mid, specificPosition: .cm, club: .realMadrid, league: .laLiga, nation: .germany, age: 33, level: 1),
    Player(firstName: "", lastName: "Marquinhos", generalPosition: .def, specificPosition: .cb, club: .psg, league: .ligue1, nation: .brazil, age: 29, level: 1),
    Player(firstName: "Bernardo", lastName: "Silva", generalPosition: .mid, specificPosition: .cam, club: .manCity, league: .premier, nation: .portugal, age: 28, level: 1),
    Player(firstName: "Ruben", lastName: "Dias", generalPosition: .def, specificPosition: .cb, club: .manCity, league: .premier, nation: .portugal, age: 26, level: 1),
    Player(firstName: "Joao", lastName: "Cancelo", generalPosition: .def, specificPosition: .lb, club: .manCity, league: .premier, nation: .portugal, age: 28, level: 1),
    Player(firstName: "ter", lastName: "Stegen", generalPosition: .def, specificPosition: .gk, club: .barcelona, league: .laLiga, nation: .germany, age: 31, level: 1),
    Player(firstName: "Luka", lastName: "Modric", generalPosition: .mid, specificPosition: .cm, club: .realMadrid, league: .laLiga, nation: .croatia, age: 37, level: 1),
    Player(firstName: "Keylor", lastName: "Navas", generalPosition: .def, specificPosition: .gk, club: .psg, league: .ligue1, nation: .costa, age: 36, level: 1),
    Player(firstName: "Gianluigi", lastName: "Donnarumma", generalPosition: .def, specificPosition: .gk, club: .psg, league: .ligue1, nation: .italy, age: 24, level: 1),
    Player(firstName: "David", lastName: "De Gea", generalPosition: .def, specificPosition: .gk, club: .manUnited, league: .premier, nation: .spain, age: 32, level: 1),
    Player(firstName: "Hugo", lastName: "Lloris", generalPosition: .def, specificPosition: .gk, club: .tottenham, league: .premier, nation: .france, age: 36, level: 1),
    Player(firstName: "Trent", lastName: "Alexander-Arnold", generalPosition: .def, specificPosition: .rb, club: .liverpool, league: .premier, nation: .england, age: 24, level: 1),
    Player(firstName: "Kalidou", lastName: "Koulibaly", generalPosition: .def, specificPosition: .cb, club: .chelsea, league: .premier, nation: .senegal, age: 31, level: 1),
    Player(firstName: "", lastName: "Rodri", generalPosition: .mid, specificPosition: .cdm, club: .manCity, league: .premier, nation: .spain, age: 26, level: 1),
    Player(firstName: "Andrew", lastName: "Robertson", generalPosition: .def, specificPosition: .lb, club: .liverpool, league: .premier, nation: .scotland, age: 29, level: 1),
    Player(firstName: "", lastName: "Fabinho", generalPosition: .mid, specificPosition: .cdm, club: .liverpool, league: .premier, nation: .brazil, age: 29, level: 1),
    Player(firstName: "Frenkie", lastName: "de Jong", generalPosition: .mid, specificPosition: .cm, club: .barcelona, league: .laLiga, nation: .netherlands, age: 26, level: 1),
    Player(firstName: "Antonio", lastName: "Rudiger", generalPosition: .def, specificPosition: .cb, club: .realMadrid, league: .laLiga, nation: .germany, age: 30, level: 1),
    Player(firstName: "Thomas", lastName: "Muller", generalPosition: .mid, specificPosition: .cam, club: .bayern, league: .bundesliga, nation: .germany, age: 33, level: 1),
    Player(firstName: "Leon", lastName: "Goretzka", generalPosition: .mid, specificPosition: .cm, club: .bayern, league: .bundesliga, nation: .germany, age: 28, level: 1),
    Player(firstName: "Marco", lastName: "Verratti", generalPosition: .mid, specificPosition: .cm, club: .psg, league: .ligue1, nation: .italy, age: 30, level: 1),
    Player(firstName: "Mike", lastName: "Maignan", generalPosition: .def, specificPosition: .gk, club: .milan, league: .serieA, nation: .france, age: 27, level: 1),
    Player(firstName: "", lastName: "Vinicius Junior", generalPosition: .att, specificPosition: .lw, club: .realMadrid, league: .laLiga, nation: .brazil, age: 22, level: 1),
    Player(firstName: "Aymeric", lastName: "Laporte", generalPosition: .def, specificPosition: .cb, club: .manCity, league: .premier, nation: .spain, age: 28, level: 1),
    Player(firstName: "Edouard", lastName: "Mendy", generalPosition: .def, specificPosition: .gk, club: .chelsea, league: .premier, nation: .senegal, age: 31, level: 1),
    Player(firstName: "Thiago", lastName: "Silva", generalPosition: .def, specificPosition: .cb, club: .chelsea, league: .premier, nation: .brazil, age: 38, level: 1),
    Player(firstName: "Raheem", lastName: "Sterling", generalPosition: .att, specificPosition: .lw, club: .chelsea, league: .premier, nation: .england, age: 28, level: 1),
    Player(firstName: "", lastName: "Thiago", generalPosition: .mid, specificPosition: .cm, club: .liverpool, league: .premier, nation: .spain, age: 32, level: 1),
    Player(firstName: "Wojciech", lastName: "Szczesny", generalPosition: .def, specificPosition: .gk, club: .juventus, league: .serieA, nation: .poland, age: 33, level: 1),
    Player(firstName: "David", lastName: "Alaba", generalPosition: .def, specificPosition: .cb, club: .realMadrid, league: .laLiga, nation: .austria, age: 30, level: 1),
    Player(firstName: "", lastName: "Parejo", generalPosition: .mid, specificPosition: .cm, club: .villareal, league: .laLiga, nation: .spain, age: 34, level: 1),
    Player(firstName: "Kingsley", lastName: "Coman", generalPosition: .mid, specificPosition: .lm, club: .bayern, league: .bundesliga, nation: .france, age: 26, level: 1),
    Player(firstName: "Kevin", lastName: "Trapp", generalPosition: .def, specificPosition: .gk, club: .frankfurt, league: .bundesliga, nation: .germany, age: 32, level: 1),
    Player(firstName: "Christopher", lastName: "Nkunku", generalPosition: .att, specificPosition: .cf, club: .rbLeipzig, league: .bundesliga, nation: .france, age: 25, level: 1),
    Player(firstName: "Riyad", lastName: "Mahrez", generalPosition: .att, specificPosition: .rw, club: .manCity, league: .premier, nation: .algeria, age: 32, level: 1),
    Player(firstName: "Lautaro", lastName: "Martinez", generalPosition: .att, specificPosition: .st, club: .inter, league: .serieA, nation: .argentina, age: 25, level: 1),
    Player(firstName: "Ciro", lastName: "Immobile", generalPosition: .att, specificPosition: .st, club: .lazio, league: .serieA, nation: .italy, age: 33, level: 1),
    Player(firstName: "Romelu", lastName: "Lukaku", generalPosition: .att, specificPosition: .st, club: .inter, league: .serieA, nation: .belgium, age: 30, level: 1),
    Player(firstName: "Sergej", lastName: "Milinkovic-Savic", generalPosition: .mid, specificPosition: .cm, club: .lazio, league: .serieA, nation: .serbia, age: 28, level: 1),
    Player(firstName: "Nicolo", lastName: "Barella", generalPosition: .mid, specificPosition: .cm, club: .inter, league: .serieA, nation: .italy, age: 26, level: 1),
    Player(firstName: "Marcelo", lastName: "Brozovic", generalPosition: .mid, specificPosition: .cdm, club: .inter, league: .serieA, nation: .croatia, age: 30, level: 1),
    Player(firstName: "Milan", lastName: "Skriniar", generalPosition: .def, specificPosition: .cb, club: .inter, league: .serieA, nation: .slovakia, age: 28, level: 1),
    Player(firstName: "Paulo", lastName: "Dybala", generalPosition: .att, specificPosition: .cf, club: .roma, league: .serieA, nation: .argentina, age: 29, level: 1),
    Player(firstName: "Bruno", lastName: "Fernandes", generalPosition: .mid, specificPosition: .cam, club: .manUnited, league: .premier, nation: .portugal, age: 28, level: 1),
    Player(firstName: "", lastName: "Pedri", generalPosition: .mid, specificPosition: .cm, club: .barcelona, league: .laLiga, nation: .spain, age: 20, level: 1),
    Player(firstName: "", lastName: "Jorginho", generalPosition: .mid, specificPosition: .cm, club: .arsenal, league: .premier, nation: .italy, age: 31, level: 1),
    Player(firstName: "Diogo", lastName: "Jota", generalPosition: .att, specificPosition: .cf, club: .liverpool, league: .premier, nation: .portugal, age: 26, level: 1),
    Player(firstName: "Marcos", lastName: "Acuna", generalPosition: .def, specificPosition: .lb, club: .sevilla, league: .laLiga, nation: .argentina, age: 31, level: 1),
    Player(firstName: "Yannick", lastName: "Carrasco", generalPosition: .mid, specificPosition: .lm, club: .althetico, league: .laLiga, nation: .belgium, age: 29, level: 1),
    Player(firstName: "Sergio", lastName: "Busquets", generalPosition: .mid, specificPosition: .cdm, club: .barcelona, league: .laLiga, nation: .spain, age: 34, level: 1),
    Player(firstName: "Nabil", lastName: "Fekir", generalPosition: .mid, specificPosition: .cam, club: .realBetis, league: .laLiga, nation: .france, age: 29, level: 1),
    Player(firstName: "Memphis", lastName: "Depay", generalPosition: .att, specificPosition: .cf, club: .althetico, league: .laLiga, nation: .netherlands, age: 29, level: 1),
    Player(firstName: "Gerard", lastName: "Moreno", generalPosition: .att, specificPosition: .st, club: .villareal, league: .laLiga, nation: .spain, age: 31, level: 1),
    Player(firstName: "Jordi", lastName: "Alba", generalPosition: .def, specificPosition: .lb, club: .barcelona, league: .laLiga, nation: .spain, age: 34, level: 1),
    Player(firstName: "Peter", lastName: "Gulasci", generalPosition: .def, specificPosition: .gk, club: .rbLeipzig, league: .bundesliga, nation: .hungary, age: 33, level: 1),
    Player(firstName: "Matthijs", lastName: "de Ligt", generalPosition: .def, specificPosition: .cb, club: .bayern, league: .bundesliga, nation: .netherlands, age: 23, level: 1),
    Player(firstName: "Niklas", lastName: "Sule", generalPosition: .def, specificPosition: .cb, club: .dortmund, league: .bundesliga, nation: .germany, age: 27, level: 1),
    Player(firstName: "Patrik", lastName: "Schick", generalPosition: .att, specificPosition: .st, club: .leverkusen, league: .bundesliga, nation: .czech, age: 27, level: 1),
    Player(firstName: "Marco", lastName: "Reus", generalPosition: .mid, specificPosition: .cam, club: .dortmund, league: .bundesliga, nation: .germany, age: 33, level: 1),
    Player(firstName: "Serge", lastName: "Gnabry", generalPosition: .att, specificPosition: .rw, club: .bayern, league: .bundesliga, nation: .germany, age: 27, level: 1),
    Player(firstName: "Paul", lastName: "Pogba", generalPosition: .mid, specificPosition: .cm, club: .juventus, league: .serieA, nation: .france, age: 30, level: 1),
    Player(firstName: "Theo", lastName: "Hernandez", generalPosition: .def, specificPosition: .lb, club: .milan, league: .serieA, nation: .france, age: 25, level: 1),
    Player(firstName: "Filip", lastName: "Kostic", generalPosition: .mid, specificPosition: .lm, club: .juventus, league: .serieA, nation: .serbia, age: 30, level: 1),
    Player(firstName: "Phil", lastName: "Foden", generalPosition: .att, specificPosition: .lw, club: .manCity, league: .premier, nation: .england, age: 22, level: 1),
    Player(firstName: "Ilkay", lastName: "Gundogan", generalPosition: .mid, specificPosition: .cm, club: .manCity, league: .premier, nation: .germany, age: 32, level: 1),
    Player(firstName: "Kyle", lastName: "Walker", generalPosition: .def, specificPosition: .rb, club: .manCity, league: .premier, nation: .england, age: 32, level: 1),
    Player(firstName: "Jamie", lastName: "Vardy", generalPosition: .att, specificPosition: .st, club: .leicester, league: .premier, nation: .england, age: 36, level: 1),
    Player(firstName: "", lastName: "Aubameyang", generalPosition: .att, specificPosition: .st, club: .chelsea, league: .premier, nation: .gabon, age: 33, level: 1),
    Player(firstName: "Yann", lastName: "Sommer", generalPosition: .def, specificPosition: .gk, club: .bayern, league: .bundesliga, nation: .switzerland, age: 34, level: 1),
    
    //LEVEL 2
    Player(firstName: "Jude", lastName: "Bellingham", generalPosition: .mid, specificPosition: .cm, club: .dortmund, league: .bundesliga, nation: .england, age: 19, level: 2),
    Player(firstName: "Dusan", lastName: "Vlahovic", generalPosition: .att, specificPosition: .st, club: .juventus, league: .serieA, nation: .serbia, age: 23, level: 2),
    Player(firstName: "Jack", lastName: "Grealish", generalPosition: .att, specificPosition: .lw, club: .manCity, league: .premier, nation: .england, age: 27, level: 2),
    Player(firstName: "Kai", lastName: "Havertz", generalPosition: .mid, specificPosition: .cam, club: .chelsea, league: .premier, nation: .germany, age: 23, level: 2),
    Player(firstName: "Alphonso", lastName: "Davies", generalPosition: .def, specificPosition: .lb, club: .bayern, league: .bundesliga, nation: .canada, age: 22, level: 2),
    Player(firstName: "Joao", lastName: "Felix", generalPosition: .att, specificPosition: .cf, club: .althetico, league: .laLiga, nation: .portugal, age: 23, level: 2),
    Player(firstName: "Federico", lastName: "Valverde", generalPosition: .mid, specificPosition: .cm, club: .realMadrid, league: .laLiga, nation: .uruguay, age: 24, level: 2),
    Player(firstName: "Mason", lastName: "Mount", generalPosition: .mid, specificPosition: .cam, club: .chelsea, league: .premier, nation: .england, age: 24, level: 2),
    Player(firstName: "Mateo", lastName: "Kovacic", generalPosition: .mid, specificPosition: .cm, club: .chelsea, league: .premier, nation: .croatia, age: 29, level: 2),
    Player(firstName: "Reece", lastName: "James", generalPosition: .def, specificPosition: .rb, club: .chelsea, league: .premier, nation: .england, age: 23, level: 2),
    Player(firstName: "Joel", lastName: "Matip", generalPosition: .def, specificPosition: .cb, club: .liverpool, league: .premier, nation: .cameroon, age: 31, level: 2),
    Player(firstName: "Luis", lastName: "Dias", generalPosition: .att, specificPosition: .lw, club: .liverpool, league: .premier, nation: .colombia, age: 26, level: 2),
    Player(firstName: "Leonardo", lastName: "Bonucci", generalPosition: .def, specificPosition: .cb, club: .juventus, league: .serieA, nation: .italy, age: 36, level: 2),
    Player(firstName: "Angel", lastName: "Di Maria", generalPosition: .att, specificPosition: .rw, club: .juventus, league: .serieA, nation: .argentina, age: 35, level: 2),
    Player(firstName: "Federico", lastName: "Chiesa", generalPosition: .att, specificPosition: .lw, club: .juventus, league: .serieA, nation: .italy, age: 25, level: 2),
    Player(firstName: "Jules", lastName: "Kounde", generalPosition: .def, specificPosition: .cb, club: .barcelona, league: .laLiga, nation: .france, age: 24, level: 2),
    Player(firstName: "Yassine", lastName: "Bounou", generalPosition: .def, specificPosition: .gk, club: .sevilla, league: .laLiga, nation: .morocco, age: 32, level: 2),
    Player(firstName: "Eder", lastName: "Militao", generalPosition: .def, specificPosition: .cb, club: .realMadrid, league: .laLiga, nation: .brazil, age: 25, level: 2),
    Player(firstName: "", lastName: "Carvajal", generalPosition: .def, specificPosition: .rb, club: .realMadrid, league: .laLiga, nation: .spain, age: 31, level: 2),
    Player(firstName: "Stefan", lastName: "Savic", generalPosition: .def, specificPosition: .cb, club: .althetico, league: .laLiga, nation: .montenegro, age: 32, level: 2),
    Player(firstName: "Moussa", lastName: "Diaby", generalPosition: .mid, specificPosition: .rm, club: .leverkusen, league: .bundesliga, nation: .france, age: 23, level: 2),
    Player(firstName: "Leroy", lastName: "Sane", generalPosition: .mid, specificPosition: .lm, club: .bayern, league: .bundesliga, nation: .germany, age: 27, level: 2),
    Player(firstName: "Koen", lastName: "Casteels", generalPosition: .def, specificPosition: .gk, club: .wolfsburg, league: .bundesliga, nation: .belgium, age: 30, level: 2),
    Player(firstName: "Mats", lastName: "Hummels", generalPosition: .def, specificPosition: .cb, club: .dortmund, league: .bundesliga, nation: .germany, age: 34, level: 2),
    Player(firstName: "Lucas", lastName: "Hernandez", generalPosition: .def, specificPosition: .cb, club: .bayern, league: .bundesliga, nation: .france, age: 27, level: 2),
    Player(firstName: "Eden", lastName: "Hazard", generalPosition: .att, specificPosition: .lw, club: .realMadrid, league: .laLiga, nation: .belgium, age: 31, level: 2),
    Player(firstName: "Jadon", lastName: "Sancho", generalPosition: .att, specificPosition: .lw, club: .manUnited, league: .premier, nation: .england, age: 23, level: 2),
    Player(firstName: "Martin", lastName: "Odegaard", generalPosition: .mid, specificPosition: .cam, club: .arsenal, league: .premier, nation: .norway, age: 24, level: 2),
    Player(firstName: "Achraf", lastName: "Hakimi", generalPosition: .def, specificPosition: .rb, club: .psg, league: .ligue1, nation: .morocco, age: 24, level: 2),
    Player(firstName: "Sergio", lastName: "Ramos", generalPosition: .def, specificPosition: .cb, club: .psg, league: .ligue1, nation: .spain, age: 37, level: 2),
    Player(firstName: "Wissam", lastName: "Ben Yedder", generalPosition: .att, specificPosition: .st, club: .monaco, league: .ligue1, nation: .france, age: 32, level: 2),
    Player(firstName: "Rafael", lastName: "Leao", generalPosition: .att, specificPosition: .lw, club: .milan, league: .serieA, nation: .portugal, age: 23, level: 2),
    Player(firstName: "Fikayo", lastName: "Tomori", generalPosition: .def, specificPosition: .cb, club: .milan, league: .serieA, nation: .england, age: 25, level: 2),
    Player(firstName: "Sandro", lastName: "Tonali", generalPosition: .mid, specificPosition: .cdm, club: .milan, league: .serieA, nation: .italy, age: 23, level: 2),
    Player(firstName: "Lorenzo", lastName: "Pellegrini", generalPosition: .mid, specificPosition: .cam, club: .roma, league: .serieA, nation: .italy, age: 26, level: 2),
    Player(firstName: "Hakan", lastName: "Calhanoglu", generalPosition: .mid, specificPosition: .cm, club: .inter, league: .serieA, nation: .turkey, age: 29, level: 2),
    Player(firstName: "Alessandro", lastName: "Bastoni", generalPosition: .def, specificPosition: .cb, club: .inter, league: .serieA, nation: .italy, age: 24, level: 2),
    Player(firstName: "Youri", lastName: "Tielemans", generalPosition: .def, specificPosition: .cm, club: .leicester, league: .premier, nation: .belgium, age: 26, level: 2),
    Player(firstName: "Declan", lastName: "Rice", generalPosition: .mid, specificPosition: .cdm, club: .westHam, league: .premier, nation: .england, age: 24, level: 2),
    Player(firstName: "", lastName: "Oyarzabal", generalPosition: .att, specificPosition: .lw, club: .realSociedad, league: .laLiga, nation: .spain, age: 26, level: 2),
    Player(firstName: "Marcos", lastName: "Llorente", generalPosition: .mid, specificPosition: .cm, club: .althetico, league: .laLiga, nation: .spain, age: 28, level: 2),
    Player(firstName: "", lastName: "Kessie", generalPosition: .mid, specificPosition: .cdm, club: .barcelona, league: .laLiga, nation: .coteDeIvoire, age: 26, level: 2),
    Player(firstName: "", lastName: "De Paul", generalPosition: .mid, specificPosition: .cm, club: .althetico, league: .laLiga, nation: .argentina, age: 28, level: 2),
    Player(firstName: "Ivan", lastName: "Perisic", generalPosition: .mid, specificPosition: .lm, club: .tottenham, league: .premier, nation: .croatia, age: 34, level: 2),
    Player(firstName: "", lastName: "Canales", generalPosition: .mid, specificPosition: .rm, club: .realBetis, league: .laLiga, nation: .spain, age: 32, level: 2),
    Player(firstName: "Thomas", lastName: "Partey", generalPosition: .mid, specificPosition: .cdm, club: .arsenal, league: .premier, nation: .ghana, age: 29, level: 2),
    Player(firstName: "Emiliano", lastName: "Martinez", generalPosition: .def, specificPosition: .gk, club: .astonVilla, league: .premier, nation: .argentina, age: 30, level: 2),
    Player(firstName: "Raphael", lastName: "Varane", generalPosition: .def, specificPosition: .cb, club: .manUnited, league: .premier, nation: .france, age: 30, level: 2),
    Player(firstName: "", lastName: "Muniain", generalPosition: .mid, specificPosition: .lm, club: .athletic, league: .laLiga, nation: .spain, age: 30, level: 2),
    Player(firstName: "Wilfred", lastName: "Ndidi", generalPosition: .mid, specificPosition: .cdm, club: .leicester, league: .premier, nation: .nigeria, age: 26, level: 2),
    Player(firstName: "Stefan", lastName: "de Vrij", generalPosition: .def, specificPosition: .cb, club: .inter, league: .serieA, nation: .netherlands, age: 31, level: 2),
    Player(firstName: "Kieran", lastName: "Trippier", generalPosition: .def, specificPosition: .rb, club: .newcastle, league: .premier, nation: .england, age: 32, level: 2),
    Player(firstName: "Edin", lastName: "Dzeko", generalPosition: .att, specificPosition: .st, club: .inter, league: .serieA, nation: .bosnia, age: 37, level: 2),
    Player(firstName: "Samir", lastName: "Handanovic", generalPosition: .def, specificPosition: .gk, club: .inter, league: .serieA, nation: .slovenia, age: 38, level: 2),
    Player(firstName: "Alejandro", lastName: "Gomez", generalPosition: .mid, specificPosition: .cam, club: .sevilla, league: .laLiga, nation: .argentina, age: 35, level: 2),
    Player(firstName: "Hakim", lastName: "Ziyech", generalPosition: .att, specificPosition: .rw, club: .chelsea, league: .premier, nation: .morocco, age: 30, level: 2),
    Player(firstName: "Jordan", lastName: "Henderson", generalPosition: .mid, specificPosition: .cm, club: .liverpool, league: .premier, nation: .england, age: 32, level: 2),
    
    
    // Player(firstName: <#T##String#>, lastName: <#T##String#>, generalPosition: <#T##GeneralPosition#>, specificPosition: <#T##SpecificPosition#>, club: <#T##Club#>, league: <#T##League#>, nation: <#T##Nation#>, age: <#T##Int#>, level: 2),
]
