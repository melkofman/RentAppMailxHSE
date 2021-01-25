//
//  ObserveChatsViewController.swift
//  chatt
//
//  Created by Melanie Kofman on 26.11.2020.
//  Copyright © 2020 Melanie Kofman. All rights reserved.
//

import UIKit
import Firebase

class ObserveChatsViewController: UITableViewController, ObserveChatsViewProtocol {
    var presenter: ObserveChatsPresenterProtocol!
    let configurator: ObserveChatsConfiguratorProtocol = ObserveChatsConfigurator()
    
    
    let sender_id: String
    var users = [User]()
    let cellId = "Cell"
    
    init(uid: String) {
        self.sender_id = uid
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self)

        
        
        tableView.register(UserCell.self, forCellReuseIdentifier: cellId)
        
        
        self.navigationItem.title = "Inbox"
        self.navigationController?.navigationBar.barTintColor = PURPLE_THEME
        
        
        addUser(name: "Helper", image: #imageLiteral(resourceName: "helper"), id: 1) //добавили поддержку
        
    }
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        
        presenter.chatClicked(user: self.users[indexPath.row], sender: sender_id)
    }
    
    func addUser(name: String, image: UIImage, id: Int){
           let newUser = User(name: name, image: image, id: id)
           users.append(newUser)
       }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return users.count
       }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = self.tableView.dequeueReusableCell(withIdentifier: cellId)
     
           let user = users[indexPath.row]
           let image = users[indexPath.row].profileImage
    
           cell?.imageView?.image = image
           cell?.textLabel?.text = user.name
           cell?.detailTextLabel?.text = "Сообщение"
           cell?.backgroundColor = UIColor(r: 123, g: 104, b: 238, a: 0.2)
           
           return cell!
       }
}

