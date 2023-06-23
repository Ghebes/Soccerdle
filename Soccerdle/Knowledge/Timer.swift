//
//  Timers.swift
//  Soccerdle
//
//  Created by Michael Ghebranious on 6/19/23.
//

import SwiftUI

enum Sizes: String {
    case large = "large"
    case small = ".small"
}

struct Timers: View {
    
    @State var secondsLeft: Int = 5
    @State var angle: Double = 0
    @State var size: Sizes = .large
    @State var delay: Double = 0
    
    var body: some View {
        VStack{
            ZStack{
                Circle()
                    .fill(.clear)
                    .frame(width: size == .large ? 100 : 50, height: size == .large ? 100 : 50)
                
                
                Text(String(secondsLeft))
                    .foregroundColor(.white)
                    .frame(width: 100, height: 100)
                    .font(.custom("PT Sans Caption", size: size == .large ? 60 : 30))
                
                
                Circle()
                    .stroke(
                        LinearGradient(colors: [.white, Color("background").opacity(0), Color("background").opacity(0)], startPoint: .top, endPoint: .leading), style: StrokeStyle(lineWidth: size == .large ? 5 : 2)
                    )
                    .frame(width: size == .large ? 100 : 50, height: size == .large ? 100 : 50)
                    .rotationEffect(Angle(degrees: angle))
                    .onAppear{
                        repeat{
                            withAnimation(.easeIn(duration: 1).delay(delay)){
                                angle -= 360
                                secondsLeft -= 1
                            }
                            delay += 1
                        }while secondsLeft > 0
                        
                    }
                
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct Timers_Previews: PreviewProvider {
    static var previews: some View {
        Timers()
    }
}
