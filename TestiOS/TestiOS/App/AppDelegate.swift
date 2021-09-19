//
//  AppDelegate.swift
//  TestiOS
//
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let firstView = ListUserWireFrame.createListUserModule()
        window = .init(frame: UIScreen.main.bounds)
        window?.rootViewController = firstView
        window?.makeKeyAndVisible()
        return true
    }
}

