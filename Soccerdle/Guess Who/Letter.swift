//
//  Letter.swift
//  Soccerdle
//
//  Created by Michael Ghebranious on 6/24/23.
//

import SwiftUI

struct Letter: View {
    @State var character: Character = Character("A")
    
    var body: some View {
        VStack{
            Text(String(character))
                .font(.custom("PT Sans Caption Bold", size: 24))
        }
        .frame(width: 40, height: 40)
        .background(Color("questionMark"))
        .cornerRadius(5)
    }
        
}

struct Letter_Previews: PreviewProvider {
    static var previews: some View {
        Letter()
    }
}

