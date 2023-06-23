//
//  Timers.swift
//  Soccerdle
//
//  Created by Michael Ghebranious on 6/22/23.
//

import SwiftUI

enum Sizes: String {
    case large = "large"
    case small = "small"
}

struct Timers: View {
    @State var secondsLeft: Int = 5
    @State var size: Sizes = .large
    @State var angle: Double = 0
    @State var delay: Int = 0
    
    var body: some View {
        ZStack{
            Circle()
                .fill(.clear)
                .frame(width: size == .large ? 90 : 50, height: size == .large ? 90 : 50)
            
            Circle()
                .stroke(
                    LinearGradient(colors: [.white, Color("background").opacity(0), Color("background").opacity(0)], startPoint: .trailing, endPoint: .top)
                    ,
                    style: StrokeStyle(lineWidth: size == .large ? 4 : 2)
                )
                .frame(width: size == .large ? 90 : 50, height: size == .large ? 90 : 50)
                .rotationEffect(Angle(degrees: angle))
                .opacity(secondsLeft == 0 ? 0 : 1)
            
            Text(String(secondsLeft))
                .foregroundColor(.white)
                .font(.custom("PT Sans Caption Bold", size: size == .large ? 50 : 20))
            
        }
        .frame(width: size == .large ? 100 : 60, height: size == .large ? 100 : 60, alignment: .center)
        .onAppear{
            repeat{
                withAnimation(.easeIn(duration: 1).delay(Double(delay))){
                    angle -= 360
                    secondsLeft -= 1
                    delay += 1
                }
                
            }while secondsLeft > 0
            
        }
    }
}

struct Timers_Previews: PreviewProvider {
    static var previews: some View {
        Timers()
    }
}
