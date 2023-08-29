//
//  HeaderView.swift
//  Soccerdle
//
//  Created by Michael Ghebranious on 5/13/23.
//

import SwiftUI

struct HeaderView: View {
    @AppStorage("coins") var coinsAmount: Int = 100
    var action : DismissAction
    @ObservedObject var navigationValues: NavigationValues
    @State var title = "Soccerdle"
    var body: some View {
        
        HStack{
            if(title == "Guess Who"){
                Button{
                    navigationValues.showAllLevels = true
                    navigationValues.showHome = false
                    navigationValues.showStore = false
                    navigationValues.showSoccerdle = false
                    navigationValues.showGuessWho = false
                }label: {
                    
                    Image("arrow")
                        .resizable()
                        .foregroundColor(.white)
                        .frame(width: 40, height: 40, alignment: .leading)
                }
                .frame(alignment: .leading)
            }
            else if(title == "Guess Who "){
                Button{
                    navigationValues.showAllLevels = false
                    navigationValues.showHome = true
                    navigationValues.showStore = false
                    navigationValues.showSoccerdle = false
                    navigationValues.showGuessWho = false

                }label: {
                    Image("arrow")
                        .resizable()
                        .foregroundColor(.white)
                        .frame(width: 40, height: 40, alignment: .leading)
                }
                .frame(alignment: .leading)
               
            }else{
                Button{
                    navigationValues.showAllLevels = false
                    navigationValues.showHome = true
                    navigationValues.showStore = false
                    navigationValues.showSoccerdle = false
                    navigationValues.showGuessWho = false
                    print("Pressed")
                }label: {
                    Image("arrow")
                        .resizable()
                        .foregroundColor(.white)
                        .frame(width: 40, height: 40, alignment: .leading)
                }
                .frame(alignment: .leading)
            }
            
            
            Text(title)
                .foregroundColor(.white)
                .font(.custom("PT Sans Caption Bold", size: 30))
                .padding(.leading, 38)
            
            
            Spacer()
           
            Button{
                navigationValues.showAllLevels = false
                navigationValues.showHome = false
                navigationValues.showStore = true
                navigationValues.showSoccerdle = false
                navigationValues.showGuessWho = false
            }label: {
                Text(String(coinsAmount))
                    .foregroundColor(.white)
                    .font(.custom("PT Sans Caption", size: 20))
                    
                Image("coins")
                    .resizable()
                    .frame(width: 30, height: 30, alignment: .trailing)
                    .foregroundColor(.white)
            }
                
            
        }
        .frame(width: 345, height: 47, alignment: .top)
    }
}


