//
//  ProfilePresenter.swift
//  RentApp
//
//  Created by Melanie Kofman on 27.12.2020.
//

import UIKit



class ProfilePresenter: ProfilePresenterProtocol {
    weak var view: ProfileViewControllerProtocol!
    var interactor: ProfileInteractorProtocol!
    var router: ProfileRouterProtocol!
    
    weak var moduleOutput: ProfileModuleOutput?
    
    required init(view: ProfileViewControllerProtocol) {
        self.view = view
    }
    
    func showPInfo(dict: [String:AnyObject]) {
        self.router.showPInfo(dict: dict)
    }
    
    func showPay() {
        self.router.showPay()
    }
    
    func logout() {
        self.interactor.logout()
        
    }
    
    func logoutAction() {
        self.moduleOutput?.logout()
    }
    
    func showAbout() {
        self.router.openAbout()
    }
    
    func close_alert(alert: UIAlertController) {
        self.router.close_alert(alert: alert)
    }
    
    func show_alert(alert: UIAlertController) {
        self.moduleOutput?.show_alert(alert: alert)
        
    }
    
    func showFeedback() {
        self.router.showFeedback()
    }
}
