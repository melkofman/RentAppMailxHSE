//
//  AboutViewController.swift
//  RentApp
//
//  Created by Melanie Kofman on 07.01.2021.
//

import UIKit

class AboutViewController: UIViewController {
    
    
    let aboutContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let screenTitle: UILabel = {
        let title = UILabel()
        title.text = "О приложении"
        title.textAlignment = NSTextAlignment.center
        title.textColor = .gray
        title.font = UIFont.systemFont(ofSize: 26)
        title.backgroundColor = .clear
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    let screenText: UITextView = {
        let title = UITextView()
        title.text = "Данное приложение было разработано в рамках учебного курса Mail.ru совместо с НИУ ВШЭ. Приложение RentApp позволяет пользователю арендовать жилье в любом городе."
        title.textAlignment = NSTextAlignment.center
        title.textColor = .gray
        title.font = UIFont.systemFont(ofSize: 18)
        title.backgroundColor = .clear
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    let screenFooter: UILabel = {
        let title = UILabel()
        title.text = "Сделано студентами ИВТ, ПМ. Версия 1.0."
        title.textAlignment = NSTextAlignment.justified
        title.textColor = .gray
        title.font = UIFont.boldSystemFont(ofSize: 14)
        title.backgroundColor = .clear
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(aboutContainerView)
//        self.view.backgroundColor = .red
        setupComponents()
    }
    
    func setupComponents() {
        
        aboutContainerView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        aboutContainerView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        aboutContainerView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height).isActive = true
        aboutContainerView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
        
        aboutContainerView.addSubview(screenTitle)
        screenTitle.topAnchor.constraint(equalTo: aboutContainerView.topAnchor, constant: 10).isActive = true
        screenTitle.centerXAnchor.constraint(equalTo: aboutContainerView.centerXAnchor).isActive = true
        screenTitle.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        aboutContainerView.addSubview(screenText)
        screenText.topAnchor.constraint(equalTo: screenTitle.bottomAnchor, constant: 20).isActive = true
        screenText.centerXAnchor.constraint(equalTo: screenTitle.centerXAnchor).isActive = true
        screenText.leftAnchor.constraint(equalTo: aboutContainerView.leftAnchor, constant: 3).isActive = true
        screenText.heightAnchor.constraint(equalToConstant: 250).isActive = true
        
        aboutContainerView.addSubview(screenFooter)
        screenFooter.bottomAnchor.constraint(equalTo: aboutContainerView.bottomAnchor, constant: -10).isActive = true
        screenFooter.centerXAnchor.constraint(equalTo: aboutContainerView.centerXAnchor).isActive = true
        screenFooter.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
}
