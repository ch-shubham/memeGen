//
//  AppDelegate.swift
//  memeGen
//
//  Created by user224812 on 8/1/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        self.window = UIWindow.init(frame: UIScreen.main.bounds)
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ViewController") as? ViewController
//        self.window?.rootViewController = UINavigationController(rootViewController: DashboardViewController()) // Calliong directly XIB file
        self.window?.rootViewController = UINavigationController(rootViewController: vc!)
        self.window?.makeKeyAndVisible()
        return true
        
    }

}

