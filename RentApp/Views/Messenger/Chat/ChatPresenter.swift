
//
//  ChatPresentor.swift
//  chatt
//
//  Created by Melanie Kofman on 26.11.2020.
//  Copyright © 2020 Melanie Kofman. All rights reserved.
//

import UIKit

class ChatPresenter: ChatPresenterProtocol {
    weak var view: ChatViewProtocol!
    var interactor: ChatInteractorProtocol!
    var router: ChatRouterProtocol!
    
    required init(view: ChatViewProtocol) {
        self.view = view
    }
    
    
    func handleBack() {
        router.backClicked()
    }
    
    func decideHelperOrNot(name: String, chatViewController: ChatViewController) {
        interactor.helperOrNot(name: name, chatViewController: chatViewController)
    }
    
    func decideColor(from: String) -> Bool {
        return interactor.decideCellColor(from: from)
    }
    
    
    func handleSend(text: String, uid: String, chatViewController: ChatViewController)
 {
    interactor.handleSend(text: text, uid: uid, chatViewController: chatViewController)
    }
    
    func observe_user_messages(chatViewController: ChatViewController) {
        interactor.observe_user_messages(chatViewController: chatViewController)
    }
    
    
}

