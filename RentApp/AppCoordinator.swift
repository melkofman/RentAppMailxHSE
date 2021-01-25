//
//  AppCoordinator.swift
//  RentApp
//
//  Created by Melanie Kofman on 14.12.2020.
//

import UIKit
import Firebase
import NAChloride

final class AppCoordinator {
    
    private let window = UIWindow(frame: UIScreen.main.bounds)
    
    func start() {
        
        let container = LoginContainer.assemble(moduleOutput: self)
        
        
        
        self.window.rootViewController = container.viewController
        self.window.makeKeyAndVisible()
        FirebaseApp.configure()
        NAChlorideInit()
    }
}

extension AppCoordinator: LoginModuleOutput {
    
    
    func openApplication(dict: [String: AnyObject]){
        self.window.rootViewController = MainTabBarController(dict: dict, moduleOutput: self)
    }
    
    func openReg() {
        
        let container = RegistrationContainer.assemble(moduleOutput: self)
        self.window.rootViewController = container.viewController
        self.window.makeKeyAndVisible()
        
    }
    
    func presentAlert(alert: UIAlertController) {
        self.window.rootViewController?.present(alert, animated: true)
    }
}
extension AppCoordinator: RegistrationModuleOutput {
    func returnBack() {
        
        let container = LoginContainer.assemble(moduleOutput: self)
        self.window.rootViewController = container.viewController
        self.window.makeKeyAndVisible()
        
    }
    
    func openApp(dict: [String: AnyObject]){
        self.window.rootViewController = MainTabBarController(dict: dict, moduleOutput: self)
    }
    
    func showAlert(alert: UIAlertController) {
        self.window.rootViewController?.present(alert, animated: true)
    }
}




extension AppCoordinator: MainTabBarModuleOutput, ProfileModuleOutput {
    
    
    
    func createProfileVC(dict: [String: AnyObject]) -> ProfileContainer {
        return ProfileContainer.configure(moduleOutput: self, dict: dict)
    }
    func logout() {
        let container = LoginContainer.assemble(moduleOutput: self)
        self.window.rootViewController = container.viewController
        self.window.makeKeyAndVisible()
    }
    func show_alert(alert: UIAlertController) {
        self.window.rootViewController?.present(alert, animated: true)
    }
    
}
