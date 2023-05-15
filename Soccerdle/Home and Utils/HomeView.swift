//
//  HomeView.swift
//  Soccerdle
//
//  Created by Michael Ghebranious on 5/13/23.
//

import SwiftUI

struct HomeView: View {
    @AppStorage("coins") var coinsAmount: Int = 100
    var body: some View {
        NavigationView{
            VStack(spacing: 10.0){
                
                HStack(spacing: 8.0){
                    Spacer()
                    
                    Text(String(coinsAmount))
                        .foregroundColor(.white)
                        .font(.custom("PT Sans Caption", size: 20))
                    
                    Image("coins")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.white)
                }
                .padding(EdgeInsets(top: 10, leading: 0, bottom: -10, trailing: 20))
                
                
                Text("Soccerdle")
                    .foregroundColor(.white)
                    .font(.custom("PT Sans Caption Bold", size: 50))
                
                VStack(spacing: 45.0){
                    CircleButton(question: false)
                    
                    CircleButton(image: Image("knowledge"), question: false, title: "Knowledge Drop")
                    
                    CircleButton(image: Image("guess"), question: true, title: "Guess Who")
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .background(Color("background"))
            
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
