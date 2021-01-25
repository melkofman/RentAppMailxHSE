
//
//  ChatRouter.swift
//  chatt
//
//  Created by Melanie Kofman on 26.11.2020.
//  Copyright © 2020 Melanie Kofman. All rights reserved.
//

import UIKit

class ChatRouter: ChatRouterProtocol {
    weak var viewController: ChatViewController!
    
    init(viewController: ChatViewController) {
        self.viewController = viewController
    }
    func backClicked() {
        self.viewController?.navigationController?.popToRootViewController(animated: true)
    }
}
