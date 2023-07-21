//
//  GuessLevelsView.swift
//  Soccerdle
//
//  Created by Michael Ghebranious on 6/19/23.
//

import SwiftUI

struct GuessLevelsView: View {
    @AppStorage("coins") var coinsAmount: Int = 100
    @Environment(\.dismiss) var dismiss
    @ObservedObject var allLevels = LevelInformation()
    var body: some View {
        NavigationView{
            VStack{
                ScrollView(.vertical){
                    HeaderView(coinsAmount: coinsAmount, action: dismiss, title: "Guess Who ")
                    
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 60))]){
                        ForEach(allLevels.levels) {level in
                            LevelView(level: level)
                            
                        }
                        .padding(EdgeInsets(top: 20, leading: 19, bottom: 0, trailing: 19))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color("background"))
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .navigationBarBackButtonHidden()
    }
}

struct GuessLevelsView_Previews: PreviewProvider {
    static var previews: some View {
        GuessLevelsView()
    }
}
