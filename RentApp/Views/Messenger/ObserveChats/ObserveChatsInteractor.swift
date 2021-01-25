
//
//  ObserveChatsInteractor.swift
//  chatt
//
//  Created by Melanie Kofman on 26.11.2020.
//  Copyright © 2020 Melanie Kofman. All rights reserved.
//

import UIKit

class ObserveChatsInteractor: ObserveChatsInteractorProtocol {
    weak var presenter: ObserveChatsPresenterProtocol!
    
    required init(presenter: ObserveChatsPresenterProtocol) {
        self.presenter = presenter
    }
    
    func changeName (name: String, chatViewController: ChatViewController) {
        chatViewController.name = name
    }
    
}
