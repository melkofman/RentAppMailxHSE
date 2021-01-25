//
//  ProfileContainer.swift
//  RentApp
//
//  Created by Melanie Kofman on 27.12.2020.
//

import UIKit


class ProfileContainer: ProfileContainerProtocol {
    let viewController: UIViewController
   static func configure (moduleOutput: ProfileModuleOutput, dict: [String: AnyObject]) -> ProfileContainer {
    
        let viewController = ProfileViewController(dict: dict)
    
    
        let presenter = ProfilePresenter(view: viewController)
        let interactor = ProfileInteractor(presenter: presenter)
        let router = ProfileRouter(viewController: viewController)

    presenter.moduleOutput = moduleOutput
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    
    return ProfileContainer(viewController: viewController, dict: dict)
    }
    
    init(viewController: UIViewController, dict: [String: AnyObject]) {
        self.viewController = viewController
        
    }
}
