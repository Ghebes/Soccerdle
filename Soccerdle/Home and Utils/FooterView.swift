//
//  FooterView.swift
//  Soccerdle
//
//  Created by Michael Ghebranious on 5/13/23.
//

import SwiftUI

struct FooterView: View {
    @Binding var hintScreen: Bool
    @Binding var revealAnswerAlert: Bool
    @State var letter: Bool = false
    
    @Binding var showInstructions: Bool
    
    
    
    var body: some View {
        ZStack {
            HStack{
                Button{
                    withAnimation(.easeIn(duration: 1)){
                        hintScreen = true
                    }
                    
                }label: {
                    HStack{
                        Image(systemName: "lightbulb")
                        
                        Text("Hint")
                            .font(.custom("PT Sans Caption Bold", size: 24))
                    }
                    .frame(width: 110, height: 64)
                    .background(Color("questionMark"))
                    .cornerRadius(50)
                    .foregroundColor(.black)
                    .blur(radius: showInstructions ? 2 : 0)
                    
                }
                
                
                Button{
                    revealAnswerAlert = true
                }label: {
                    HStack{
                        
                        Text(letter ? "Reveal Letter" : "Reveal Answer")
                            .font(.custom("PT Sans Caption Bold", size: 17))
                            
                    }
                    .frame(width: 110, height: 64)
                    .background(Color("correct"))
                    .cornerRadius(50)
                    .foregroundColor(.black)
                    .padding(.leading, 33)
                    .blur(radius: showInstructions ? 2 : 0)
                    
                }
               
                
                Spacer()
                
                Image(systemName: "questionmark")
                    .resizable()
                    .foregroundColor(.white)
                    .frame(width: 15, height: 30)
                    .onTapGesture {
                        withAnimation(.spring()){
                            showInstructions = true
                        }
                        
                    }
                    
                
                
            }
            .padding(.horizontal, 25)
            
        }
    }
}

struct FooterView_Previews: PreviewProvider {
    static var previews: some View {
        FooterView(hintScreen: Binding<Bool>.constant(false), revealAnswerAlert: Binding<Bool>.constant(false), showInstructions: Binding<Bool>.constant(false))
    }
}
