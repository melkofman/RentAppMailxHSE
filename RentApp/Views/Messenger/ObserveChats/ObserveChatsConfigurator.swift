
//
//  ObserveChatsConfigurator.swift
//  chatt
//
//  Created by Melanie Kofman on 26.11.2020.
//  Copyright © 2020 Melanie Kofman. All rights reserved.
//
import Foundation
import UIKit

class ObserveChatsConfigurator: ObserveChatsConfiguratorProtocol {
    func configure (with viewController: ObserveChatsViewController) {
        let presenter = ObserveChatsPresenter(view: viewController)
        let interactor = ObserveChatsInteractor(presenter: presenter)
        let router = ObserveChatsRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
        
    }
}
