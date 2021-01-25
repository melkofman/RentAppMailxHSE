//
//  LoginContainer.swift
//  RentApp
//
//  Created by Melanie Kofman on 14.12.2020.
//

import UIKit

final class LoginContainer {
    let viewController: UIViewController
    weak var moduleInput: LoginModuleInput?
    
    static func assemble(moduleOutput: LoginModuleOutput) -> LoginContainer {
        let router = LoginRouter()
        let interactor = LoginInteractor()
        let presenter = LoginPresenter(interactor: interactor, router: router)
        interactor.output = presenter
        presenter.moduleOutput = moduleOutput
        let viewController = LoginViewController(output: presenter)
        router.viewController = viewController
        router.output = presenter
        
        
        return LoginContainer(viewController: viewController, moduleInput: presenter)
    }
    
    init(viewController: UIViewController, moduleInput: LoginModuleInput?) {
        self.viewController = viewController
        self.moduleInput = moduleInput
    }
}


