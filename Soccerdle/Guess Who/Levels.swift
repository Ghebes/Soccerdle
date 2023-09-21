//
//  Levels.swift
//  Soccerdle
//
//  Created by Michael Ghebranious on 6/19/23.
//

import Foundation
import SwiftUI
struct Level: Identifiable, Hashable {
    var id = UUID()
    let number: Int
    let playerName: String
    let lastName: String
    var neededCharacters: [Character] {
        return Array(lastName.uppercased())
    }
    
    var letters: [LetterType]{
        var count = 0
        var array: [LetterType] = []
        while(count < neededCharacters.count){
            array.append(LetterType(character: neededCharacters[count]))
            count += 1
        }
        return array
    }
    
    var imageName: Image {
        return Image("gw" + lastName.lowercased())
    }
}

class LevelInformation: ObservableObject{
    @Published var levels: [Level] = [
        Level(number: 1, playerName:"Lionel Messi", lastName:"Messi"),
        Level(number: 2, playerName: "Christiano Ronaldo", lastName:"Ronaldo"),
        //find photos for these
        Level(number: 3, playerName: "Robert Lewandowski", lastName:"Lewandowski"),
        Level(number: 4, playerName: "Kylian Mbappe", lastName:"Mbappe"),
        Level(number: 5, playerName: "Kevin de Bruyne", lastName:"DeBruyne"),
        Level(number: 6, playerName: "Karim Benzema", lastName:"Benzema"),
        Level(number: 7, playerName: "Mohamed", lastName:"Neymar"),
        Level(number: 8, playerName: "", lastName:"Mane"),
        Level(number: 9, playerName: "", lastName:"Courtois"),
        Level(number: 10, playerName: "", lastName:"Neuer"),
        Level(number: 11, playerName: "", lastName:"Salah"),
        Level(number: 12, playerName: "", lastName:"Kimmich"),
        Level(number: 13, playerName: "", lastName:"VanDijk"),
        Level(number: 14, playerName: "", lastName:"Son"),
        Level(number: 15, playerName: "", lastName:"Kante"),
        Level(number: 16, playerName: "", lastName:"Casemiro"),
        Level(number: 17, playerName: "", lastName:"Alisson"),
        Level(number: 18, playerName: "", lastName:"Ederson"),
        Level(number: 19, playerName: "", lastName:"Kane"),
        Level(number: 20, playerName: "", lastName:"Haaland"),
        Level(number: 21, playerName: "", lastName:"Silva"),
        Level(number: 22, playerName: "", lastName:"Oblak"),
        Level(number: 23, playerName: "", lastName:"Cancelo"),
        Level(number: 24, playerName: "", lastName:"Kroos"),
        Level(number: 25, playerName: "", lastName:"Dias"),
        Level(number: 26, playerName: "", lastName:"Marquinhos"),
        Level(number: 27, playerName: "", lastName:"TerStegen"),
        Level(number: 28, playerName: "", lastName:"Navas"),
        Level(number: 29, playerName: "", lastName:"DeGea"),
        Level(number: 30, playerName: "", lastName:"Donnarumma"),
        Level(number: 31, playerName: "", lastName:"Lloris"),
        Level(number: 32, playerName: "", lastName:"Arnold"),
        Level(number: 33, playerName: "", lastName:"Koulibaly"),
        Level(number: 34, playerName: "", lastName:"Robertson"),
        Level(number: 35, playerName: "", lastName:"Rodri"),
        Level(number: 36, playerName: "", lastName:"DeJong"),
        Level(number: 37, playerName: "", lastName:"Fabinho"),
        Level(number: 38, playerName: "", lastName:"Rudiger"),
        Level(number: 39, playerName: "", lastName:"Muller"),
        Level(number: 40, playerName: "", lastName:"Verratti"),
        Level(number: 41, playerName: "", lastName:"Goretzka"),
        Level(number: 42, playerName: "", lastName:"Vinicius"),
        Level(number: 43, playerName: "", lastName:"Maignan"),
        Level(number: 44, playerName: "", lastName:"Laporte"),
        Level(number: 45, playerName: "", lastName:"Mendy"),
        Level(number: 46, playerName: "", lastName:"ThiagoSilva"),
        Level(number: 47, playerName: "", lastName:"Thiago"),
        Level(number: 48, playerName: "", lastName:"Sterling"),
        Level(number: 49, playerName: "", lastName:"Szczesny"),
        Level(number: 50, playerName: "", lastName:"Alaba"),
        Level(number: 51, playerName: "", lastName:"Jorginho"),
        Level(number: 52, playerName: "", lastName:"Bellingham"),
        Level(number: 53, playerName: "", lastName:"Vlahovic"),
        Level(number: 54, playerName: "", lastName:"Grealish"),
        Level(number: 55, playerName: "", lastName:"James"),
        Level(number: 56, playerName: "", lastName:"Havertz"),
        Level(number: 57, playerName: "", lastName:"Felix"),
        Level(number: 58, playerName: "", lastName:"Valverde"),
        Level(number: 59, playerName: "", lastName:"Davies"),
        Level(number: 60, playerName: "", lastName:"Matip"),
        Level(number: 61, playerName: "", lastName:"Diaz"),
        Level(number: 62, playerName: "", lastName:"Chiellini"),
        Level(number: 63, playerName: "", lastName:"Bonucci"),
        Level(number: 64, playerName: "", lastName:"DiMaria"),
        Level(number: 65, playerName: "", lastName:"Chiesa"),
        Level(number: 66, playerName: "", lastName:"Bounou"),
        Level(number: 67, playerName: "", lastName:"Kounde"),
        Level(number: 68, playerName: "", lastName:"Carvajal"),
        Level(number: 69, playerName: "", lastName:"Savic"),
        Level(number: 70, playerName: "", lastName:"Militao"),
        Level(number: 71, playerName: "", lastName:"Sane"),
        Level(number: 72, playerName: "", lastName:"Trippier"),
        Level(number: 73, playerName: "", lastName:"Gomez"),
        Level(number: 74, playerName: "", lastName:"Ziyech"),
        Level(number: 75, playerName: "", lastName:"Henderson"),
        Level(number: 76, playerName: "", lastName:"Firmino"),
        Level(number: 77, playerName: "", lastName:"Bremer"),
        Level(number: 78, playerName: "", lastName:"Mendy"),
        Level(number: 79, playerName: "", lastName:"Asensio"),
        Level(number: 80, playerName: "", lastName:"Kimpembe"),
        Level(number: 81, playerName: "", lastName:"Gakpo"),
        Level(number: 82, playerName: "", lastName:"Soler"),
        Level(number: 83, playerName: "", lastName:"Tchouameni"),
        Level(number: 84, playerName: "", lastName:"Olmo"),
        Level(number: 85, playerName: "", lastName:"Antony"),
        Level(number: 86, playerName: "", lastName:"Zaha"),
        Level(number: 87, playerName: "", lastName:"Ibrahimovic"),
        Level(number: 88, playerName: "", lastName:"Payet"),
        Level(number: 89, playerName: "", lastName:"Guedes"),
        Level(number: 90, playerName: "", lastName:"Eriksen"),
        Level(number: 91, playerName: "", lastName:"Isco"),
        Level(number: 92, playerName: "", lastName:"Can"),
        Level(number: 93, playerName: "", lastName:"Onana"),
        Level(number: 94, playerName: "", lastName:"Maguire"),
        Level(number: 95, playerName: "", lastName:"Saka"),
        Level(number: 96, playerName: "", lastName:"Werner"),
        Level(number: 97, playerName: "", lastName:"Reus"),
        Level(number: 98, playerName: "", lastName:"Dzeko"),
        Level(number: 99, playerName: "", lastName:"Cuadrado"),
        Level(number: 100, playerName: "", lastName:"Dembele"),
        
        
    ]
}
