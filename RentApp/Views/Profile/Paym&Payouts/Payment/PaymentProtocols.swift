//
//  PaymentProtocols.swift
//  RentApp
//
//  Created by Melanie Kofman on 07.12.2020.
//
import UIKit

protocol PaymentViewProtocol: class {
    
}

protocol PaymentContainerProtocol: class {
    func configure(with viewController: PaymentViewController)
}

protocol PaymentRouterProtocol: class {
    func showMethods()
    func showStat()
    func showSettings()

}

protocol PaymentPresenterProtocol: class {
    var router: PaymentRouterProtocol! {set get}
    func showMethods()
    func showStat()
    func showSettings()
}

protocol PaymentInteractorProtocol {
 
}




//new

//protocol PaymentModuleInput: class {
//    
//}
//
//protocol PaymentModuleOutput: class {
//    
//}
//
//protocol PaymentViewInput {
//    
//}
//
//protocol PaymentViewOutput: class {
////    func showmethods()
//}
//
//protocol PaymentInteractorInput {
//    
//}
//
//protocol PaymentInteractorOutput: class {
//    
//}
//
//protocol PaymentRouterInput {
//    
//}

protocol PaymentRouterOutput: class {
    
}
