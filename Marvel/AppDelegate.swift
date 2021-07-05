//
//  AppDelegate.swift
//  Marvel
//
//  Created by João Igor de Andrade Oliveira on 29/06/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let mainViewController = MainViewController()
        let mainNavigationController = UINavigationController(rootViewController: mainViewController)
        window = UIWindow(frame:UIScreen.main.bounds)
        window?.tintColor = .red
        window?.makeKeyAndVisible()
        window?.rootViewController = mainNavigationController
        
        
        
        return true
    }

}

