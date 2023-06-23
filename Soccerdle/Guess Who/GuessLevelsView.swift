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
    
    var body: some View {
        NavigationView{
            VStack{
                ScrollView(.vertical){
                    HeaderView(coinsAmount: coinsAmount, action: dismiss, title: "Guess Who")
                    
                    ForEach(levels, id: \.number) {level in
                        LevelView(level: level)
                    }
                    .padding(EdgeInsets(top: 40, leading: 19, bottom: 0, trailing: 0))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
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
