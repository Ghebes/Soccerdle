//
//  SearchingPlayerView.swift
//  Soccerdle
//
//  Created by Michael Ghebranious on 5/14/23.
//

import SwiftUI

struct SearchingPlayerView: View {
    @State var player: Player = players[3]
    
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
                    
                    Text(player.lastName)
                        .font(.custom("PT Sans Caption Bold", size: 20))
                        .frame(width: 220, alignment: .center)

                }
                .padding(.trailing, 10)
                
                Spacer()
                HStack(){
                    Text(player.generalPosition.rawValue)
                        .font(.custom("PT Sans Caption", size: 20))
                        .foregroundColor(generalColor)
                    Spacer()
                    Image(player.nation.rawValue)
                        .resizable()
                        .frame(width: 40, height: 30)
                    Spacer()
                    Image(player.league.rawValue)
                        .resizable()
                        .frame(width: 38, height: 45)
                }
                .padding(.trailing, 10)
                .frame(maxWidth: 220, alignment: .center)
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
