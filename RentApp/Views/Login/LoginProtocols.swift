//
//  LoginProtocols.swift
//  RentApp
//
//  Created by Melanie Kofman on 04.12.2020.
//

import UIKit

protocol LoginModuleInput: class {
    
}

protocol LoginModuleOutput: class {
    
    func openApplication(dict: [String: AnyObject])
    func openReg()
    func presentAlert(alert: UIAlertController)
}


protocol LoginViewInput {
    
}

protocol LoginViewOutput: class {
    func handleRegistration()
    func handleLogin(email: String, password: String)
    
}

protocol LoginInteractorInput {
    
     func loginAction(email: String, password: String)
}

protocol LoginInteractorOutput: class {
    func openApp(dict: [String: AnyObject])
    func openalert(alert: UIAlertController)
    
}

protocol LoginRouterInput {

}

protocol LoginRouterOutput: class {
    
}
