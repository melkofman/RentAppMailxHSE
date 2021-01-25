//
//  SavesViewController.swift
//  RentApp
//
//  Created by Савва Шулятьев on 17.11.2020.
//

import UIKit

class SavesViewController: UIViewController {
    
    var buttonReload = UIButton()
    //tableview.reloadData()
    
    let savesTableView = UITableView()
    
    private var aparts: [Apartment]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(buttonReload)
        buttonReloadConstr()
        buttonReload.backgroundColor = .appPurple
        
            aparts = ApartmentAPI.getApartments()
    
        //aparts = ApartmentAPI.getApartments()
        
        view.addSubview(savesTableView)
        self.pinTableView()
        
        savesTableView.dataSource = self
        savesTableView.register(SaveTableViewCell.self, forCellReuseIdentifier: "saveCell")
        self.setUpNavigation()
        
        savesTableView.delegate = self
    }
    
    func setUpNavigation() {
        navigationItem.title = "Аренда"
        self.navigationController?.navigationBar.barTintColor = .appPurple
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)]
    }
}

// MARK: - TableView protocols

extension SavesViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return aparts?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "saveCell", for: indexPath) as! SaveTableViewCell
        if let apartmentList = aparts {
            cell.apart = apartmentList[indexPath.row]
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedApart = aparts?[indexPath.row]
        
        let qrVC = QRViewController()
        qrVC.code = selectedApart?.pictureIndex
        self.navigationController?.pushViewController(qrVC, animated: true)
    }
}

// MARK: - Constraints

extension SavesViewController {
    func pinTableView(){
        savesTableView.translatesAutoresizingMaskIntoConstraints = false
        savesTableView.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor).isActive = true
        savesTableView.leadingAnchor.constraint(equalTo:view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        savesTableView.trailingAnchor.constraint(equalTo:view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        savesTableView.bottomAnchor.constraint(equalTo:view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    private func buttonReloadConstr() {
        buttonReload.translatesAutoresizingMaskIntoConstraints = false
        buttonReload.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        buttonReload.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 100).isActive = true
        buttonReload.widthAnchor.constraint(equalToConstant: 100).isActive = true
        buttonReload.heightAnchor.constraint(equalToConstant: 100).isActive = true
        buttonReload.setTitle("Обновить", for: .normal)
        self.buttonReload.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
    }
}


