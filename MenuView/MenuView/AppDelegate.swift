//
//  AppDelegate.swift
//  MenuView
//
//  Created by John Nguyen on 10/7/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate, UIGestureRecognizerDelegate {
    
    var window: IdlingWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let tapGesture = UITapGestureRecognizer(target: self, action: nil)
        tapGesture.delegate = self
        window?.addGestureRecognizer(tapGesture)
        
        // Overwriting the window with a custom window that detects events such as touches
        window = IdlingWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateInitialViewController()
        window?.makeKeyAndVisible()
        
        return true
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive event: UIEvent) -> Bool {
        let timeIntervalSinceNow = self.window?.lastInteraction.timeIntervalSinceNow ?? 0
        if timeIntervalSinceNow > 240 {
            //Reset root controller
        }
        return true
    }

    // MARK: UISceneSession Lifecycle
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
}

extension UIWindowScene {
    /// Conveniently gets the last interaction time
    var lastInteraction: Date {
        let keyWindow = self.windows.filter {$0.isKeyWindow}.first
        return (keyWindow as? IdlingWindow)?.lastInteraction ?? .distantPast
    }
}



class IdlingWindow: UIWindow {
    /// Tracks the last time this window was interacted with
    var lastInteraction = Date.distantPast

    override func sendEvent(_ event: UIEvent) {
        super.sendEvent(event)
        lastInteraction = Date()
    }
}

