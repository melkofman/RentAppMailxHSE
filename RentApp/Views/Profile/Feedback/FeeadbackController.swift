

import UIKit

class FeedbackController: UIViewController {
    
    
    let screenTitle: UILabel = {
          let title = UILabel()
          title.text = "Обратная связь"
          title.textAlignment = NSTextAlignment.center
        title.textColor = .gray
          title.font = UIFont.boldSystemFont(ofSize: 35)
          title.backgroundColor = .clear
        
          title.translatesAutoresizingMaskIntoConstraints = false
        let frame = title.frame
        let bottomLayer = CALayer()
        bottomLayer.frame = CGRect(x: 0, y: 100, width: 500, height: 1.5)
        bottomLayer.backgroundColor = UIColor.gray.cgColor
        title.layer.addSublayer(bottomLayer)
     
          return title
      }()
    
   let nameTextField: UITextField = {
        let name = UITextField()
        
        let attributedPlaceholder = NSAttributedString(string: "Как вас зовут?", attributes:
            [NSAttributedString.Key.foregroundColor : UIColor .gray])
            name.textColor = .black
            name.attributedPlaceholder = attributedPlaceholder
        name.setBottomBorder(backGroundColor: .white, borderColor: PURPLE_THEME)
        return name
    }()
    
    let emailTextField: UITextField = {
           let e = UITextField()
           
           let attributedPlaceholder = NSAttributedString(string: "Напишите ваш email", attributes:
            [NSAttributedString.Key.foregroundColor : UIColor .gray])
               e.textColor = .black
               e.attributedPlaceholder = attributedPlaceholder
           e.setBottomBorder(backGroundColor: .white, borderColor: PURPLE_THEME)
           return e
       }()
    
    let replyTextField: UITextField = {
        let p = UITextField()
        let attributedPlaceholder = NSAttributedString(string: "Чем бы вы хотели поделиться с нами?", attributes:
            [NSAttributedString.Key.foregroundColor : UIColor.gray])
            p.textColor = .black
        
            p.attributedPlaceholder = attributedPlaceholder
        p.adjustsFontSizeToFitWidth = true
        p.setBottomBorder(backGroundColor: .white, borderColor: PURPLE_THEME)
        return p
    }()
    
    let submitButton: UIButton = {
        let l = UIButton(type: .system)
            l.setTitleColor(.white, for: .normal)
            l.setTitle("Отправить", for: .normal)
            l.layer.cornerRadius = 10
            l.backgroundColor = UIColor.rgb(r: 155, g: 155, b: 250)
        l.addTarget(self, action: #selector(sendHandled), for: .touchUpInside)
        return l
    }()
    let cancel2Button: UIButton = {
        let l = UIButton(type: .system)
            l.setTitleColor(PURPLE_THEME, for: .normal)
            l.setTitle("Отменить", for: .normal)
            l.layer.cornerRadius = 10
            l.backgroundColor = UIColor.rgb(r: 255, g: 255, b: 255)
        l.addTarget(self, action: #selector(sendHandled), for: .touchUpInside)
        return l
    }()

    @objc
    func sendHandled() {
        dismiss(animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
       
        view.backgroundColor = .white
        
        navigationController?.isNavigationBarHidden = true
        
       // setupAddLogo()
        screenTitleField()
        setupTextFieldComponents()
        setupSendButton()
        setupCancelButton()
        //setupForgotPsswdButton()
        //setupHaveAccountButton()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    fileprivate func setupTextFieldComponents() {
        
       setupNameField()
        setupEmailField()
        setupfeedbackField()
    }
    fileprivate func setupNameField() {
          view.addSubview(nameTextField)
          
        nameTextField.anchors(top: screenTitle.bottomAnchor, topPad: 0, bottom: nil, bottomPad: 0,
                                 left: view.leftAnchor, leftPad: 24, right: screenTitle.rightAnchor,
                                 rightPad: 24, height: 50, width: 0)
         //nameTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
         
        
      }
      
    fileprivate func screenTitleField() {
        view.addSubview(screenTitle)
        screenTitle.anchors(top: nil, topPad: 0, bottom: nil, bottomPad: 0,
                                      left: view.leftAnchor, leftPad: -80, right: view.rightAnchor,
                                      rightPad: 0, height: 140, width: 0)
               screenTitle.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
       
    }
    
    fileprivate func setupfeedbackField() {
        view.addSubview(replyTextField)
        
        replyTextField.anchors(top: emailTextField.bottomAnchor, topPad: 8, bottom: nil,
                                  bottomPad: 0, left: emailTextField.leftAnchor, leftPad: 0,
                                  right: emailTextField.rightAnchor, rightPad: 0, height: 100, width: 0)
    }
    
    fileprivate func setupEmailField() {
           view.addSubview(emailTextField)
           
           emailTextField.anchors(top: nameTextField.bottomAnchor, topPad: 8, bottom: nil,
                                     bottomPad: 0, left: nameTextField.leftAnchor, leftPad: 0,
                                     right: nameTextField.rightAnchor, rightPad: 0, height: 50, width: 0)
        
       }
    fileprivate func setupSendButton() {
        view.addSubview(submitButton)
        
        submitButton.anchors(top: replyTextField.bottomAnchor, topPad: 12, bottom: nil,
                            bottomPad: 0, left: replyTextField.leftAnchor, leftPad: 0,
                            right: replyTextField.rightAnchor, rightPad: 0, height: 50, width: 0)
    }
    fileprivate func setupCancelButton() {
          view.addSubview(cancel2Button)
          
          cancel2Button.anchors(top: submitButton.bottomAnchor, topPad: 12, bottom: nil,
                              bottomPad: 0, left: submitButton.leftAnchor, leftPad: 0,
                              right: submitButton.rightAnchor, rightPad: 0, height: 50, width: 0)
      }
    

}
