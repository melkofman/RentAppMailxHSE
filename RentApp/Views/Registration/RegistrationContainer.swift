//
//  RegistrationContainer.swift
//  RentApp
//
//  Created by Melanie Kofman on 14.12.2020.
//

import UIKit

final class RegistrationContainer {
    let viewController: UIViewController
    weak var moduleInput: RegistrationModuleInput?
    
    static func assemble(moduleOutput: RegistrationModuleOutput) -> RegistrationContainer {
        let router = RegistrationRouter()
        let interactor = RegistrationInteractor()
        let presenter = RegistrationPresenter(interactor: interactor, router: router)
        interactor.output = presenter
        presenter.moduleOutput = moduleOutput
        let viewController = RegistrationViewController(output: presenter)
        router.viewController = viewController
        router.output = presenter
        
        return RegistrationContainer(viewController: viewController, moduleInput: presenter)
    }
    
    init(viewController: UIViewController, moduleInput: RegistrationModuleInput?) {
        self.viewController = viewController
        self.moduleInput = moduleInput
    }
}
