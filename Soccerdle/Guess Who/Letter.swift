//
//  Letter.swift
//  Soccerdle
//
//  Created by Michael Ghebranious on 6/24/23.
//

import SwiftUI

struct Letter: View {
    @State var character: Character = Character("A")
    @State var hidden: Bool = false
    
    var body: some View {
        VStack{
            if(!hidden){
                Text(String(character))
                    .font(.custom("PT Sans Caption Bold", size: 24))
            }
        }
        .frame(width: 40, height: 40)
        .background(hidden ? .white : Color("questionMark"))
        .cornerRadius(5)
        .overlay{
            RoundedRectangle(cornerRadius: 5)
                .stroke(style: StrokeStyle(lineWidth: 1))
        }
        .shadow(radius: hidden ? 5 : 0)
        
    }
        
}

struct Letter_Previews: PreviewProvider {
    static var previews: some View {
        Letter()
    }
}

