//
//  GuessingLetter.swift
//  Soccerdle
//
//  Created by Michael Ghebranious on 6/27/23.
//

import SwiftUI
struct GuessingLetter: View {
    @State var letterClicked: Letters = Letters(letter: Character("A"))
    @State var clicked: Bool = false
    
    
    @State var guessed: [Letters] = []
    @State var level: Level = levels[0]
    @State var position: Int = 0
    
    var body: some View {
        HStack{
            ForEach(level.letters) { guess in
                OneLetter
            }
        }
    }
    
    private var OneLetter: some View {
        Group{
            VStack{
                if(clicked){
                    Text(String(letterClicked.letter))
                        .font(.custom("PT Sans Caption Bold", size: 24))
                }
            }
            .frame(width: 35, height: 35)
            .background(clicked ? Color("questionMark") : .white)
            .cornerRadius(5)
            .overlay{
                RoundedRectangle(cornerRadius: 5)
                    .stroke(style: StrokeStyle(lineWidth: 1))
            }
            .onChange(of: guessed){ _ in
                print("HERE")
            }
            .tag(position)
            
        }
    }
    
}

struct GuessingLetter_Previews: PreviewProvider {
    static var previews: some View {
        GuessingLetter()
    }
}
