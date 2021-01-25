//
//  LoginInteractor.swift
//  RentApp
//
//  Created by Melanie Kofman on 04.12.2020.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase
import NAChloride

final class LoginInteractor {
    var output: LoginInteractorOutput?
    
}

extension LoginInteractor: LoginInteractorInput {
    
    
    
    func loginAction(email: String, password: String) {
        
        let hash_password = passwordHashingUsingScrypt(password: password)
        
            FirebaseAuth.Auth.auth().signIn(withEmail: email, password: hash_password, completion: { (user, error) in
                if error != nil {
                    if error.debugDescription.contains("The email address is badly formatted"){
                        self.show_wrong_password_email_alert()
                    }
                    if error.debugDescription.contains("There is no user record corresponding to this identifier. The user may have been deleted."){
                        self.show_no_user_alert()
                    }
                    if error.debugDescription.contains("The password is invalid or the user does not have a password."){
                        self.show_wrong_password_email_alert()
                       }
                    if error.debugDescription.contains("The Internet connection appears to be offline"){
                     self.show_no_Internet_alert()
                    }
                    
                    
                    
                    return
                }
                else {
                    let uid = FirebaseAuth.Auth.auth().currentUser?.uid
                    let ref = Firebase.Database.database().reference().child("user").child(uid!)
                    ref.observeSingleEvent(of: .value, with: { (snapshot) in
                        let dict = snapshot.value as! [String: AnyObject]

                        self.output?.openApp(dict: dict)

                        }, withCancel: nil)
                }
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
    
   private func show_wrong_password_email_alert() {
    let alert = UIAlertController(title: "Что-то пошло не так...", message: "Неверный логин и(или) пароль.", preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
    
    self.output?.openalert(alert: alert)
    }
    
   private func show_no_user_alert() {
        let alert = UIAlertController(title: "Что-то пошло не так...", message: "Пользователя не существует.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
    self.output?.openalert(alert: alert)
    }
    
    private func show_no_Internet_alert() {
        let alert = UIAlertController(title: "Что-то пошло не так...", message: "Нет подключения к Интернету.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        self.output?.openalert(alert: alert)
    }
    
    
}

