//
//  PaymentPresenter.swift
//  RentApp
//
//  Created by Melanie Kofman on 07.12.2020.
//

import UIKit


class PaymentPresenter: PaymentPresenterProtocol {
    weak var view: PaymentViewProtocol!
    var interactor: PaymentInteractorProtocol!
    var router: PaymentRouterProtocol!
    

    required init(view: PaymentViewProtocol) {
        self.view = view
    }
    
    func showMethods() {
        router.showMethods()
    }
    
    func showStat() {
        router.showStat()
    }
    
    func showSettings() {
        router.showSettings()
    }
}
