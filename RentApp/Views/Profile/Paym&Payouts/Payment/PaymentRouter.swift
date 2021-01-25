//
//  PaymentRouter.swift
//  RentApp
//
//  Created by Melanie Kofman on 07.12.2020.
//

import UIKit

class PaymentRouter: PaymentRouterProtocol {
    weak var viewController: PaymentViewController!

    init(viewController: PaymentViewController) {
        self.viewController = viewController
    }
    
    func showMethods() {
        let controller = MethodsViewController()
        controller.modalPresentationStyle = UIModalPresentationStyle.popover
        self.viewController.present(controller, animated: true, completion: nil)
    }
    
    func showStat() {
        let controller = StatisticsViewController()
        controller.modalPresentationStyle = UIModalPresentationStyle.popover
        self.viewController.present(controller, animated: true, completion: nil)
    }
    
    func showSettings() {
        let controller = SettingsViewController()
        controller.modalPresentationStyle = UIModalPresentationStyle.popover
        self.viewController.present(controller, animated: true, completion: nil)
    }
}
