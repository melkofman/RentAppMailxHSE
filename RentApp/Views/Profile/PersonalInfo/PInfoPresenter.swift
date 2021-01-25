//
//  PInfoPresenter.swift
//  RentApp
//
//  Created by Melanie Kofman on 28.12.2020.
//

import UIKit

class PInfoPresenter: PInfoPresenterProtocol {
    weak var view: PInfoViewControllerProtocol!
    var interactor: PInfoInteractorProtocol!
    var router: PInfoRouterProtocol!
    
    required init(view: PInfoViewControllerProtocol) {
        self.view = view
    }

    func addData(dict: [String: AnyObject], viewController: PInfoViewController) {
        self.interactor.addData(dict: dict, viewController: viewController)
    }
    
    func addDataImage(dict: [String: AnyObject], newimage: UIImage, viewController: PInfoViewController) {
        self.interactor.addDataImage(dict: dict, newimage: newimage, viewController: viewController)
    }
    
    func update_dict(viewController: PInfoViewController) {
        self.interactor.update_dict(viewController: viewController)
    }

}
