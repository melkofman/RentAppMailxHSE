//
//  QRViewController.swift
//  RentApp
//
//  Created by Тагир Ракипов on 11.01.2021.
//

import UIKit

class QRViewController: UIViewController {
    var code: String? {
        didSet {
            if let imageCode = code {
                codeView.image = UIImage(named: "qr_" + imageCode)
            }
        }
    }
    
    let codeView = getImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(codeView)
        view.backgroundColor = .white
        pinCodeView()
    }
}

extension QRViewController {
    func pinCodeView(){
        codeView.contentMode = .scaleAspectFit
        codeView.translatesAutoresizingMaskIntoConstraints = false
        codeView.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor).isActive = true
        codeView.leadingAnchor.constraint(equalTo:view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        codeView.trailingAnchor.constraint(equalTo:view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        codeView.bottomAnchor.constraint(equalTo:view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}
