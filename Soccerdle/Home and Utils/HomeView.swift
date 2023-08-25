//
//  HomeView.swift
//  Soccerdle
//
//  Created by Michael Ghebranious on 5/13/23.
//

import SwiftUI

import AppTrackingTransparency
import AdSupport

//NEWLY ADDED PERMISSIONS FOR iOS 14
func requestPermission() {
    if #available(iOS 14, *) {
        ATTrackingManager.requestTrackingAuthorization { status in
            switch status {
            case .authorized:
                // Tracking authorization dialog was shown
                // and we are authorized
                print("Authorized")
                
                // Now that we are authorized we can get the IDFA
                print(ASIdentifierManager.shared().advertisingIdentifier)
            case .denied:
                // Tracking authorization dialog was
                // shown and permission is denied
                print("Denied")
            case .notDetermined:
                // Tracking authorization dialog has not been shown
                print("Not Determined")
            case .restricted:
                print("Restricted")
            @unknown default:
                print("Unknown")
            }
        }
    }
}
struct HomeView: View {
    @AppStorage("coins") var coinsAmount: Int = 100
    
    var SCREEN_HEIGHT = UIScreen.main.bounds.size.height
    var body: some View {
        NavigationView{
            VStack(spacing: 10.0){
                
                HStack(spacing: 8.0){
                    Spacer()
                    NavigationLink{
                        Store()
                    }label: {
                        Text(String(coinsAmount))
                            .foregroundColor(.white)
                            .font(.custom("PT Sans Caption", size: 20))
                        
                        Image("coins")
                            .resizable()
                            .frame(width: 30, height: 30, alignment: .trailing)
                            .foregroundColor(.white)
                    }
                }
                .padding(EdgeInsets(top: 10, leading: 0, bottom: -10, trailing: 20))
                
                
                Text("Soccerdle")
                    .foregroundColor(.white)
                    .font(.custom("PT Sans Caption Bold", size: 50))
                
                VStack(spacing: 80){
                    CircleButton(question: false)
                    
                    
                    CircleButton(image: Image("guess"), question: true, title: "Guess Who")
                }
                .frame(height: SCREEN_HEIGHT * 0.7, alignment: .center)
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .background(Color("background"))
            
        }
        .navigationBarBackButtonHidden()
        .onAppear{
            requestPermission()
        }
        
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
