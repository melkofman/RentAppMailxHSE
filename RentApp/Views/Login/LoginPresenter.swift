//
//  LoginPresenter.swift
//  RentApp
//
//  Created by Melanie Kofman on 04.12.2020.
//

import UIKit

final class LoginPresenter {
    weak var moduleOutput: LoginModuleOutput?
    weak var view: LoginViewOutput?
    private let router: LoginRouter
    private let interactor: LoginInteractorInput
    
    init(interactor: LoginInteractorInput, router: LoginRouter) {
        self.router = router
        self.interactor = interactor
    }
}

extension LoginPresenter: LoginViewOutput {
    func handleRegistration() {
        
        self.moduleOutput?.openReg()

    }
    
    func handleLogin(email: String, password: String) {
        self.interactor.loginAction(email: email, password: password)
    }
    
}

extension LoginPresenter: LoginInteractorOutput {
    func openApp(dict: [String: AnyObject]) {
        self.moduleOutput?.openApplication(dict: dict)
        
    }
    func openalert(alert: UIAlertController) {
        self.moduleOutput!.presentAlert(alert: alert)
    }
    
}

extension LoginPresenter: LoginModuleInput {
    
}

extension LoginPresenter: LoginRouterOutput{
    
}


