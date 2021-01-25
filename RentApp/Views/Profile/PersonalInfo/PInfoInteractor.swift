//
//  PInfoInteractor.swift
//  RentApp
//
//  Created by Melanie Kofman on 28.12.2020.
//

import UIKit
import Firebase
import FirebaseStorage

class PInfoInteractor: PInfoInteractorProtocol {
    weak var presenter: PInfoPresenterProtocol!
    
    required init(presenter: PInfoPresenterProtocol) {
        self.presenter = presenter
    }


    func addData(dict: [String: AnyObject], viewController: PInfoViewController) {
               let values = ["email": dict["email"]!,"name": dict["name"]!, "password": dict["password"]!,"phone number": dict["phone number"]!, "age": dict["age"]!,"image": dict["image"], "uid": dict["uid"]!] as [String : AnyObject]
                            let ref = FirebaseDatabase.Database.database().reference()
                                    ref.child("user").child(values["uid"] as! String).setValue(values)
                            viewController.dict = values
//                            viewController.set_dict_image(imageurl: profileImageUrl)
  
//                        }
                        
//                    })
//                })
//            }

    }
    
    func addDataImage(dict: [String: AnyObject], newimage: UIImage?, viewController: PInfoViewController) {
            
            let imageName = UUID().uuidString
            let storageRef = Storage.storage().reference().child("profile_images").child("\(imageName).jpg")
                let image = newimage
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
                                let values = ["email": dict["email"]!,"name": dict["name"]!, "password": dict["password"]!,"phone number": dict["phone number"]!, "age": profileImageUrl,"image": dict["image"], "uid": dict["uid"]!] as [String : AnyObject]
                                let ref = FirebaseDatabase.Database.database().reference()
                                        ref.child("user").child(values["uid"] as! String).setValue(values)
    //                            viewController.set_dict_image(imageurl: profileImageUrl)
                                viewController.dict = values
      
                            }
                            
                        })
                    })
                }

        }
    
    func update_dict(viewController: PInfoViewController) {
        let uid = FirebaseAuth.Auth.auth().currentUser?.uid
        let ref = Firebase.Database.database().reference().child("user").child(uid!)
        ref.observeSingleEvent(of: .value, with: { (snapshot) in
            let dict = snapshot.value as! [String: AnyObject]

            viewController.dict = dict

            }, withCancel: nil)
    }
    

    
}
