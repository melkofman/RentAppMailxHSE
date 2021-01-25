//
//  AppDelegate.swift
//  RentApp
//
//  Created by Савва Шулятьев on 17.11.2020.
//

import UIKit
import Firebase
@UIApplicationMain
//@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    private lazy var coordinator = AppCoordinator()
    
//    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.coordinator.start()
        
        
        
        return true
    }
}

