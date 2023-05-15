//
//  ResultsView.swift
//  Soccerdle
//
//  Created by Michael Ghebranious on 5/15/23.
//

import SwiftUI

struct ResultsView: View {
    @State var won : Bool = true
    @State var text: String = "YOU WIN"
    @State var amountCoins: Int = 5
    @State var guesses: Int = 1
    @State var fromWorlde: Bool = true
    @State var name: String = "Lionel Messi"
    var playAgain: () -> Void
    var quit: () -> Void
    
    var body: some View {
        VStack(spacing: 0.0){
            HStack{
                if(text != ""){
                    Text(text)
                        .foregroundColor(won ? Color("correct") : Color("wrong"))
                        .font(.custom("PT Sans Caption Bold", size: 36))
                        .padding(.horizontal, 10)
                }
                
       
            }
            .cornerRadius(20)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color(won ? "correct" : "wrong"), lineWidth: 4)
            )
            .padding(.top, 10)
            
                
            Image(won ? "balloons" : "loss")
                .resizable()
                .frame(width: 150, height: 150)
                .padding(.top, 10)
            
            if(won){
                HStack{
                    Text(String("+" + String(amountCoins)))
                        .font(.custom("American TypeWriter", size: 34))
                        .bold()
                        .foregroundColor(Color("correct"))
                    
                    Image("coins")
                        .resizable()
                        .foregroundColor(Color("correct"))
                        .frame(width: 30, height: 30)
                    
                }
                .padding(.top, -50)
                .shadow(radius: 4)
                
            }
            
            if(fromWorlde){
                VStack(spacing: 0.0){
                    Text(guesses == 1 ? "It took you 1 try to guess" : "It took you " + String(guesses) + " tries to guess")
                        .frame(width: 184, height: 42, alignment: .center)
                        .multilineTextAlignment(.center)
                        .font(.custom("PT Sans Caption", size: 16))
                    
                    Text(name)
                        .font(.custom("PT Sans Caption Bold", size: 20))
                    
                }
                
            }
            
            Button{
                playAgain()
            }label: {
                Text("Play Again")
                    .frame(width: 150, height: 30, alignment: .center)
                    .foregroundColor(.black)
                    .background(Color("correct"))
                    .cornerRadius(10)
                    .font(.custom("PT Sans Caption", size: 20))
                    .padding(.top, 20)
                    
                
            }
            .padding(.bottom, 5)
            
            Button{
                quit()
            }label: {
                Text("Quit")
                    .frame(width: 150, height: 30, alignment: .center)
                    .foregroundColor(.white)
                    .background(Color("wrong"))
                    .cornerRadius(10)
                    .font(.custom("PT Sans Caption", size: 20))
            }
            
        }
        .frame(width: 230, height: 330, alignment: .top)
        .background(.white)
        .cornerRadius(50)
    }
}

struct ResultsView_Previews: PreviewProvider {
    static var previews: some View {
        ResultsView(playAgain: {}, quit: {})
    }
}
