//
//  ProfileInteractor.swift
//  RentApp
//
//  Created by Melanie Kofman on 27.12.2020.
//

import UIKit
import Firebase


class ProfileInteractor: ProfileInteractorProtocol {
    weak var presenter: ProfilePresenterProtocol!

    required init(presenter: ProfilePresenterProtocol) {
        self.presenter = presenter
    }
    
    func logout() {
        do {
            try Firebase.Auth.auth().signOut()
        } catch let logoutError {
            print(logoutError)
        }
        self.presenter.logoutAction()
    }
    
    
}

