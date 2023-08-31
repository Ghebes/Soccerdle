//
//  AppDelegate.swift
//  Soccerdle
//
//  Created by Michael Ghebranious on 8/28/23.
//

import Foundation
import GoogleMobileAds

class AppDelegate: NSObject, UIApplicationDelegate {
    
    class AppDelegate: NSObject, UIApplicationDelegate {
        func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
            
            GADMobileAds.sharedInstance().start(completionHandler: nil)
            return true
        }
    }
}
