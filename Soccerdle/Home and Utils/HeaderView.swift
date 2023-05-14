//
//  HeaderView.swift
//  Soccerdle
//
//  Created by Michael Ghebranious on 5/13/23.
//

import SwiftUI

struct HeaderView: View {
    @State var coinsAmount: Int = 100
    @Environment(\.dismiss) var dismiss
    @State var title = "Soccerdle"
    var body: some View {
        
        HStack{
            Button{
                dismiss()
            }label: {
                Image("arrow")
                    .resizable()
                    .foregroundColor(.white)
                    .frame(width: 40, height: 40, alignment: .leading)
            }
            .frame(alignment: .leading)
            
            Text(title)
                .foregroundColor(.white)
                .font(.custom("PT Sans Caption Bold", size: 36))
                .padding(.leading, 38)
            
            
            Spacer()
            Text(String(coinsAmount))
                .foregroundColor(.white)
                .font(.custom("PT Sans Caption", size: 20))
            
            Image("coins")
                .resizable()
                .frame(width: 30, height: 30, alignment: .trailing)
                
            
        }
        .frame(width: 345, height: 47, alignment: .top)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
