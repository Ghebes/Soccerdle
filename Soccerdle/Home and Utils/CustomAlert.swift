//
//  CustomAlert.swift
//  Soccerdle
//
//  Created by Michael Ghebranious on 8/23/23.
//

import SwiftUI

struct CustomAlert: View {
    @Binding var shown: Bool
    var adCoordinator : AdCoordinator
    var adViewControllerRepresentable : AdViewControllerRepresentable
    @State var nextLevel: Level = LevelInformation().levels.first!
    @Binding var addedCoins: Int
    @AppStorage("level") var currentLevel: Int = 1
    @Binding var pressed: Bool
    @EnvironmentObject var adCounter: AdCounter
    
    var body: some View {
            VStack(spacing: 5){
                HStack(alignment: .center){
                    Text("+" + String(addedCoins))
                        .foregroundColor(Color("correct"))
                        .font(.custom("PT Sans Caption Bold", size: 34))
                    
                    Image("coins")
                        .resizable()
                        .foregroundColor(Color("correct"))
                        .frame(width: 30, height: 30)
                }
                
                Text("Correct!!!")
                    .foregroundColor(Color("correct"))
                    .padding(.horizontal, 10)
                    .font(.custom("PT Sans Caption Bold", size: 36))
                    .overlay{
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(lineWidth: 4)
                            .foregroundColor(Color("correct"))
                    }
                
                Image("balloons")
                    .resizable()
                    .frame(width: 150, height: 150)
                    .onTapGesture {
                        print("HERE")
                    }
                

                
                Button{
                    pressed = true
                    
                }label: {
                    Text("Next Level")
                        .font(.custom("PT Sans Caption", size: 20))
                        .padding(.horizontal, 10)
                        .padding(.vertical, 2)
                        .background(Color("correct"))
                        .foregroundColor(.black)
                        .cornerRadius(10)
                }
                
                
                
            }
        
        
        .frame(width: 225, height: 350)
        
        .background(.white)
        .cornerRadius(50)
        .onAppear{
            if(currentLevel < LevelInformation().levels.count){
                nextLevel = LevelInformation().levels[currentLevel]
                print(nextLevel)
            }
        }
        .offset(y: -60)
        
    }
}
