//
//  SavesProtocols.swift
//  RentApp
//
//  Created by Тагир Ракипов on 06.01.2021.
//

import Foundation

protocol SavesViewProtocol: class { }

protocol SavePresenterProtocol: class {
    var router: SavesRouterProtocol! { set get }

    func configureView()
}

protocol SaveInteractorProtocol: class { }

protocol SavesRouterProtocol: class {
    func apartmentClicked()
}

protocol SavesConfiguratorProtocol: class {
    func configure(with viewController: SavesViewController)
}
