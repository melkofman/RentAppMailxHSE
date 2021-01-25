
//
//  ObserveChatsPresenter.swift
//  chatt
//
//  Created by Melanie Kofman on 26.11.2020.
//  Copyright © 2020 Melanie Kofman. All rights reserved.
//

import UIKit

class ObserveChatsPresenter: ObserveChatsPresenterProtocol {
    weak var view: ObserveChatsViewProtocol!
    var interactor: ObserveChatsInteractorProtocol!
    var router: ObserveChatsRouterProtocol!
    
    required init(view: ObserveChatsViewProtocol) {
        self.view = view
    }

    func chatClicked(user: User, sender: String) {
        router.showChat(user, sender: sender)
    }
    func setUserName(user: User, chatViewController: ChatViewController) {
        interactor.changeName(name: user.name!, chatViewController: chatViewController)
    }
    
}
