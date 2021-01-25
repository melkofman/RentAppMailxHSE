//
//  aboutAppController.swift
//  RentApp
//
//  Created by Савва Шулятьев on 12.01.2021.
//

import UIKit

class aboutAppController: UIViewController {
    
    var topView = UIView()
    var bigLabel = UILabel()
    var smallLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colors()
        
        self.view.addSubview(topView)
        topViewConstraints()
        
        self.view.addSubview(bigLabel)
        self.view.addSubview(smallLabel)
        labelsConstraints()
        
    }
    
    private func colors() {
        self.view.backgroundColor = .white
        self.topView.backgroundColor = .gray
        self.bigLabel.backgroundColor = .white
        self.smallLabel.backgroundColor = .white
    }
    
    private func topViewConstraints() {
        self.topView.translatesAutoresizingMaskIntoConstraints = false
        self.topView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        self.topView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        self.topView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        self.topView.heightAnchor.constraint(equalToConstant: 51).isActive = true
        self.topView.layer.cornerRadius = 15
        self.topView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
    }
    
    private func labelsConstraints() {
        self.bigLabel.translatesAutoresizingMaskIntoConstraints = false
        self.bigLabel.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 20).isActive = true
        self.bigLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        self.bigLabel.widthAnchor.constraint(equalToConstant: self.view.frame.width / 2).isActive = true
        self.bigLabel.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        self.smallLabel.translatesAutoresizingMaskIntoConstraints = false
        self.smallLabel.topAnchor.constraint(equalTo: bigLabel.bottomAnchor, constant: 20).isActive = true
        self.smallLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        self.smallLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        self.smallLabel.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        bigLabel.text = "   КАК                     ЭТО                  РАБОТАЕТ"
        bigLabel.textColor = .black
        bigLabel.numberOfLines = 3
    }
}
