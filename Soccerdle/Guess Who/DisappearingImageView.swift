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


struct DisappearingImageView: View {
    @State var image: Image = levels[0].imageName
    @State var randomNumber: Int = .random(in: 0..<9)
    @Binding var won: Bool
    @Binding var imagesRemoved: Int
    @State var hide: [Bool] = [false, false, false, false, false, false, false, false, false]
    
    
    
    func imageCompleted() -> Bool {
        var completed = true
        for square in hide {
            if square == false{
                completed = false
            }
        }
        return completed
    }
    
    func randomNumberGenerate() {
        randomNumber = .random(in: 0..<9)
        while(hide[randomNumber] == true){
            randomNumber = .random(in: 0..<9)
            
        }
        print(randomNumber)
        hide[randomNumber].toggle()
        
        imagesRemoved += 1
        
    }
    
    let timer = Timer.publish(every: 2, on: .main, in: .default).autoconnect()
    
    var body: some View {
        ZStack{
            image
                .resizable()
                .frame(width: 351, height: 437)
                .cornerRadius(20)
                .onAppear{
                    print(randomNumber)
                }
            
            VStack(spacing: 0.0){
                HStack(spacing: 0.0){
                    Rectangle()
                        .fill(hide[0] ? AnyShapeStyle(.clear) : AnyShapeStyle(.ultraThinMaterial))
                        .frame(width: 117, height: 147)
                        .roundedCorners(20, corners: [.topLeft])
                        .onAppear{
                            randomNumberGenerate()
                        }
                        
                    Rectangle()
                        .fill(hide[1] ? AnyShapeStyle(.clear) : AnyShapeStyle(.ultraThinMaterial))
                        .frame(width: 117, height: 147)
                    
                    Rectangle()
                        .fill(hide[2] ? AnyShapeStyle(.clear) : AnyShapeStyle(.ultraThinMaterial))
                        .frame(width: 117, height: 147)
                        .roundedCorners(20, corners: .topRight)
                }
                .frame(width: 351)
                
                HStack(spacing: 0.0){
                    Rectangle()
                        .fill(hide[3] ? AnyShapeStyle(.clear) : AnyShapeStyle(.ultraThinMaterial))
                        .frame(width: 117, height: 147)
                        
                    
                    Rectangle()
                        .fill(hide[4] ? AnyShapeStyle(.clear) : AnyShapeStyle(.ultraThinMaterial))
                        .frame(width: 117, height: 147)
                    
                    Rectangle()
                        .fill(hide[5] ? AnyShapeStyle(.clear) : AnyShapeStyle(.ultraThinMaterial))
                        .frame(width: 117, height: 147)
                        
                }
                .frame(width: 351)
                
                
                HStack(spacing: 0.0){
                    Rectangle()
                        .fill(hide[6] ? AnyShapeStyle(.clear) : AnyShapeStyle(.ultraThinMaterial))
                        .frame(width: 117, height: 147)
                        .roundedCorners(20, corners: [.bottomLeft])
                        
                    
                    Rectangle()
                        .fill(hide[7] ? AnyShapeStyle(.clear) : AnyShapeStyle(.ultraThinMaterial))
                        .frame(width: 117, height: 147)
                    
                    Rectangle()
                        .fill(hide[8] ? AnyShapeStyle(.clear) : AnyShapeStyle(.ultraThinMaterial))
                        .frame(width: 117, height: 147)
                        .roundedCorners(20, corners: .bottomRight)
                        
                }
                .frame(width: 351)
                
                
            }
            .onReceive(timer){time in
                if(won){
                    self.timer.upstream.connect().cancel()
                }else{
                    randomNumberGenerate()
                }
                
                
            }
            
        }
        
    }
}

struct DisappearingImageView_Previews: PreviewProvider {
    static var previews: some View {
        DisappearingImageView(won: .constant(false), imagesRemoved: .constant(0))
    }
}
