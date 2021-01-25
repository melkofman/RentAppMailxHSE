//
//  RegistrationProtocols.swift
//  RentApp
//
//  Created by Melanie Kofman on 05.12.2020.
//

import UIKit

protocol RegistrationModuleInput: class {
    
}

protocol RegistrationModuleOutput: class {
    
    func returnBack()
    func openApp(dict: [String: AnyObject])
    func showAlert(alert: UIAlertController)

}

protocol RegistrationViewInput {
    
}

protocol RegistrationViewOutput: class {
    func back()
    func registration(email: String, name: String, password: String, phone: String, age: String)
}

protocol RegistrationInteractorInput {
    func regAction(email: String, name: String, password: String, phone: String, age: String)
}

protocol RegistrationInteractorOutput: class {
    func openApp(dict: [String: AnyObject])
    func openAlert(alert: UIAlertController) 
}

protocol RegistrationRouterInput {
    
}

protocol RegistrationRouterOutput: class {
    
}

