//
//  PInfoRouter.swift
//  RentApp
//
//  Created by Melanie Kofman on 28.12.2020.
//

import UIKit

class PInfoRouter: PInfoRouterProtocol {
    weak var viewController: PInfoViewController!
    
    init(viewController: PInfoViewController) {
        self.viewController = viewController
    }
}
