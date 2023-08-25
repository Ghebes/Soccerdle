//
//  AdCoordinator.swift
//  Soccerdle
//
//  Created by Michael Ghebranious on 8/25/23.
//

import Foundation
import GoogleMobileAds
import SwiftUI


class AdCoordinator: NSObject {
    private var ad: GADInterstitialAd?
    
    func loadAd() {
        GADInterstitialAd.load(withAdUnitID: "ca-app-pub-3901710931145358~6815851131", request: GADRequest()){ad, error in
            if let error = error {
                return print("Failed to load ad with error: \(error.localizedDescription)")
            }
            
            self.ad = ad
            
        }
    }
    
    func presentAd(from viewController: UIViewController){
        guard let fullScreenAd = ad else {
            return print("Ad wasn't ready")
        }
        
        fullScreenAd.present(fromRootViewController: viewController)
    }
}

struct AdViewControllerRepresentable: UIViewControllerRepresentable {
    let viewController = UIViewController()
    
    func makeUIViewController(context: Context) -> some UIViewController {
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context){
        //No implementation needed
    }
}

