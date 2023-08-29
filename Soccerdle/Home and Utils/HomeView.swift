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
    private let adCoordinator = AdCoordinator()
    private let adViewControllerRepresentable = AdViewControllerRepresentable()
    var SCREEN_HEIGHT = UIScreen.main.bounds.size.height
    @ObservedObject var navigationValues: NavigationValues
    
    var body: some View {
        NavigationStack{
            VStack(spacing: 10.0){
                
                HStack(spacing: 8.0){
                    Spacer()
                    Button{
                        navigationValues.showHome = false
                        navigationValues.showStore = true
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
                    CircleButton(question: false, navigationValues: navigationValues)
                    
                    
                    CircleButton(image: Image("guess"), question: true, title: "Guess Who", navigationValues: navigationValues)
                    
                    Button{
                        adCoordinator.loadAd()
                    }label: {
                        Text("Hello ther")
                    }
                    
                    Button{
                        adCoordinator.presentAd(from: adViewControllerRepresentable.viewController)
                        
                    }label: {
                        Text("Checking")
                    }
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
        .background{
            adViewControllerRepresentable
                .frame(width: 0, height: 0)
        }
        
        
        
    }
}

