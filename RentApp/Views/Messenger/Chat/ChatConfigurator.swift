
//
//  ChatConfigurator.swift
//  chatt
//
//  Created by Melanie Kofman on 26.11.2020.
//  Copyright © 2020 Melanie Kofman. All rights reserved.
//

import UIKit


class ChatConfigurator: ChatConfiguratorProtocol{
    func configure(with viewController: ChatViewController){
        let presenter = ChatPresenter(view: viewController)
        let interactor = ChatInteractor(presenter: presenter)
        let router = ChatRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
}
