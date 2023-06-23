//
//  QuestionDisplayView.swift
//  Soccerdle
//
//  Created by Michael Ghebranious on 6/19/23.
//

import SwiftUI

struct QuestionDisplayView: View {
    @Environment(\.dismiss) private var dismiss
    @AppStorage("coins") var coinsAmount: Int = 100
    
    var body: some View {
        VStack{
            HeaderView(coinsAmount: coinsAmount, action: dismiss, title: "")
            
            Timers(secondsLeft: 5)
            
            
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Color("background"))
    }
}

struct QuestionDisplayView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionDisplayView()
    }
}
