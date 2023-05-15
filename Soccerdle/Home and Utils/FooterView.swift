//
//  FooterView.swift
//  Soccerdle
//
//  Created by Michael Ghebranious on 5/13/23.
//

import SwiftUI

struct FooterView: View {
    @State var hintAlert: Bool = false
    @State var revealAnswerAlert: Bool = false
    @State var letter: Bool = false
    
    @Binding var showInstructions: Bool
    
    var body: some View {
        HStack{
            
            Button{
                hintAlert = true
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
            .alert("Hint", isPresented: $hintAlert, actions: {
                Button(role: .destructive){
                    
                }label: {
                    Text("No")
                }
                
                Button(role: .none, action: {
                    hintAlert = false
                    //show a hint
                }, label: {
                    Text("Yes")
                })
            }, message: {
                Text("Would you like to use a hint for 50 coins?")
                
            })
            
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
            .alert("Hint", isPresented: $hintAlert, actions: {
                Button(role: .destructive){
                    
                }label: {
                    Text("No")
                }
                
                Button(role: .none, action: {
                    hintAlert = false
                    //show a hint
                }, label: {
                    Text("Yes")
                })
            }, message: {
                Text(letter ? "Would you like to reveal a letter for 100 coins?" :" Would you like to reveal the answer for 100 coins?")
                
            })
            
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

struct FooterView_Previews: PreviewProvider {
    static var previews: some View {
        FooterView(showInstructions: Binding<Bool>.constant(false))
    }
}
