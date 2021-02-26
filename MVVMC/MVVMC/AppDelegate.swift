//
//  AppDelegate.swift
//  MVVMC
//
//  Created by Abe Wang on 2021/2/26.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var coordinator: MainCoordinator?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        
        coordinator = MainCoordinator(window: window!)
        coordinator?.start()
        
        return true
    }
}

