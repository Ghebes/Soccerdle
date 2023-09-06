//
//  AdCoordinator.swift
//  Soccerdle
//
//  Created by Michael Ghebranious on 8/28/23.
//

import Foundation
import SwiftUI
import GoogleMobileAds


class AdCounter: ObservableObject {
    @Published var counter: Int = 0
}

class AdCoordinator: NSObject, GADFullScreenContentDelegate {
    private var ad: GADInterstitialAd?
    
    override init(){
        super.init()
        loadAd()
    }
    
    func refreshAdCoordinator(){
        loadAd()
    }
    
    func loadAd() {
        GADInterstitialAd.load(
            withAdUnitID: "ca-app-pub-3940256099942544/4411468910", request: GADRequest()
        ) { [self] ad, error in
            if let error = error {
                return print("Failed to load ad with error: \(error.localizedDescription)")
            }
            
            self.ad = ad
            self.ad?.fullScreenContentDelegate = self
        }
    }
    
    func presentAd(from viewController: UIViewController) {
        guard let fullScreenAd = ad else {
            return print("Ad wasn't ready")
        }
        
        fullScreenAd.present(fromRootViewController: viewController)
    }
    
    // MARK: - GADFullScreenContentDelegate methods
    
    func adDidRecordImpression(_ ad: GADFullScreenPresentingAd) {
        print("\(#function) called")
    }
    
    func adDidRecordClick(_ ad: GADFullScreenPresentingAd) {
        print("\(#function) called")
    }
    
    func ad(_ ad: GADFullScreenPresentingAd, didFailToPresentFullScreenContentWithError error: Error) {
        print("\(#function) called")
        print(error)
    }
    
    func adWillPresentFullScreenContent(_ ad: GADFullScreenPresentingAd) {
        print("\(#function) called")
    }
    
    
    func adWillDismissFullScreenContent(_ ad: GADFullScreenPresentingAd) {
        print("\(#function) called")
    }
    
    func adDidDismissFullScreenContent(_ ad: GADFullScreenPresentingAd) {
        print("\(#function) called")
    }
}

struct AdViewControllerRepresentable: UIViewControllerRepresentable {
    let viewController = UIViewController()
    
    func makeUIViewController(context: Context) -> some UIViewController {
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        // No implementation needed. Nothing to update.
    }
}
