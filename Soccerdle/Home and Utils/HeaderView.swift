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
    
    @State var title = "Soccerdle"
    var body: some View {
        
        HStack{
            if(title == "Guess Who"){
                NavigationLink{
                    GuessLevelsView()
                }label: {
                    Image("arrow")
                        .resizable()
                        .foregroundColor(.white)
                        .frame(width: 40, height: 40, alignment: .leading)
                }
                .frame(alignment: .leading)
            }
            else if(title == "Guess Who "){
                NavigationLink{
                    HomeView()
                        
                }label: {
                    Image("arrow")
                        .resizable()
                        .foregroundColor(.white)
                        .frame(width: 40, height: 40, alignment: .leading)
                }
                .frame(alignment: .leading)
                .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
               
            }else{
                Button{
                    action()
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
            Text(String(coinsAmount))
                .foregroundColor(.white)
                .font(.custom("PT Sans Caption", size: 20))
                
            
            Image("coins")
                .resizable()
                .frame(width: 30, height: 30, alignment: .trailing)
                .foregroundColor(.white)

                
            
        }
        .frame(width: 345, height: 47, alignment: .top)
    }
}


