//
//  PaymentContainer.swift
//  RentApp
//
//  Created by Melanie Kofman on 27.12.2020.
//

import UIKit

class PaymentContainer: PaymentContainerProtocol {
    func configure(with viewController: PaymentViewController) {
        let presenter = PaymentPresenter(view: viewController)
        let interactor = PaymentInteractor(presenter: presenter)
        let router = PaymentRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
        
    }
}
