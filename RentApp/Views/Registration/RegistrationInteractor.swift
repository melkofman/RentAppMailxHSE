//
//  RegistrationInteractor.swift
//  RentApp
//
//  Created by Melanie Kofman on 05.12.2020.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase
import FirebaseStorage
import  NAChloride

final class RegistrationInteractor {
    var output: RegistrationInteractorOutput?
}

extension RegistrationInteractor: RegistrationInteractorInput {
    func regAction(email: String, name: String, password: String, phone: String, age: String) {
        
        if password != "" {
           let hash_password = passwordHashingUsingScrypt(password: password)
        
          Firebase.Auth.auth().createUser(withEmail: email, password: hash_password) { (user, error) in
              if (error != nil && email != "" && name != "" && password != "" && phone != "" && age != ""){
                  print(error ?? "")
                if error.debugDescription.contains("The email address is already in use by another account.") {
                    self.reg_error_alert()
                }
                
                if error.debugDescription.contains("An email address must be provided.") {
                    self.no_email_alert()
                }
                
                if name == "" {
                    self.no_name_alert()
                }
                
                if password == "" {
                    self.no_password_alert()
                }
                
                if phone == "" {
                    self.no_phone_alert()
                }
                
                if age == "" {
                    self.no_age_alert()
                }
                
                if error.debugDescription.contains("The Internet connection appears to be offline"){
                 self.show_no_Internet_alert()
                }
                
                  return
              }
                     
            //            let values = ["email": email,"name": name, "password": hash_password,"phone number":phone, "age": age,"image": image, "uid": uid]
            guard let uid = user?.user.uid else {return}

                let imageName = UUID().uuidString
            let storageRef = Storage.storage().reference().child("profile_images").child("\(imageName).jpg")
                let image = UIImage(named: "default")
                if let profileImage = image, let uploadData = profileImage.jpegData(compressionQuality: 0.1) {
                    storageRef.putData(uploadData, metadata: nil, completion: { (metadata, error) in
                        if error != nil, metadata != nil {
                            print(error ?? "")
                            return
                        }
                        storageRef.downloadURL(completion: { (url, error) in
                            if error != nil {
                                print(error ?? "")
                                return
                            }
                            if let profileImageUrl = url?.absoluteString {
                                let values = ["email": email,"name": name, "password": hash_password,"phone number":phone, "age": age,"image": profileImageUrl, "uid": uid] as [String : AnyObject]
                                 self.registerUserIntoDatabaseWithUID(uid, values: values as [String : AnyObject])
                            }
                            
                        })
                    })
                }
            } }
      }
    
   fileprivate func registerUserIntoDatabaseWithUID(_ uid: String, values: [String: AnyObject]) {
          let reference = FirebaseDatabase.Database.database().reference(fromURL: "https://rentapp-fd8c6-default-rtdb.firebaseio.com/")
          let userReference = reference.child("user").child(uid)
        
        userReference.updateChildValues(values, withCompletionBlock:  {(error, reference) in
                                     if error != nil {
                                        print(error as Any)
                                         return
                                     }
            self.output?.openApp(dict: values)
        })
    
    
        
    }

    func passwordHashingUsingScrypt(password: String) -> String{
        let N = 16
        let r = 16
        let p = 16

        let term1 = Int(log2(Double(N))) << 16
        let term2 = r << 8
        let paramsDecimal = term1 | term2 | p

        let params = String(format:"%2X", paramsDecimal)
        

        let message = password.data(using:.utf8)!
        let salt = Data(bytes:[0x73, 0x61, 0x6c, 0x74, 0x44, 0x61, 0x74, 0x61,0x73, 0x61, 0x6c, 0x74, 0x44, 0x61, 0x74, 0x61,0x73, 0x61, 0x6c, 0x74, 0x44, 0x61, 0x74, 0x61,0x73, 0x61, 0x6c, 0x74, 0x44, 0x61, 0x74, 0x61])

        let saltBase64String = salt.base64EncodedString()
        

        let hashData = try! NAScrypt.scrypt(message, salt: salt, n: 16, r: 16, p: 16, length: 32)
        let hashBase64String = hashData.base64EncodedString()
        
        let result = saltBase64String+"$"+hashBase64String
        

        var hashString = String()
        hashString.append("$s0$")
        hashString.append(params)
        hashString.append("$")
        hashString.append(saltBase64String)
        hashString.append("$")
        hashString.append(hashBase64String)
        
        return hashString
    }
    
    private func reg_error_alert() {
        let alert = UIAlertController(title: "Что-то пошло не так...", message: "Данный email уже используется в другой учетной записи.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        
        self.output?.openAlert(alert: alert)
    }
    
    private func no_email_alert() {
        let alert = UIAlertController(title: "Что-то пошло не так...", message: "Введите email.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        
        self.output?.openAlert(alert: alert)
    }
    
    private func no_name_alert() {
        let alert = UIAlertController(title: "Что-то пошло не так...", message: "Введите имя.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        
        self.output?.openAlert(alert: alert)
    }
    
    private func no_password_alert() {
        let alert = UIAlertController(title: "Что-то пошло не так...", message: "Введите пароль.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        
        self.output?.openAlert(alert: alert)
    }
    
    private func no_phone_alert() {
        let alert = UIAlertController(title: "Что-то пошло не так...", message: "Введите номер телефона.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        
        self.output?.openAlert(alert: alert)
    }
    
    private func no_age_alert() {
        let alert = UIAlertController(title: "Что-то пошло не так...", message: "Выберете дату рождения.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        
        self.output?.openAlert(alert: alert)
    }
    
    private func show_no_Internet_alert() {
        let alert = UIAlertController(title: "Что-то пошло не так...", message: "Нет подключения к Интернету.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        self.output?.openAlert(alert: alert)
    }
}
