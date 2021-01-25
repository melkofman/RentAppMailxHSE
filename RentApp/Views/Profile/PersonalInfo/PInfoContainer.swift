//
//  PInfoContainer.swift
//  RentApp
//
//  Created by Melanie Kofman on 28.12.2020.
//

import UIKit

class PInfoContainer: PInfoContainerProtocol {
    func configure(with viewController: PInfoViewController) {
        let presenter = PInfoPresenter(view: viewController)
        let interactor = PInfoInteractor(presenter: presenter)
        let router = PInfoRouter(viewController: viewController)
        viewController.presenter = presenter
        presenter.router = router
        presenter.interactor = interactor
    }
}
