//
//  StatisticsViewController.swift
//  RentApp
//
//  Created by Melanie Kofman on 07.12.2020.
//

import UIKit

class StatisticsViewController: UIViewController {
    
    let ContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
   let statTitle: UILabel = {
        let title = UILabel()
        title.text = "Ваша статистика платежей"
        title.textAlignment = NSTextAlignment.center
        title.textColor = .gray
        title.font = UIFont.boldSystemFont(ofSize: 16)
        title.backgroundColor = .clear
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    let statText: UITextView = {
        let title = UITextView()
        title.text = "Здесь будет отображаться Ваша статистика платежей."
        title.textAlignment = NSTextAlignment.center
        title.textColor = .gray
        title.font = UIFont.systemFont(ofSize: 16)
        title.backgroundColor = .clear
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(named: "statistics")
        imageView.image = image
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 5
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override func viewDidLoad() {
           super.viewDidLoad()
           self.view.addSubview(ContainerView)
        
           setView()

       }
    func setView() {
        ContainerView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        ContainerView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        ContainerView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        ContainerView.heightAnchor.constraint(equalTo: self.view.heightAnchor).isActive = true
        ContainerView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
        ContainerView.addSubview(statTitle)
        
        statTitle.topAnchor.constraint(equalTo: ContainerView.topAnchor, constant: 10).isActive = true
        statTitle.leftAnchor.constraint(equalTo: ContainerView.leftAnchor, constant: 10).isActive = true
        statTitle.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        ContainerView.addSubview(statText)
        
        statText.topAnchor.constraint(equalTo: statTitle.bottomAnchor, constant: 20).isActive = true
        statText.centerXAnchor.constraint(equalTo: ContainerView.centerXAnchor).isActive = true
        statText.heightAnchor.constraint(equalToConstant: 200).isActive = true
        statText.widthAnchor.constraint(equalTo: ContainerView.widthAnchor).isActive = true
        
        ContainerView.addSubview(imageView)
        
        imageView.centerXAnchor.constraint(equalTo: ContainerView.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: ContainerView.centerYAnchor).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        
    }
    
}

