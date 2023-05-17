//
//  SearchingPlayerView.swift
//  Soccerdle
//
//  Created by Michael Ghebranious on 5/14/23.
//

import SwiftUI

struct SearchingPlayerView: View {
    @State var player: Player = players[0]
    
    var generalColor: Color {
        switch (player.generalPosition.rawValue){
        case "ATT":
            return Color("attacker")
        case "MID":
            return Color("correct")
            
        case "DEF":
            return Color.blue
        default:
            return .gray
        }
    }
    
    
    var body: some View {
        HStack{
            player.playerImage
                .resizable()
                .frame(width: 80, height: 80)
            
            VStack{
                HStack{
                    Text(player.generalPosition.rawValue)
                        .font(.custom("PT Sans Caption", size: 20))
                        .foregroundColor(generalColor)
                    Spacer()
                    Text(player.lastName)
                        .font(.custom("PT Sans Caption Bold", size: 20))
                    
                    Spacer()
                    Text(player.specificPosition.rawValue)
                        .font(.custom("PT Sans Caption", size: 20))
                }
                .padding(.trailing, 10)
                
                Spacer()
                HStack{
                    Image(player.nation.rawValue)
                        .resizable()
                        .frame(width: 40, height: 30)
                    Spacer()
                    Image(player.league.rawValue)
                        .resizable()
                        .frame(width: 38, height: 45)
                    Spacer()
                    Image(player.club.rawValue)
                        .resizable()
                        .frame(width: 40, height: 40)
                    Spacer()
                    Text(String(player.age))
                        .font(.custom("PT Sans Caption", size: 20))
                }
                .padding(.trailing, 10)
            }
            .padding(.vertical, 8)
        }
        .frame(width: 350, height: 100, alignment: .leading)
        .background(.white)
        .cornerRadius(20)

        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(.black, lineWidth: 1)
        )
        .shadow(radius: 2)
    }
}

struct SearchingPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        SearchingPlayerView()
    }
}
