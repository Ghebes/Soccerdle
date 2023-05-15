//
//  PlayerSoccerdleView.swift
//  Soccerdle
//
//  Created by Michael Ghebranious on 5/14/23.
//

import SwiftUI

struct PlayerSoccerdleView: View {
    @State var player: Player
    @State var answer: Player

    var body: some View {
        HStack(spacing: 3.0){
            player.playerImage
                .resizable()
                .frame(width: 55, height: 55)
            
            TraitView(correct: player.specificPosition == answer.specificPosition ? true : false, attribute: .specificPosition, input: player.specificPosition.rawValue)
            
            TraitView(correct: player.generalPosition == answer.generalPosition ? true : false , attribute: .generalPosition, input: player.generalPosition.rawValue)
            
            TraitView(correct: player.club == answer.club ? true : false, attribute: .club, input: player.club)
            
            TraitView(correct: player.league == answer.league ? true : false, attribute: .league, input: player.league.rawValue)
            
            TraitView(correct: player.nation == answer.nation ? true : false, attribute: .nation, input: "Argentina")
            
            TraitView(correct: player.age == answer.age ? true : false, attribute: .age, input: player.age)
        }
        .frame(width: 380, height: 70, alignment: .leading)
        .background(.white)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20.0)
                .stroke(.black, lineWidth: 1)
        )
    }
}

struct PlayerSoccerdleView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerSoccerdleView(player: players[0], answer: players[0])
    }
}
