
//
//  ChatInteractor.swift
//  chatt
//
//  Created by Melanie Kofman on 26.11.2020.
//  Copyright © 2020 Melanie Kofman. All rights reserved.
//

import UIKit
import Firebase

class ChatInteractor: ChatInteractorProtocol {
    private let texthelper = "Напишите нам, если у Вас возникли проблемы. Наши операторы свяжутся с Вами для помощи."
    weak var presenter: ChatPresenterProtocol!
    
    required init(presenter: ChatPresenterProtocol) {
        self.presenter = presenter
    }
    
    func helperOrNot(name: String, chatViewController: ChatViewController) {
        if ((name.caseInsensitiveCompare("helper")) == .orderedSame) {


            let time = 0
            let message = Message(text: texthelper, from: "helper", time: time)
            chatViewController.messages.append(message)
        }
    }
    
    func decideCellColor(from: String) -> Bool {
        
        if (from != "helper") {
            return true
        }
        else {return false}
    }

    func handleSend(text: String, uid: String, chatViewController: ChatViewController)
 {
    let newmessage = Message(text: text, from: uid)
    if !newmessage.text!.isEmpty {
        chatViewController.messages.append(newmessage)
        let reference = Firebase.Database.database().reference().child("user-messages").child(uid)
        let childRef = reference.childByAutoId()
        let time = Int(Date().timeIntervalSince1970)
        let values = ["text": text, "uid": uid, "time": time, "to_id": "helper"] as [String : Any]
        
        childRef.updateChildValues(values)
        
    }
    
}
    
    func observe_user_messages(chatViewController: ChatViewController) {
        
        guard let uid = FirebaseAuth.Auth.auth().currentUser?.uid else { return }
        
        let ref = Firebase.Database.database().reference().child("user-messages").child(uid)
                         ref.observeSingleEvent(of: .value, with: { (snapshot) in
                            guard let dict = snapshot.value as? [String: AnyObject] else { return }
                            print(dict)
                            for key in dict.values {

                                if let unwrapped_time = key["time"] {
                                    if let unwrapped_text = key["text"] {
                                        if let unwrapped_uid = key["uid"] {
                                            let newmessage = Message(text: unwrapped_text as! String, from: unwrapped_uid as! String, time: unwrapped_time as! Int)
                                            chatViewController.messages.append(newmessage)
                                            print(chatViewController.messages)
                                            chatViewController.messages.sort(by: { (mes1, mes2) -> Bool in
                                                return (mes1.time)! < (mes2.time)!
                                                
                                            })
                                        }
                                        else {
                                            return
                                        }
                                    }
                                    else {
                                        return
                                    }
                                }
                                else {
                                    return
                                }
                            }
                            DispatchQueue.main.async{
                                chatViewController.collectionView?.reloadData()
                            }
})
}
}
