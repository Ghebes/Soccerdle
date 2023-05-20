//
//  TraitView.swift
//  Soccerdle
//
//  Created by Michael Ghebranious on 5/14/23.
//

import SwiftUI

struct TraitView: View {
    
    @State var correct: Bool = true
    @State var attribute: Constants = Constants.league
    @State var input: String = League.ligue1.rawValue
    
    var imageNeeded: Bool {
        switch(attribute){
        case .specificPosition:
            return false
        case .generalPosition:
            return false
        case .nation:

            return true
        case .league:

            return true
        case .club:

            return true
        case .age:
            return false
        }        
    }
    
    var body: some View {
        VStack{
            if(imageNeeded){
                Image(input)
                    .resizable()
                    .frame(
                        width: attribute == Constants.club ? 40 : attribute == Constants.nation ? 40 : 30, height: attribute == Constants.club ? 40 : attribute == Constants.nation ? 30: 35)
            }else{
                
                Text(input)
                    .font(Font.custom("PT Sans Caption", size: 20))
            }
        }
        .frame(width: 50, height: 42, alignment: .center)
        .background(correct ? Color("correct") : Color("gray"))
        .cornerRadius(10)
    }
}

struct TraitView_Previews: PreviewProvider {
    static var previews: some View {
        TraitView()
    }
}
