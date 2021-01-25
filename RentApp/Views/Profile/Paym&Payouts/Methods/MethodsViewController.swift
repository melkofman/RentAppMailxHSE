//
//  MethodsViewController.swift
//  RentApp
//
//  Created by Melanie Kofman on 07.12.2020.
//

import UIKit

class MethodsViewController: UIViewController {

    let ContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let cardPaymentBtn: UIButton = {
        let button = UIButton()
        button.backgroundColor = PURPLE_THEME
        button.setTitle("Оплата картой", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(cardHandle), for: .touchDown)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let certPaymentBtn: UIButton = {
        let button = UIButton()
        button.backgroundColor = PURPLE_THEME
        button.setTitle("Подарочный сертификат", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(certHandle), for: .touchDown)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let certPaymentBtn2: UIButton = {
        let button = UIButton()
        button.backgroundColor = PURPLE_THEME
        button.setTitle("Подарочный сертификат", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let metTitile: UILabel = {
        let title = UILabel()
        title.text = "Способы оплаты"
        title.textAlignment = NSTextAlignment.center
        title.textColor = .gray
        title.font = UIFont.boldSystemFont(ofSize: 16)
        title.backgroundColor = .clear
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    let textView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    let certTextView: UITextView = {
        let title = UITextView()
        title.text = "Данный раздел находится в разработке. Чтобы приобрести подарочный сертификат или воспользоваться им, перейдите на наш сайт."
        title.textAlignment = NSTextAlignment.center
        title.textColor = .gray
        title.font = UIFont.systemFont(ofSize: 14)
        title.backgroundColor = .clear
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    let cardDetailsViewContainer: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .gray
        return view
    }()
    
    let detailsTitle: UILabel = {
        let title = UILabel()
        title.text = "Карта"
        title.textAlignment = NSTextAlignment.center
        title.textColor = .black
        title.font = UIFont.systemFont(ofSize: 16)
        title.backgroundColor = .clear
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private var cardDetailsisShown = false
    private var certTextFieldisShown = false
    
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
        
        ContainerView.addSubview(metTitile)
        
        metTitile.topAnchor.constraint(equalTo: ContainerView.topAnchor, constant: 10).isActive = true
        metTitile.leftAnchor.constraint(equalTo: ContainerView.leftAnchor, constant: 10).isActive = true
        metTitile.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        
        ContainerView.addSubview(cardPaymentBtn)
        ContainerView.addSubview(certPaymentBtn)

        cardPaymentBtn.topAnchor.constraint(equalTo: metTitile.bottomAnchor, constant: 10).isActive = true
        cardPaymentBtn.widthAnchor.constraint(equalTo: ContainerView.widthAnchor).isActive = true
        cardPaymentBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true

        certPaymentBtn.topAnchor.constraint(equalTo: cardPaymentBtn.bottomAnchor, constant: 50).isActive = true
        certPaymentBtn.widthAnchor.constraint(equalTo: ContainerView.widthAnchor).isActive = true
        certPaymentBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
        ContainerView.addSubview(textView)
        
        textView.topAnchor.constraint(equalTo: certPaymentBtn.bottomAnchor, constant: 20).isActive = true
        textView.widthAnchor.constraint(equalTo: ContainerView.widthAnchor).isActive = true
        textView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        textView.centerXAnchor.constraint(equalTo: certPaymentBtn.centerXAnchor).isActive = true
        textView.isHidden = true
        
        textView.addSubview(certTextView)
        certTextView.topAnchor.constraint(equalTo: textView.topAnchor).isActive = true
        certTextView.bottomAnchor.constraint(equalTo: textView.bottomAnchor).isActive = true
        certTextView.widthAnchor.constraint(equalTo: textView.widthAnchor).isActive = true
        certTextView.isHidden = true
        
        ContainerView.addSubview(cardDetailsViewContainer)
        
        cardDetailsViewContainer.topAnchor.constraint(equalTo: cardPaymentBtn.bottomAnchor, constant: 30).isActive = true
        cardDetailsViewContainer.heightAnchor.constraint(equalToConstant: 340).isActive = true
        cardDetailsViewContainer.widthAnchor.constraint(equalToConstant: 360).isActive = true
        cardDetailsViewContainer.centerXAnchor.constraint(equalTo: cardPaymentBtn.centerXAnchor).isActive = true
        cardDetailsViewContainer.isHidden = true
        
        ContainerView.addSubview(certPaymentBtn2)
        
        certPaymentBtn2.topAnchor.constraint(equalTo: cardDetailsViewContainer.bottomAnchor, constant: 30).isActive = true
        certPaymentBtn2.widthAnchor.constraint(equalTo: ContainerView.widthAnchor).isActive = true
        certPaymentBtn2.heightAnchor.constraint(equalToConstant: 50).isActive = true
        certPaymentBtn2.isHidden = true
        
        cardDetailsViewContainer.addSubview(detailsTitle)
        
        detailsTitle.topAnchor.constraint(equalTo: cardDetailsViewContainer.topAnchor, constant: 10).isActive = true
        detailsTitle.leftAnchor.constraint(equalTo: cardDetailsViewContainer.leftAnchor, constant: 10).isActive = true
        detailsTitle.heightAnchor.constraint(equalToConstant: 25).isActive = true
        detailsTitle.isHidden = true
        
        
        
    }
    private var certButtonTopConstraint: NSLayoutConstraint?
    @objc func cardHandle(){
        cardDetailsViewContainer.isHidden = cardDetailsisShown
        detailsTitle.isHidden = cardDetailsisShown
        certPaymentBtn2.isHidden = cardDetailsisShown
        
        textView.isHidden = true
        certTextView.isHidden = true
        
        certPaymentBtn.isHidden = !cardDetailsisShown
        self.cardDetailsisShown = !cardDetailsisShown

    }
    @objc
    func certHandle() {
        textView.isHidden = certTextFieldisShown
        certTextView.isHidden = certTextFieldisShown
        self.certTextFieldisShown = !certTextFieldisShown
        
    }
}
