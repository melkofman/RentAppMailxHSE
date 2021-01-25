//
//  ProfileProtocols.swift
//  RentApp
//
//  Created by Melanie Kofman on 27.12.2020.
//

import UIKit


protocol ProfileModuleOutput: class {

    func logout()
    func show_alert(alert: UIAlertController)
    
    
}


protocol ProfileViewControllerProtocol: class {
    
}

protocol ProfilePresenterProtocol: class {
    var router: ProfileRouterProtocol! {set get}
    func showPay()
    func showPInfo(dict: [String:AnyObject])
    func logout()
    func logoutAction()
    func showAbout()
    func close_alert(alert: UIAlertController)
    func show_alert(alert: UIAlertController)
    func showFeedback()
    
}

protocol ProfileInteractorProtocol: class {
    func logout()
}

protocol ProfileRouterProtocol: class {
    func showPay()
    func showPInfo(dict: [String:AnyObject])
    func openAbout()
    func close_alert(alert: UIAlertController)
    func showFeedback()
}

protocol ProfileContainerProtocol: class {
    static func configure (moduleOutput: ProfileModuleOutput, dict: [String: AnyObject]) -> ProfileContainer
}
