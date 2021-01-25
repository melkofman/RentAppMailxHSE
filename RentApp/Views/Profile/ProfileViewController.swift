
//
//  ViewController.swift
//  SettingsTemplate
//
//  Created by Stephen Dowless on 2/10/19.
//  Copyright © 2019 Stephan Dowless. All rights reserved.
//

import UIKit

private let reuseIdentifier = "SettingsCell"

class ProfileViewController: UIViewController, ProfileViewControllerProtocol{

    
    var presenter: ProfilePresenterProtocol!

    
    
    var dict: [String: AnyObject]!
    
    // MARK: - Properties
    
    var tableView: UITableView!
    var userInfoHeader: UserInfoHeader!
    
    // MARK: - Init

    override func viewDidLoad() {
        super.viewDidLoad()
        

        configureUI()
    }

    // MARK: - Helper Functions
    init(dict: [String: AnyObject]) {

        self.dict = dict
        super.init(nibName: nil, bundle: nil)

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configureTableView() {
        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 60
        
        tableView.register(SettingsCell.self, forCellReuseIdentifier: reuseIdentifier)
        view.addSubview(tableView)
        tableView.frame = view.frame
        
        let frame = CGRect(x: 0, y: 88, width: view.frame.width, height: 100)
        userInfoHeader = UserInfoHeader(frame: frame, dict: dict!)

       
        
        tableView.tableHeaderView = userInfoHeader
        tableView.tableFooterView = UIView()
        
    }
    
    func configureUI() {
        configureTableView()
        
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = UIColor(red: 155/255, green: 155/255, blue: 250/255, alpha: 1)
        
    }

}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return Options.allCases.count
        
        default: return 0
        }
    }
    func tableView(_ tableView: UITableView,viewForHeaderInSection section: Int)-> UIView? {
        let view = UIView()
        view.backgroundColor = UIColor(red: 255/255,green : 255/255, blue: 255/255, alpha: 1)
        
        
        let title = UILabel()
        title.font = UIFont.boldSystemFont(ofSize:16)
        title.textColor = .gray
        title.text = "Account settings"
        view.addSubview(title)
        title.translatesAutoresizingMaskIntoConstraints = false
        title.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        
        return view
        
    }
    
    
    private func tableView(_ tebleView: UITableView, heightForHeaderInSEction section: Int)->CGFloat{
        return 60
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! SettingsCell
        
        let options = Options(rawValue: indexPath.row)
        cell.textLabel?.text = options?.description
        cell.sectionType = options
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            
            self.presenter.showPInfo(dict: self.dict!)
        case 1:
            
            self.presenter.showPay()
        case 2:
            self.presenter.showFeedback()
        case 3:
            print("Notifications")
        case 4:
            print("show number")
        case 5:
            
            self.presenter.showAbout()
            
        case 6:
            
            self.show_logout_alert()
            
        default:
            print("noaction")
        }
    }
    
    func show_logout_alert() {
        let alert = UIAlertController(title: "Вы уверены, что хотите выйти?", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: { (action) in
            self.close_alert(alert: alert)
        }))
        alert.addAction(UIAlertAction(title: "Выйти", style: .destructive, handler: { (action) in
            self.logout_act(alert: alert)
        }))
        
        self.presenter.show_alert(alert: alert)
    }
    
    func close_alert(alert: UIAlertController) {
        self.presenter.close_alert(alert: alert)
    }
    
    func logout_act(alert: UIAlertController) {
        self.presenter.logout()
    }

    
}

