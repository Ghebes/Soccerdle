//
//  CircleButton.swift
//  Soccerdle
//
//  Created by Michael Ghebranious on 5/13/23.
//

import SwiftUI

struct CircleButton: View {
    @State var color: Color = Color("wordleBackground")
    @State var image: Image = Image("wordle")
    @State var question: Bool = true
    @State var title: String = "Unlimited Soccerdle"
    
    var targetView: some View {
        switch (title){
            case "Unlimited Soccerdle":
                return SoccerdleView()
            case "Knowledge Drop":
                return SoccerdleView()
            case "Guess Who":
                return SoccerdleView()
            default:
                return SoccerdleView()
        }
    }
    var body: some View {
        
        NavigationLink{
            targetView
        }label: {
            
            VStack {
                ZStack{
                    Circle()
                        .fill(color).opacity(0.8)
                        .frame(width: 130, height: 130)
                    
                    Circle()
                        .stroke(Color.white, style: StrokeStyle(lineWidth: 2))
                        .frame(width: 130, height: 130)
                    
                    image
                        .resizable()
                        .frame(width: 130, height: 130)
                        .cornerRadius(130)
                    
                    if (question){
                        Image(systemName: "questionmark")
                            .resizable()
                            .frame(width: 35, height: 70)
                            .foregroundColor(Color("questionMark"))
                            .shadow(radius: 10)
                            
                            
                    }
                }
                .shadow(radius: 4)
                
            Text(title)
                    .foregroundColor(.white)
                    .font(.custom("PT Sans Caption Bold", size: 24))
            }
        }
        
            
            
        
        
    }
}

struct CircleButton_Previews: PreviewProvider {
    static var previews: some View {
        CircleButton()
    }
}
