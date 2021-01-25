//
//  RegistrationPresenter.swift
//  RentApp
//
//  Created by Melanie Kofman on 05.12.2020.
//

import UIKit


final class RegistrationPresenter {
    weak var moduleOutput: RegistrationModuleOutput?
    weak var view: RegistrationViewOutput?
    private let router: RegistrationRouter
    private let interactor: RegistrationInteractorInput
    
    init(interactor: RegistrationInteractorInput, router: RegistrationRouter) {
        self.router = router
        self.interactor = interactor
    }
}

extension RegistrationPresenter: RegistrationViewOutput {
    func back() {
        
        self.moduleOutput?.returnBack()
        
    }
    
    func registration(email: String, name: String, password: String, phone: String, age: String) {
        self.interactor.regAction(email: email, name: name, password: password, phone: phone, age: age)
    }
}

extension RegistrationPresenter: RegistrationInteractorOutput {

    func openApp(dict: [String: AnyObject]) {
        self.moduleOutput?.openApp(dict: dict)
    }
    
    func openAlert(alert: UIAlertController) {
         self.moduleOutput!.showAlert(alert: alert)
    }
    
}

extension RegistrationPresenter: RegistrationModuleInput {
    
}

extension RegistrationPresenter: RegistrationRouterOutput{
    
}
