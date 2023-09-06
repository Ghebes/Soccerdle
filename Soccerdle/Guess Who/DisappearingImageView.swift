//
//  DisappearingImageView.swift
//  Soccerdle
//
//  Created by Michael Ghebranious on 6/20/23.
//

import SwiftUI

struct RoundedCorners: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View {
    func roundedCorners(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorners(radius: radius, corners: corners))
    }
    
    
}


//MARK:- Disappearing Image
struct DisappearingImageView: View{
    @Binding var level: Level
    @Binding var hide: [Bool]
    let timer = Timer.publish(every: 1, on: .main, in: .default).autoconnect()
    @Binding var imagesRemoved: Int
    @Binding var won: Bool
    @Binding var showAnswer: Bool
    
    var body: some View{
        ZStack{
            Image("gw\(level.lastName.lowercased())")
                .resizable()
                .frame(width: 351, height: 437)
                .cornerRadius(20)
            
            VStack(spacing: 0){
                HStack(spacing:0){
                    Rectangle()
                        .fill(hide[0] || won ? AnyShapeStyle(.clear) : AnyShapeStyle(.ultraThinMaterial))
                        .cornerRadius(20, corners: .topLeft)
                    Rectangle()
                        .fill(hide[1] || won ? AnyShapeStyle(.clear) : AnyShapeStyle(.ultraThinMaterial))
                    Rectangle()
                        .fill(hide[2] || won ? AnyShapeStyle(.clear) : AnyShapeStyle(.ultraThinMaterial))
                        .cornerRadius(20, corners: .topRight)
                    
                }
                HStack(spacing: 0){
                    Rectangle()
                        .fill(hide[3] || won ? AnyShapeStyle(.clear) : AnyShapeStyle(.ultraThinMaterial))
                    Rectangle()
                        .fill(hide[4] || won ? AnyShapeStyle(.clear) : AnyShapeStyle(.ultraThinMaterial))
                    Rectangle()
                        .fill(hide[5] || won ? AnyShapeStyle(.clear) : AnyShapeStyle(.ultraThinMaterial))
                    
                }
                HStack(spacing: 0){
                    Rectangle()
                        .fill(hide[6] || won ? AnyShapeStyle(.clear) : AnyShapeStyle(.ultraThinMaterial))
                        .cornerRadius(20, corners: .bottomLeft)
                    Rectangle()
                        .fill(hide[7] || won ? AnyShapeStyle(.clear) : AnyShapeStyle(.ultraThinMaterial))
                    
                    Rectangle()
                        .fill(hide[8] || won ? AnyShapeStyle(.clear) : AnyShapeStyle(.ultraThinMaterial))
                        .cornerRadius(20, corners: .bottomRight)
                    
                }
            }
        }
        .frame(height: 441)
        .onReceive(timer){time in
            //find a random number to generate and change the hide value
            if(imagesRemoved < 9 && !won){
                var randomNumber = Int.random(in: 0..<9)
                while(hide[randomNumber]){
                    randomNumber = Int.random(in: 0..<9)
                }
                hide[randomNumber] = true
                imagesRemoved += 1
            }else{
                timer.upstream.connect().cancel()
            }
            
        }
        
        .padding(.horizontal, 20)
    }
}
