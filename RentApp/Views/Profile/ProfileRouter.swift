//
//  ProfileRouter.swift
//  RentApp
//
//  Created by Melanie Kofman on 27.12.2020.
//

import UIKit


class ProfileRouter: ProfileRouterProtocol {
    weak var viewController: ProfileViewController!
    
    init(viewController: ProfileViewController) {
        self.viewController = viewController
    }
    
    func showPay() {
        let controller = PaymentViewController()
        controller.modalPresentationStyle = UIModalPresentationStyle.custom
        
        self.viewController.present(controller, animated: true, completion: nil)
        
        
        
    }
    
    func showPInfo(dict: [String:AnyObject]) {
        let controller = PInfoViewController(dict: dict, rootViewController: self.viewController)
        controller.modalPresentationStyle = .popover
        self.viewController.present(controller, animated: true, completion: nil)
    }
    

    
    func openAbout() {
        let controller = AboutViewController()
        controller.modalPresentationStyle = .popover
        self.viewController.present(controller, animated: true, completion: nil)
    }
    
    func close_alert(alert: UIAlertController) {
        alert.dismiss(animated: true, completion: nil)
    }
    
    func showFeedback() {
        let controller = FeedbackController()
        controller.modalPresentationStyle = .popover
        self.viewController.present(controller, animated: true, completion: nil)
    }
}
