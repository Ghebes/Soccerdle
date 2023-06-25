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
        hide[randomNumber].toggle()
        
        
        
    }
    
    let timer = Timer.publish(every: 1, on: .main, in: .default).autoconnect()
    
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
                        .fill(Color("gray"))
                        .frame(width: 117, height: 147)
                        .roundedCorners(20, corners: [.topLeft])
                        .onAppear{
                            randomNumberGenerate()
                        }
                        .opacity(hide[0] ? 0 : 1)
                        
                    Rectangle()
                        .fill(Color("gray"))
                        .frame(width: 117, height: 147)
                        .opacity(hide[1] ? 0 : 1)
                    
                    Rectangle()
                        .fill(Color("gray"))
                        .frame(width: 117, height: 147)
                        .roundedCorners(20, corners: .topRight)
                        .opacity(hide[2] ? 0 : 1)
                }
                .frame(width: 351)
                
                HStack(spacing: 0.0){
                    Rectangle()
                        .fill(Color("gray"))
                        .frame(width: 117, height: 147)
                        .opacity(hide[3] ? 0 : 1)
                        
                    
                    Rectangle()
                        .fill(Color("gray"))
                        .frame(width: 117, height: 147)
                        .opacity(hide[4] ? 0 : 1)
                    
                    Rectangle()
                        .fill(Color("gray"))
                        .frame(width: 117, height: 147)
                        .opacity(hide[5] ? 0 : 1)
                }
                .frame(width: 351)
                
                
                HStack(spacing: 0.0){
                    Rectangle()
                        .fill(Color("gray"))
                        .frame(width: 117, height: 147)
                        .roundedCorners(20, corners: [.bottomLeft])
                        .opacity(hide[6] ? 0 : 1)
                        
                    
                    Rectangle()
                        .fill(Color("gray"))
                        .frame(width: 117, height: 147)
                        .opacity(hide[7] ? 0 : 1)
                    
                    Rectangle()
                        .fill(Color("gray"))
                        .frame(width: 117, height: 147)
                        .roundedCorners(20, corners: .bottomRight)
                        .opacity(hide[8] ? 0 : 1)
                }
                .frame(width: 351)
                
                
            }
            .onReceive(timer){time in
                randomNumberGenerate()
            }
        }
        
    }
}

struct DisappearingImageView_Previews: PreviewProvider {
    static var previews: some View {
        DisappearingImageView()
    }
}
