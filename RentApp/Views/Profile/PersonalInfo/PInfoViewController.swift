//
//  PInfoViewController.swift
//  RentApp
//
//  Created by Melanie Kofman on 28.12.2020.
//

import UIKit
import Firebase
import FirebaseStorage

class PInfoViewController: UIViewController, PInfoViewControllerProtocol, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
     var dict: [String: AnyObject]
    private var isPresenting = false
    private var imageWasChanged = false
    let rootViewController: ProfileViewController
    init(dict: [String: AnyObject], rootViewController: ProfileViewController) {
        self.dict = dict
        self.rootViewController = rootViewController
        super.init(nibName: nil, bundle: nil)
    }
    func get_name() -> String {
        return dict["name"]! as! String
    }
    func get_email() -> String {
        return dict["email"]! as! String
    }
    func get_birth() -> String {
        return dict["age"]! as! String
    }
    func get_phonenum() -> String {
        return dict["phone number"]! as! String
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var presenter: PInfoPresenterProtocol!
    let configurator: PInfoContainerProtocol = PInfoContainer()
    
    let containerView: UIView = {
           let view = UIView()
           view.backgroundColor = .white
           view.layer.cornerRadius = 5
           view.layer.masksToBounds = true
           view.translatesAutoresizingMaskIntoConstraints = false
           return view
       }()
    
    var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 70
        imageView.clipsToBounds = true
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleSelectProfileImageView)))
        return imageView
    }()
    
    var usernameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let emailLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let birthLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.text = "Дата рождения:"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let dataBirthLabel: UILabel = {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 18)
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
    
    let phonenumLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.text = "Номер телефона:"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let dataPhonenumLabel: UILabel = {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 18)
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
    
    let email_birth_Separator: UIView = {
        let fieldSeparator = UIView()
        fieldSeparator.backgroundColor = UIColor(r: 69, g: 69, b: 69, a: 1)
        fieldSeparator.translatesAutoresizingMaskIntoConstraints = false
        return fieldSeparator
    }()
    
    let birth_phone_Separator: UIView = {
        let fieldSeparator = UIView()
        fieldSeparator.backgroundColor = UIColor(r: 69, g: 69, b: 69, a: 1)
        fieldSeparator.translatesAutoresizingMaskIntoConstraints = false
        return fieldSeparator
    }()
    
    let bottomSeparator: UIView = {
        let fieldSeparator = UIView()
        fieldSeparator.backgroundColor = UIColor(r: 69, g: 69, b: 69, a: 1)
        fieldSeparator.translatesAutoresizingMaskIntoConstraints = false
        return fieldSeparator
    }()
    
    let phoneTextField: UITextField = {
        let textfield = UITextField()
        textfield.attributedPlaceholder = NSAttributedString(string: "Введите номер телефона", attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.addTarget(self, action: #selector(phonetextFieldDidChange), for: .editingChanged)
        return textfield
    }()
    
    let ageTextField: UITextField = {
        let textfield = UITextField()
        textfield.attributedPlaceholder = NSAttributedString(string: "Дата рождения", attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        textfield.addTarget(self, action: #selector(ageHandled), for: .touchDown)
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.addTarget(self, action: #selector(agetextFieldDidChange), for: .editingDidEnd)
        return textfield
    }()
    
    let usernameField: UITextField = {
        let textfield = UITextField()
        textfield.attributedPlaceholder = NSAttributedString(string: "Введите Имя", attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.addTarget(self, action: #selector(usernametextFieldDidChange), for: .editingChanged)
        return textfield
    }()
    
    let emailField: UITextField = {
        let textfield = UITextField()
        textfield.attributedPlaceholder = NSAttributedString(string: "Введите email", attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        textfield.translatesAutoresizingMaskIntoConstraints = false
        return textfield
    }()

    let ageDataPicker: UIDatePicker = {
        let ageDataPickier = UIDatePicker()
        ageDataPickier.datePickerMode = .date
        return ageDataPickier
    }()
    
    let changeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Изменить персональные данные", for: .normal)
        button.backgroundColor = .white
        button.addTarget(self, action: #selector(handleChangeButton), for: .touchUpInside)
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
     let doneButton: UIButton = {
            let button = UIButton(type: .system)
            button.setTitle("Сохранить", for: .normal)
            button.backgroundColor = .white
            button.addTarget(self, action: #selector(handleDoneButton), for: .touchUpInside)
            button.layer.cornerRadius = 5
            button.layer.masksToBounds = true
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        self.configurator.configure(with: self)
        self.view.addSubview(containerView)
        self.view.addSubview(profileImageView)
        profileImageView.loadImageUsingCacheWithUrlString(dict["image"] as! String)
        setupPInfoComponents()
        
    }
    
    func setupPInfoComponents() {
        containerView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        containerView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        containerView.heightAnchor.constraint(equalTo: self.view.heightAnchor).isActive = true
        
        profileImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10).isActive = true
        profileImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        
        containerView.addSubview(usernameLabel)
        containerView.addSubview(emailLabel)
        usernameLabel.text = get_name()
        usernameLabel.textAlignment = NSTextAlignment.center
        emailLabel.text = get_email()
        emailLabel.textAlignment = NSTextAlignment.center
        
        containerView.addSubview(birthLabel)
        containerView.addSubview(phonenumLabel)
        
        containerView.addSubview(dataBirthLabel)
        dataBirthLabel.text = get_birth()
        containerView.addSubview(dataPhonenumLabel)
        dataPhonenumLabel.text = get_phonenum()
        
        containerView.addSubview(email_birth_Separator)
        containerView.addSubview(birth_phone_Separator)
        containerView.addSubview(bottomSeparator)
        
        usernameLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor).isActive = true
        usernameLabel.centerXAnchor.constraint(equalTo: profileImageView.centerXAnchor).isActive = true
        usernameLabel.widthAnchor.constraint(equalTo: containerView.widthAnchor).isActive = true
        usernameLabel.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        emailLabel.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor).isActive = true
        emailLabel.centerXAnchor.constraint(equalTo: usernameLabel.centerXAnchor).isActive = true
        emailLabel.widthAnchor.constraint(equalTo: containerView.widthAnchor).isActive = true
        emailLabel.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        birthLabel.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 20).isActive = true
        birthLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor).isActive = true
        birthLabel.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.5).isActive = true
        birthLabel.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        email_birth_Separator.bottomAnchor.constraint(equalTo: birthLabel.topAnchor).isActive = true
        email_birth_Separator.leftAnchor.constraint(equalTo: birthLabel.leftAnchor).isActive = true
        email_birth_Separator.widthAnchor.constraint(equalTo: containerView.widthAnchor).isActive = true
        email_birth_Separator.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        phonenumLabel.topAnchor.constraint(equalTo: birthLabel.bottomAnchor).isActive = true
        phonenumLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor).isActive = true
        phonenumLabel.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.5).isActive = true
        phonenumLabel.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        birth_phone_Separator.topAnchor.constraint(equalTo: birthLabel.bottomAnchor).isActive = true
        birth_phone_Separator.widthAnchor.constraint(equalTo: containerView.widthAnchor).isActive = true
        birth_phone_Separator.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        bottomSeparator.topAnchor.constraint(equalTo: phonenumLabel.bottomAnchor).isActive = true
        bottomSeparator.widthAnchor.constraint(equalTo: containerView.widthAnchor).isActive = true
        bottomSeparator.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        dataBirthLabel.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 20).isActive = true
        dataBirthLabel.leftAnchor.constraint(equalTo: birthLabel.rightAnchor).isActive = true
        dataBirthLabel.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.5).isActive = true
        dataBirthLabel.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        dataPhonenumLabel.topAnchor.constraint(equalTo: birthLabel.bottomAnchor).isActive = true
        dataPhonenumLabel.leftAnchor.constraint(equalTo: phonenumLabel.rightAnchor).isActive = true
        dataPhonenumLabel.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.5).isActive = true
        dataPhonenumLabel.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        containerView.addSubview(changeButton)
        
        changeButton.topAnchor.constraint(equalTo: dataPhonenumLabel.bottomAnchor, constant: 10).isActive = true
        changeButton.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        
        containerView.addSubview(phoneTextField)
        phoneTextField.topAnchor.constraint(equalTo: birthLabel.bottomAnchor).isActive = true
        phoneTextField.leftAnchor.constraint(equalTo: phonenumLabel.rightAnchor).isActive = true
        phoneTextField.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.5).isActive = true
        phoneTextField.heightAnchor.constraint(equalToConstant: 60).isActive = true
        phoneTextField.isHidden = true
        
        containerView.addSubview(ageTextField)
        ageTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 20).isActive = true
        ageTextField.leftAnchor.constraint(equalTo: birthLabel.rightAnchor).isActive = true
        ageTextField.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.5).isActive = true
        ageTextField.heightAnchor.constraint(equalToConstant: 60).isActive = true
        ageTextField.isHidden = true
        
        containerView.addSubview(doneButton)
        doneButton.topAnchor.constraint(equalTo: changeButton.bottomAnchor, constant: 10).isActive = true
        doneButton.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        doneButton.isHidden = true

        containerView.addSubview(usernameField)
        usernameField.topAnchor.constraint(equalTo: profileImageView.bottomAnchor).isActive = true
        usernameField.centerXAnchor.constraint(equalTo: profileImageView.centerXAnchor).isActive = true
        usernameField.widthAnchor.constraint(equalTo: containerView.widthAnchor).isActive = true
        usernameField.heightAnchor.constraint(equalToConstant: 60).isActive = true
        usernameField.isHidden = true
        
        containerView.addSubview(emailField)
        emailField.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor).isActive = true
        emailField.centerXAnchor.constraint(equalTo: usernameLabel.centerXAnchor).isActive = true
        emailField.widthAnchor.constraint(equalTo: containerView.widthAnchor).isActive = true
        emailField.heightAnchor.constraint(equalToConstant: 60).isActive = true
        emailField.isHidden = true
               
    }
  
    var picker: ImagePicker!
    @objc
    func handleSelectProfileImageView() {
        self.picker = ImagePicker(presentationController: self, delegate: self)
        self.picker.present(from: self.profileImageView)
    }

    
    @objc
    func handleChangeButton() {
        isPresenting = !isPresenting
        usernameLabel.isHidden = isPresenting
        emailLabel.isHidden = isPresenting
        dataBirthLabel.isHidden = isPresenting
        dataPhonenumLabel.isHidden = isPresenting
        usernameField.isHidden = !isPresenting
        phoneTextField.isHidden = !isPresenting
        ageTextField.isHidden = !isPresenting
        doneButton.isHidden = !isPresenting
        
        profileImageView.isUserInteractionEnabled = isPresenting
print(isPresenting)
    }
    
    @objc
    func phonetextFieldDidChange() {
        if let phone = phoneTextField.text {
            dict["phone number"] = phone as AnyObject
        }
    }
    
    @objc
    func agetextFieldDidChange() {
        if let age = ageTextField.text {
            dict["age"] = age as AnyObject
        }
    }
    
    @objc
    func usernametextFieldDidChange() {
        if let username = usernameField.text {
            dict["name"] = username as AnyObject
         }
    }
    
    
    
    @objc
    func handleDoneButton() {
        
        isPresenting = !isPresenting
        usernameLabel.isHidden = isPresenting
        emailLabel.isHidden = isPresenting
        dataBirthLabel.isHidden = isPresenting
        dataPhonenumLabel.isHidden = isPresenting
        usernameField.isHidden = !isPresenting
        phoneTextField.isHidden = !isPresenting
        ageTextField.isHidden = !isPresenting
        doneButton.isHidden = !isPresenting
        
        profileImageView.isUserInteractionEnabled = isPresenting
        

        if imageWasChanged {
            self.presenter.addDataImage(dict: self.dict, newimage: newimage!, viewController: self)
        }
        else {
            self.presenter.addData(dict: self.dict, viewController: self)
        }
        
print(dict)
            
            self.refresh_data()
            DispatchQueue.main.async{
                self.reloadInputViews()
                print("reloaded")
                
                
            }
        
    }
    
    
    @objc
    func ageHandled() {
        let toolbar = UIToolbar();
          toolbar.sizeToFit()
          let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(donedatePicker));
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
         let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker));

        toolbar.setItems([doneButton,spaceButton,cancelButton], animated: false)

         ageTextField.inputAccessoryView = toolbar
         ageTextField.inputView = ageDataPicker

        }

         @objc func donedatePicker(){

          let formatter = DateFormatter()
          formatter.dateFormat = "dd/MM/yyyy"
          ageTextField.text = formatter.string(from: ageDataPicker.date)
          self.view.endEditing(true)
        }

        @objc func cancelDatePicker(){
           self.view.endEditing(true)
    }
    
    func set_dict_image(imageurl: String) {
        self.dict["image"] = imageurl as AnyObject
    }
    
    private func refresh_data() {
        self.presenter.update_dict(viewController: self)
        self.usernameLabel.text = self.get_name()
        self.dataBirthLabel.text = self.get_birth()
        self.dataPhonenumLabel.text = self.get_phonenum()
        self.profileImageView.loadImageUsingCacheWithUrlString(dict["image"] as! String)
//        self.profileImageView.image = newimage
        self.rootViewController.dict = self.dict
        self.rootViewController.userInfoHeader.set_name(name: get_name())
    }
    private var newimage: UIImage?
}

extension PInfoViewController: ImagePickerDelegate {
    func didSelect(image: UIImage?) {
        self.profileImageView.image = image
        self.newimage = image
        self.imageWasChanged = true
    }
}
