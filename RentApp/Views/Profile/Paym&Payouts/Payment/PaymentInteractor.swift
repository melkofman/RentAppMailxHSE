//
//  PaymentInteractor.swift
//  RentApp
//
//  Created by Melanie Kofman on 07.12.2020.
//

import UIKit



class PaymentInteractor: PaymentInteractorProtocol {
    weak var presenter: PaymentPresenterProtocol!

    required init(presenter: PaymentPresenterProtocol) {
        self.presenter = presenter
    }
    
    
}
