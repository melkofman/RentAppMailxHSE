//
//  PInfoProtocols.swift
//  RentApp
//
//  Created by Melanie Kofman on 28.12.2020.
//

import UIKit

protocol PInfoViewControllerProtocol: class {
    
}

protocol PInfoPresenterProtocol: class {
    var router: PInfoRouterProtocol! {set get}

    func addData(dict: [String: AnyObject], viewController: PInfoViewController)
    func addDataImage(dict: [String: AnyObject], newimage: UIImage, viewController: PInfoViewController)
    func update_dict(viewController: PInfoViewController)

    
}

protocol PInfoInteractorProtocol: class {

    func addData(dict: [String: AnyObject], viewController: PInfoViewController)
    func addDataImage(dict: [String: AnyObject], newimage: UIImage?, viewController: PInfoViewController)
    func update_dict(viewController: PInfoViewController)

}

protocol PInfoRouterProtocol: class {
    
}

protocol PInfoContainerProtocol: class {
    func configure(with viewController: PInfoViewController)
}
