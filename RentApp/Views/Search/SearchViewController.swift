//
//  SearchViewController.swift
//  apartsharing
//
//  Created by Савва Шулятьев on 06.01.2021.
//

import UIKit


class SearchViewController: UIViewController {
    
    
    // MARK: - Proterties
    
    lazy var contentSizeForMainScrollView = CGSize(width: self.view.frame.width, height: 820)
    lazy var contentSizeForAboutScrollView = CGSize(width: 630, height: 180)
    lazy var contentSizeForNumberOfRooms = CGSize(width: 420, height: 55)
    lazy var contentSizeForNumberOfPerson = CGSize(width: 660, height: 55)
    
    
    // MARK: - Views
    
    lazy var mainScrollView = UIScrollView()
    lazy var aboutScrollView = UIScrollView()
    lazy var stripBetweenScrolls = UIView()
    lazy var aboutButton1 = UIButton()
    lazy var aboutButton2 = UIButton()
    lazy var aboutButton3 = UIButton()
    lazy var aboutButton4 = UIButton()
    lazy var helloLabel = UILabel()
    lazy var helloNameLabel = UILabel()
    lazy var searchButton = UIButton()
    lazy var rentalOptions = UIView()
    lazy var rentalName = UILabel()
    lazy var rentalAppart = UIButton()
    lazy var rentalHouse = UIButton()
    lazy var rentalRoom = UIButton()
    lazy var rentalArea = UIButton()
    lazy var rentalNumberOfRooms = UILabel()
    lazy var NumberOfRooms = UIScrollView()
    lazy var rentalNumberOfPerson = UILabel()
    lazy var NumberOfPerson = UIScrollView()
    lazy var stripAfterScrolls = UIView()
    lazy var stripToStrip = UIView()
    lazy var room1 = UIButton()
    lazy var room2 = UIButton()
    lazy var room3 = UIButton()
    lazy var room4 = UIButton()
    lazy var room5 = UIButton()
    lazy var person1 = UIButton()
    lazy var person2 = UIButton()
    lazy var person3 = UIButton()
    lazy var person4 = UIButton()
    lazy var person5 = UIButton()
    lazy var person6 = UIButton()
    lazy var person7 = UIButton()
    lazy var person8 = UIButton()
    lazy var person9 = UIButton()
   
    
    // MARK: - Lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        viewColors()
        
        self.view.addSubview(mainScrollView)
        mainScrollView.showsVerticalScrollIndicator = false
        self.mainScrollView.contentSize = contentSizeForMainScrollView
        mainScrollViewConstraints()
        
        self.mainScrollView.addSubview(aboutScrollView)
        self.aboutScrollView.contentSize = contentSizeForAboutScrollView
        aboutScrollView.showsHorizontalScrollIndicator = false
        aboutScrollViewConstraints()
        
        self.mainScrollView.addSubview(stripBetweenScrolls)
        stripBetweenScrollsConstraints()
        stripBetweenScrollsCorners()
        
        self.aboutScrollView.addSubview(aboutButton1)
        aboutButton1Constraints()
        self.aboutScrollView.addSubview(aboutButton2)
        aboutButton2Constraints()
        self.aboutScrollView.addSubview(aboutButton3)
        aboutButton3Constraints()
        self.aboutScrollView.addSubview(aboutButton4)
        aboutButton4Constraints()
        aboutButtonCorners()
        
        self.mainScrollView.addSubview(helloLabel)
        self.mainScrollView.addSubview(helloNameLabel)
        helloConstraints()
        helloSettings()
        
        self.stripBetweenScrolls.addSubview(searchButton)
        searchButtonConstraints()
        searchButtonSettings()
        
        self.mainScrollView.addSubview(rentalOptions)
        rentalOptionsConstraints()
        
        self.rentalOptions.addSubview(rentalName)
        rentalNameConstraints()
        rentalNameSettings()
        
        self.rentalOptions.addSubview(rentalAppart)
        self.rentalOptions.addSubview(rentalHouse)
        self.rentalOptions.addSubview(rentalRoom)
        self.rentalOptions.addSubview(rentalArea)
        rentalConstraints()
        rentalSettings()
        
        self.rentalOptions.addSubview(rentalNumberOfRooms)
        rentalNumberOfRoomsConstraints()
        rentalNumberOfRoomsSettings()
        
        self.rentalOptions.addSubview(NumberOfRooms)
        self.NumberOfRooms.contentSize = contentSizeForNumberOfRooms
        self.NumberOfRooms.showsHorizontalScrollIndicator = false
        NumberOfRoomsConstraints()
        
        self.rentalOptions.addSubview(rentalNumberOfPerson)
        rentalNumberOfPersonConstraints()
        rentalNumberOfPersonSettings()
        
        self.rentalOptions.addSubview(NumberOfPerson)
        self.NumberOfPerson.contentSize = contentSizeForNumberOfPerson
        self.NumberOfPerson.showsHorizontalScrollIndicator = false
        NumberOfPersonConstraints()
        
        self.mainScrollView.addSubview(stripAfterScrolls)
        stripAfterScrollsConstraints()
        stripAfterScrollsSettings()
        
        self.stripAfterScrolls.addSubview(stripToStrip)
        stripToStripConstraints()
        
        self.NumberOfRooms.addSubview(room1)
        self.NumberOfRooms.addSubview(room2)
        self.NumberOfRooms.addSubview(room3)
        self.NumberOfRooms.addSubview(room4)
        self.NumberOfRooms.addSubview(room5)
        roomsConstraints()
        roomsSettings()
        
        self.NumberOfPerson.addSubview(person1)
        self.NumberOfPerson.addSubview(person2)
        self.NumberOfPerson.addSubview(person3)
        self.NumberOfPerson.addSubview(person4)
        self.NumberOfPerson.addSubview(person5)
        self.NumberOfPerson.addSubview(person6)
        self.NumberOfPerson.addSubview(person7)
        self.NumberOfPerson.addSubview(person8)
        self.NumberOfPerson.addSubview(person9)
        personConstraints()
        personSettings()
        
        aboutButton1.addTarget(self, action: #selector(playTapped), for: .touchDown)
        aboutButton2.addTarget(self, action: #selector(playTapped), for: .touchDown)
        aboutButton3.addTarget(self, action: #selector(playTapped), for: .touchDown)
        aboutButton4.addTarget(self, action: #selector(playTapped), for: .touchDown)
        
        searchButton.addTarget(self, action: #selector(searchTapped), for: .touchDown)
        
        rentalAppart.addTarget(self, action: #selector(rentalAppartT), for: .touchDown)
        rentalHouse.addTarget(self, action: #selector(rentalHouseT), for: .touchDown)
        rentalRoom.addTarget(self, action: #selector(rentalRoomT), for: .touchDown)
        rentalArea.addTarget(self, action: #selector(rentalAreaT), for: .touchDown)
        
        room1.addTarget(self, action: #selector(room1T), for: .touchDown)
        room2.addTarget(self, action: #selector(room2T), for: .touchDown)
        room3.addTarget(self, action: #selector(room3T), for: .touchDown)
        room4.addTarget(self, action: #selector(room4T), for: .touchDown)
        room5.addTarget(self, action: #selector(room5T), for: .touchDown)
        
        person1.addTarget(self, action: #selector(person1T), for: .touchDown)
        person2.addTarget(self, action: #selector(person2T), for: .touchDown)
        person3.addTarget(self, action: #selector(person3T), for: .touchDown)
        person4.addTarget(self, action: #selector(person4T), for: .touchDown)
        person5.addTarget(self, action: #selector(person5T), for: .touchDown)
        person6.addTarget(self, action: #selector(person6T), for: .touchDown)
        person7.addTarget(self, action: #selector(person7T), for: .touchDown)
        person8.addTarget(self, action: #selector(person8T), for: .touchDown)
        person9.addTarget(self, action: #selector(person9T), for: .touchDown)
        
    }
    
    
    // MARK: - Colors
    
    private func viewColors() {
        
        self.view.backgroundColor = .systemRed
        self.mainScrollView.backgroundColor = .appPurple
        self.aboutScrollView.backgroundColor = .appPurple
        self.stripBetweenScrolls.backgroundColor = .appWhite
        self.aboutButton1.backgroundColor = .appWhite
        self.aboutButton2.backgroundColor = .appWhite
        self.aboutButton3.backgroundColor = .appWhite
        self.aboutButton4.backgroundColor = .appWhite
        self.helloLabel.backgroundColor = .appPurple
        self.helloNameLabel.backgroundColor = .appPurple
        self.searchButton.backgroundColor = .appWhite
        self.rentalOptions.backgroundColor = .appWhite
        self.rentalAppart.backgroundColor = .appWolf
        self.rentalHouse.backgroundColor = .appWolf
        self.rentalRoom.backgroundColor = .appWolf
        self.rentalArea.backgroundColor = .appWolf
        self.rentalName.backgroundColor = .appWhite
        self.rentalNumberOfRooms.backgroundColor = .appWhite
        self.NumberOfRooms.backgroundColor = .appWolf
        self.rentalNumberOfPerson.backgroundColor = .appWhite
        self.NumberOfPerson.backgroundColor = .appWolf
        self.stripAfterScrolls.backgroundColor = .appWhite
        self.stripToStrip.backgroundColor = .appPurple
        self.room1.backgroundColor = .appWhite
        self.room2.backgroundColor = .appWhite
        self.room3.backgroundColor = .appWhite
        self.room4.backgroundColor = .appWhite
        self.room5.backgroundColor = .appWhite
        self.person1.backgroundColor = .appWhite
        self.person2.backgroundColor = .appWhite
        self.person3.backgroundColor = .appWhite
        self.person4.backgroundColor = .appWhite
        self.person5.backgroundColor = .appWhite
        self.person6.backgroundColor = .appWhite
        self.person7.backgroundColor = .appWhite
        self.person8.backgroundColor = .appWhite
        self.person9.backgroundColor = .appWhite
    }
    
    
    // MARK: - Constraints methods
    
    private func mainScrollViewConstraints() {
        self.mainScrollView.translatesAutoresizingMaskIntoConstraints = false
        self.mainScrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        self.mainScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        self.mainScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        self.mainScrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    private func aboutScrollViewConstraints() {
        self.aboutScrollView.translatesAutoresizingMaskIntoConstraints = false
        self.aboutScrollView.topAnchor.constraint(equalTo: self.mainScrollView.topAnchor, constant: 90).isActive = true
        self.aboutScrollView.leadingAnchor.constraint(equalTo: self.mainScrollView.leadingAnchor).isActive = true
        self.aboutScrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        self.aboutScrollView.heightAnchor.constraint(equalToConstant: 180).isActive = true
    }
    
    private func stripBetweenScrollsConstraints() {
        self.stripBetweenScrolls.translatesAutoresizingMaskIntoConstraints = false
        self.stripBetweenScrolls.topAnchor.constraint(equalTo: self.aboutScrollView.bottomAnchor).isActive = true
        self.stripBetweenScrolls.leadingAnchor.constraint(equalTo: self.mainScrollView.leadingAnchor).isActive = true
        self.stripBetweenScrolls.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        self.stripBetweenScrolls.heightAnchor.constraint(equalToConstant: 89).isActive = true
    }
        
    private func aboutButton1Constraints() {
        self.aboutButton1.translatesAutoresizingMaskIntoConstraints = false
        self.aboutButton1.topAnchor.constraint(equalTo: aboutScrollView.topAnchor, constant: 20).isActive = true
        self.aboutButton1.leadingAnchor.constraint(equalTo: aboutScrollView.leadingAnchor, constant: 30).isActive = true
        self.aboutButton1.heightAnchor.constraint(equalToConstant: 140).isActive = true
        self.aboutButton1.widthAnchor.constraint(equalToConstant: 120).isActive = true
        
    }
    
    private func aboutButton2Constraints() {
        self.aboutButton2.translatesAutoresizingMaskIntoConstraints = false
        self.aboutButton2.topAnchor.constraint(equalTo: aboutScrollView.topAnchor, constant: 20).isActive = true
        self.aboutButton2.leadingAnchor.constraint(equalTo: aboutScrollView.leadingAnchor, constant: 180).isActive = true
        self.aboutButton2.heightAnchor.constraint(equalToConstant: 140).isActive = true
        self.aboutButton2.widthAnchor.constraint(equalToConstant: 120).isActive = true
    }
    
    private func aboutButton3Constraints() {
        self.aboutButton3.translatesAutoresizingMaskIntoConstraints = false
        self.aboutButton3.topAnchor.constraint(equalTo: aboutScrollView.topAnchor, constant: 20).isActive = true
        self.aboutButton3.leadingAnchor.constraint(equalTo: aboutScrollView.leadingAnchor, constant: 330).isActive = true
        self.aboutButton3.heightAnchor.constraint(equalToConstant: 140).isActive = true
        self.aboutButton3.widthAnchor.constraint(equalToConstant: 120).isActive = true
    }
    
    private func aboutButton4Constraints() {
        self.aboutButton4.translatesAutoresizingMaskIntoConstraints = false
        self.aboutButton4.topAnchor.constraint(equalTo: aboutScrollView.topAnchor, constant: 20).isActive = true
        self.aboutButton4.leadingAnchor.constraint(equalTo: aboutScrollView.leadingAnchor, constant: 480).isActive = true
        self.aboutButton4.heightAnchor.constraint(equalToConstant: 140).isActive = true
        self.aboutButton4.widthAnchor.constraint(equalToConstant: 120).isActive = true
    }
      
    private func helloConstraints() {
        self.helloLabel.translatesAutoresizingMaskIntoConstraints = false
        self.helloLabel.topAnchor.constraint(equalTo: self.mainScrollView.topAnchor, constant: 20).isActive = true
        self.helloLabel.leadingAnchor.constraint(equalTo: self.mainScrollView.leadingAnchor).isActive = true
        self.helloLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        self.helloLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        self.helloNameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.helloNameLabel.topAnchor.constraint(equalTo: self.mainScrollView.topAnchor, constant: 50).isActive = true
        self.helloNameLabel.leadingAnchor.constraint(equalTo: self.mainScrollView.leadingAnchor).isActive = true
        self.helloNameLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        self.helloNameLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    private func searchButtonConstraints() {
        self.searchButton.translatesAutoresizingMaskIntoConstraints = false
        self.searchButton.topAnchor.constraint(equalTo: stripBetweenScrolls.topAnchor, constant: 30).isActive = true
        self.searchButton.leadingAnchor.constraint(equalTo: self.stripBetweenScrolls.leadingAnchor, constant: 30).isActive = true
        self.searchButton.trailingAnchor.constraint(equalTo: self.stripBetweenScrolls.trailingAnchor, constant: -30).isActive = true
        self.searchButton.heightAnchor.constraint(equalToConstant: 49).isActive = true
    }
    
    private func rentalOptionsConstraints() {
        self.rentalOptions.translatesAutoresizingMaskIntoConstraints = false
        self.rentalOptions.topAnchor.constraint(equalTo: self.stripBetweenScrolls.bottomAnchor).isActive = true
        self.rentalOptions.leadingAnchor.constraint(equalTo: self.mainScrollView.leadingAnchor).isActive = true
        self.rentalOptions.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        self.rentalOptions.heightAnchor.constraint(equalToConstant: 400).isActive = true
    }
    
    private func rentalConstraints() {
        self.rentalAppart.translatesAutoresizingMaskIntoConstraints = false
        self.rentalRoom.translatesAutoresizingMaskIntoConstraints = false
        self.rentalHouse.translatesAutoresizingMaskIntoConstraints = false
        self.rentalArea.translatesAutoresizingMaskIntoConstraints = false
        
        self.rentalAppart.topAnchor.constraint(equalTo: self.rentalOptions.topAnchor, constant: 40).isActive = true
        self.rentalAppart.leadingAnchor.constraint(equalTo: self.rentalOptions.leadingAnchor).isActive = true
        self.rentalAppart.widthAnchor.constraint(equalToConstant: view.frame.width / 2).isActive = true
        self.rentalAppart.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        self.rentalRoom.topAnchor.constraint(equalTo: self.rentalOptions.topAnchor, constant: 40).isActive = true
        self.rentalRoom.leadingAnchor.constraint(equalTo: self.rentalAppart.trailingAnchor).isActive = true
        self.rentalRoom.trailingAnchor.constraint(equalTo: self.rentalOptions.trailingAnchor).isActive = true
        self.rentalRoom.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        self.rentalHouse.topAnchor.constraint(equalTo: self.rentalRoom.bottomAnchor).isActive = true
        self.rentalHouse.leadingAnchor.constraint(equalTo: self.rentalOptions.leadingAnchor).isActive = true
        self.rentalHouse.widthAnchor.constraint(equalToConstant: view.frame.width / 2).isActive = true
        self.rentalHouse.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        self.rentalArea.topAnchor.constraint(equalTo: self.rentalRoom.bottomAnchor).isActive = true
        self.rentalArea.leadingAnchor.constraint(equalTo: self.rentalHouse.trailingAnchor).isActive = true
        self.rentalArea.trailingAnchor.constraint(equalTo: self.rentalOptions.trailingAnchor).isActive = true
        self.rentalArea.heightAnchor.constraint(equalToConstant: 70).isActive = true
    }
    
    private func rentalNameConstraints() {
        self.rentalName.translatesAutoresizingMaskIntoConstraints = false
        self.rentalName.topAnchor.constraint(equalTo: self.rentalOptions.topAnchor).isActive = true
        self.rentalName.leadingAnchor.constraint(equalTo: self.rentalOptions.leadingAnchor).isActive = true
        self.rentalName.trailingAnchor.constraint(equalTo: self.rentalOptions.trailingAnchor).isActive = true
        self.rentalName.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    private func rentalNumberOfRoomsConstraints() {
    self.rentalNumberOfRooms.translatesAutoresizingMaskIntoConstraints = false
    self.rentalNumberOfRooms.topAnchor.constraint(equalTo: self.rentalArea.bottomAnchor, constant: 10).isActive = true
    self.rentalNumberOfRooms.leadingAnchor.constraint(equalTo: self.rentalOptions.leadingAnchor).isActive = true
    self.rentalNumberOfRooms.trailingAnchor.constraint(equalTo: self.rentalOptions.trailingAnchor).isActive = true
    self.rentalNumberOfRooms.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    private func NumberOfRoomsConstraints() {
        self.NumberOfRooms.translatesAutoresizingMaskIntoConstraints = false
        self.NumberOfRooms.topAnchor.constraint(equalTo: self.rentalNumberOfRooms.bottomAnchor, constant: 0).isActive = true
        self.NumberOfRooms.leadingAnchor.constraint(equalTo: self.rentalOptions.leadingAnchor).isActive = true
        self.NumberOfRooms.trailingAnchor.constraint(equalTo: self.rentalOptions.trailingAnchor).isActive = true
        self.NumberOfRooms.heightAnchor.constraint(equalToConstant: 55).isActive = true
    }
    
    private func rentalNumberOfPersonConstraints() {
        self.rentalNumberOfPerson.translatesAutoresizingMaskIntoConstraints = false
        self.rentalNumberOfPerson.topAnchor.constraint(equalTo: self.NumberOfRooms.bottomAnchor, constant: 10).isActive = true
        self.rentalNumberOfPerson.leadingAnchor.constraint(equalTo: self.rentalOptions.leadingAnchor).isActive = true
        self.rentalNumberOfPerson.trailingAnchor.constraint(equalTo: self.rentalOptions.trailingAnchor).isActive = true
        self.rentalNumberOfPerson.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    private func NumberOfPersonConstraints() {
        self.NumberOfPerson.translatesAutoresizingMaskIntoConstraints = false
        self.NumberOfPerson.topAnchor.constraint(equalTo: self.rentalNumberOfPerson.bottomAnchor, constant: 0).isActive = true
        self.NumberOfPerson.leadingAnchor.constraint(equalTo: self.rentalOptions.leadingAnchor).isActive = true
        self.NumberOfPerson.trailingAnchor.constraint(equalTo: self.rentalOptions.trailingAnchor).isActive = true
        self.NumberOfPerson.heightAnchor.constraint(equalToConstant: 55).isActive = true
    }
    
    private func stripAfterScrollsConstraints() {
        self.stripAfterScrolls.translatesAutoresizingMaskIntoConstraints = false
        self.stripAfterScrolls.topAnchor.constraint(equalTo: rentalOptions.bottomAnchor).isActive = true
        self.stripAfterScrolls.leadingAnchor.constraint(equalTo: self.mainScrollView.leadingAnchor).isActive = true
        self.stripAfterScrolls.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        self.stripAfterScrolls.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    private func stripToStripConstraints() {
        self.stripToStrip.translatesAutoresizingMaskIntoConstraints = false
        self.stripToStrip.bottomAnchor.constraint(equalTo: stripAfterScrolls.bottomAnchor, constant: -10).isActive = true
        self.stripToStrip.heightAnchor.constraint(equalToConstant: 4).isActive = true
        self.stripToStrip.widthAnchor.constraint(equalToConstant: 100).isActive = true
        self.stripToStrip.leadingAnchor.constraint(equalTo: stripAfterScrolls.leadingAnchor, constant: ((view.frame.width / 2) - 50)).isActive = true
    }
    
    private func roomsConstraints() {
        self.room1.translatesAutoresizingMaskIntoConstraints = false
        self.room2.translatesAutoresizingMaskIntoConstraints = false
        self.room3.translatesAutoresizingMaskIntoConstraints = false
        self.room4.translatesAutoresizingMaskIntoConstraints = false
        self.room5.translatesAutoresizingMaskIntoConstraints = false
        
        self.room1.heightAnchor.constraint(equalToConstant: 40).isActive = true
        self.room1.widthAnchor.constraint(equalToConstant: 40).isActive = true
        self.room1.leadingAnchor.constraint(equalTo: NumberOfRooms.leadingAnchor, constant: 30).isActive = true
        self.room1.centerYAnchor.constraint(equalTo: NumberOfRooms.centerYAnchor).isActive = true
        
        self.room2.heightAnchor.constraint(equalToConstant: 40).isActive = true
        self.room2.widthAnchor.constraint(equalToConstant: 40).isActive = true
        self.room2.leadingAnchor.constraint(equalTo: NumberOfRooms.leadingAnchor, constant: 100).isActive = true
        self.room2.centerYAnchor.constraint(equalTo: NumberOfRooms.centerYAnchor).isActive = true
        
        self.room3.heightAnchor.constraint(equalToConstant: 40).isActive = true
        self.room3.widthAnchor.constraint(equalToConstant: 40).isActive = true
        self.room3.leadingAnchor.constraint(equalTo: NumberOfRooms.leadingAnchor, constant: 170).isActive = true
        self.room3.centerYAnchor.constraint(equalTo: NumberOfRooms.centerYAnchor).isActive = true
        
        self.room4.heightAnchor.constraint(equalToConstant: 40).isActive = true
        self.room4.widthAnchor.constraint(equalToConstant: 40).isActive = true
        self.room4.leadingAnchor.constraint(equalTo: NumberOfRooms.leadingAnchor, constant: 240).isActive = true
        self.room4.centerYAnchor.constraint(equalTo: NumberOfRooms.centerYAnchor).isActive = true
        
        self.room5.heightAnchor.constraint(equalToConstant: 40).isActive = true
        self.room5.widthAnchor.constraint(equalToConstant: 60).isActive = true
        self.room5.leadingAnchor.constraint(equalTo: NumberOfRooms.leadingAnchor, constant: 310).isActive = true
        self.room5.centerYAnchor.constraint(equalTo: NumberOfRooms.centerYAnchor).isActive = true
    }
    
    private func personConstraints() {
        self.person1.translatesAutoresizingMaskIntoConstraints = false
        self.person2.translatesAutoresizingMaskIntoConstraints = false
        self.person3.translatesAutoresizingMaskIntoConstraints = false
        self.person4.translatesAutoresizingMaskIntoConstraints = false
        self.person5.translatesAutoresizingMaskIntoConstraints = false
        self.person6.translatesAutoresizingMaskIntoConstraints = false
        self.person7.translatesAutoresizingMaskIntoConstraints = false
        self.person8.translatesAutoresizingMaskIntoConstraints = false
        self.person9.translatesAutoresizingMaskIntoConstraints = false
        
        func constraintOfPerson(person: UIButton, const: CGFloat) {
            let personB = person
            personB.heightAnchor.constraint(equalToConstant: 40).isActive = true
            personB.widthAnchor.constraint(equalToConstant: 40).isActive = true
            personB.leadingAnchor.constraint(equalTo: NumberOfPerson.leadingAnchor, constant: const).isActive = true
            personB.centerYAnchor.constraint(equalTo: NumberOfPerson.centerYAnchor).isActive = true
        }
        
        constraintOfPerson(person: person1, const: 30)
        constraintOfPerson(person: person2, const: 100)
        constraintOfPerson(person: person3, const: 170)
        constraintOfPerson(person: person4, const: 240)
        constraintOfPerson(person: person5, const: 310)
        constraintOfPerson(person: person6, const: 380)
        constraintOfPerson(person: person7, const: 450)
        constraintOfPerson(person: person8, const: 520)
        constraintOfPerson(person: person9, const: 590)
    }
    
    
    // MARK: - UI settings
    
    private func searchButtonSettings() {
        self.searchButton.clipsToBounds = true
        self.searchButton.layer.cornerRadius = 15
        self.searchButton.setTitle("Поиск", for: .normal)
        self.searchButton.setTitleColor(.black, for: .normal)
        self.searchButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        self.searchButton.layer.borderWidth = 2
        self.searchButton.layer.borderColor = .appPurple
    }
    
    private func stripBetweenScrollsCorners() {
        self.stripBetweenScrolls.clipsToBounds = true
        self.stripBetweenScrolls.layer.cornerRadius = 30
        self.stripBetweenScrolls.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
    }
    
    private func aboutButtonCorners() {
        
        func buttonsCorners(aboutButton: UIButton) {
            let button = aboutButton
            button.clipsToBounds = true
            button.layer.cornerRadius = 15
        }
        
        buttonsCorners(aboutButton: aboutButton1)
        buttonsCorners(aboutButton: aboutButton2)
        buttonsCorners(aboutButton: aboutButton3)
        buttonsCorners(aboutButton: aboutButton4)
        
        aboutButton1.setTitle("КАК          ЭТО РАБОТАЕТ", for: .normal)
        aboutButton1.setTitleColor(.appBlack, for: .normal)
        aboutButton1.titleLabel?.numberOfLines = 3
        
        aboutButton2.setTitle("Скидки", for: .normal)
        aboutButton2.setTitleColor(.appBlack, for: .normal)
        aboutButton2.titleLabel?.numberOfLines = 3
        
        aboutButton3.setTitle("Акции", for: .normal)
        aboutButton3.setTitleColor(.appBlack, for: .normal)
        aboutButton3.titleLabel?.numberOfLines = 3
        
        aboutButton4.setTitle("Новости аренды", for: .normal)
        aboutButton4.setTitleColor(.appBlack, for: .normal)
        aboutButton4.titleLabel?.numberOfLines = 3
    }
    
    private func helloSettings() {
        self.helloLabel.text = "    Здравствуйте!"
        self.helloNameLabel.text = " "
        
        self.helloLabel.textColor = .appWhite
        self.helloNameLabel.textColor = .appWhite
        
        self.helloLabel.font = UIFont.systemFont(ofSize: 25, weight: UIFont.Weight.medium)
        self.helloNameLabel.font = UIFont.systemFont(ofSize: 25, weight: UIFont.Weight.bold)
    }
    
    private func rentalNameSettings() {
        self.rentalName.text = "    Вид недвижимости"
        self.rentalName.textColor = .appBlack
        self.rentalName.font = UIFont.systemFont(ofSize: 17, weight: UIFont.Weight.bold)
    }
    
    private func rentalNumberOfRoomsSettings() {
        self.rentalNumberOfRooms.text = "    Количество комнат"
        self.rentalNumberOfRooms.textColor = .appBlack
        self.rentalNumberOfRooms.font = UIFont.systemFont(ofSize: 17, weight: UIFont.Weight.bold)
        
    }
    
    private func rentalNumberOfPersonSettings() {
        self.rentalNumberOfPerson.text = "    Количество гостей"
        self.rentalNumberOfPerson.textColor = .appBlack
        self.rentalNumberOfPerson.font = UIFont.systemFont(ofSize: 17, weight: UIFont.Weight.bold)
    }
    
    private func stripAfterScrollsSettings() {
        self.stripAfterScrolls.clipsToBounds = true
        self.stripAfterScrolls.layer.cornerRadius = 30
        self.stripAfterScrolls.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
    }
    
    private func roomsSettings() {

        func roomSet(title: String, room: UIButton) {
            
            let exRoom = room
            exRoom.clipsToBounds = true
            exRoom.layer.cornerRadius = 15
            exRoom.setTitle(title, for: .normal)
            exRoom.setTitleColor(.black, for: .normal)
            exRoom.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
            exRoom.layer.borderWidth = 1.4
            exRoom.layer.borderColor = .appBlack
        }
        
        roomSet(title: "1", room: self.room1)
        roomSet(title: "2", room: self.room2)
        roomSet(title: "3", room: self.room3)
        roomSet(title: "4", room: self.room4)
        roomSet(title: "5+", room: self.room5)
    }
    
    private func personSettings() {
        
        func personSet(title: String, person: UIButton) {
            
            let personX = person
            personX.clipsToBounds = true
            personX.layer.cornerRadius = 15
            personX.setTitle(title, for: .normal)
            personX.setTitleColor(.black, for: .normal)
            personX.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
            personX.layer.borderWidth = 1.4
            personX.layer.borderColor = .appBlack
        }
        
        personSet(title: "1", person: person1)
        personSet(title: "2", person: person2)
        personSet(title: "3", person: person3)
        personSet(title: "4", person: person4)
        personSet(title: "5", person: person5)
        personSet(title: "6", person: person6)
        personSet(title: "7", person: person7)
        personSet(title: "8", person: person8)
        personSet(title: "9", person: person9)
    }
    
    private func rentalSettings() {
        self.rentalAppart.setTitle("Квартира", for: .normal)
        self.rentalHouse.setTitle("Дом", for: .normal)
        self.rentalRoom.setTitle("Комната", for: .normal)
        self.rentalArea.setTitle("Участок", for: .normal)
        
        self.rentalAppart.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        self.rentalHouse.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        self.rentalRoom.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        self.rentalArea.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        
        self.rentalAppart.setTitleColor(.black, for: .normal)
        self.rentalHouse.setTitleColor(.black, for: .normal)
        self.rentalRoom.setTitleColor(.black, for: .normal)
        self.rentalArea.setTitleColor(.black, for: .normal)
    }
    
    // MARK: - Action methods
    
    @objc func playTapped() {
        self.present(aboutAppController(), animated: true, completion: nil)
    }
    
    @objc func searchTapped() {
        
        rentalAppartC = 0
        rentalHouseC = 0
        rentalRoomC = 0
        rentalAreaC = 0

        room1C = 0
        room2C = 0
        room3C = 0
        room4C = 0
        room5C = 0
        room6C = 0
        room7C = 0
        room8C = 0
        room9C = 0
        
        if rentalAppart.backgroundColor == .appVine {
            rentalAppartC = 1
        }
        if rentalHouse.backgroundColor == .appVine {
            rentalHouseC = 1
        }
        if rentalRoom.backgroundColor == .appVine {
            rentalRoomC = 1
        }
        if rentalArea.backgroundColor == .appVine {
            rentalAreaC = 1
        }
        if room1.backgroundColor == .appVine {
            room1C = 1
        }
        if room2.backgroundColor == .appVine {
            room2C = 1
        }
        if room3.backgroundColor == .appVine {
            room3C = 1
        }
        if room3.backgroundColor == .appVine {
            room3C = 1
        }
        if room3.backgroundColor == .appVine {
            room3C = 1
        }
        if room3.backgroundColor == .appVine {
            room3C = 1
        }
        if room3.backgroundColor == .appVine {
            room3C = 1
        }
        if room4.backgroundColor == .appVine {
            room4C = 1
        }
        if room5.backgroundColor == .appVine {
            room5C = 1
        }

        self.present(MapViewController(), animated: true, completion: nil)
    }
    
    @objc func rentalAppartT() {
        if rentalAppart.backgroundColor == .appWolf {
            rentalAppart.backgroundColor = .appVine
        } else {
            rentalAppart.backgroundColor = .appWolf
        }
    }
    
    @objc func rentalHouseT() {
        
        if rentalHouse.backgroundColor == .appWolf {
            rentalHouse.backgroundColor = .appVine
        } else {
            rentalHouse.backgroundColor = .appWolf
        }
    }
    
    @objc func rentalRoomT() {
        if rentalRoom.backgroundColor == .appWolf {
            rentalRoom.backgroundColor = .appVine
        } else {
            rentalRoom.backgroundColor = .appWolf
        }
        room1.backgroundColor = .appVine
        room2.backgroundColor = .appWhite
        room3.backgroundColor = .appWhite
        room4.backgroundColor = .appWhite
        room5.backgroundColor = .appWhite
        rentalRoom.backgroundColor = .appVine
    }
    
    @objc func rentalAreaT() {
        if rentalArea.backgroundColor == .appWolf {
            rentalArea.backgroundColor = .appVine
        } else {
            rentalArea.backgroundColor = .appWolf
        }
    }
    
    @objc func room1T() {
        if room1.backgroundColor == .appWhite {
            room1.backgroundColor = .appVine
        } else {
            room1.backgroundColor = .appWhite
        }
    }
    
    @objc func room2T() {
        rentalRoom.backgroundColor = .appWolf
        if room2.backgroundColor == .appWhite {
            room2.backgroundColor = .appVine
        } else {
            room2.backgroundColor = .appWhite
        }
    }
    
    @objc func room3T() {
        rentalRoom.backgroundColor = .appWolf
        if room3.backgroundColor == .appWhite {
            room3.backgroundColor = .appVine
        } else {
            room3.backgroundColor = .appWhite
        }
    }
    
    @objc func room4T() {
        rentalRoom.backgroundColor = .appWolf
        if room4.backgroundColor == .appWhite {
            room4.backgroundColor = .appVine
        } else {
            room4.backgroundColor = .appWhite
        }
    }
    
    @objc func room5T() {
        rentalRoom.backgroundColor = .appWolf
        if room5.backgroundColor == .appWhite {
            room5.backgroundColor = .appVine
        } else {
            room5.backgroundColor = .appWhite
        }
    }
    
    @objc func person1T() {
        rentalRoom.backgroundColor = .appWolf
        if person1.backgroundColor == .appWhite {
            person1.backgroundColor = .appVine
        } else {
            person1.backgroundColor = .appWhite
        }
    }
    
    @objc func person2T() {
        rentalRoom.backgroundColor = .appWolf
        if person2.backgroundColor == .appWhite {
            person2.backgroundColor = .appVine
        } else {
            person2.backgroundColor = .appWhite
        }
    }
    
    @objc func person3T() {
        rentalRoom.backgroundColor = .appWolf
        if person3.backgroundColor == .appWhite {
            person3.backgroundColor = .appVine
        } else {
            person3.backgroundColor = .appWhite
        }
    }
    
    @objc func person4T() {
        rentalRoom.backgroundColor = .appWolf
        if person4.backgroundColor == .appWhite {
            person4.backgroundColor = .appVine
        } else {
            person4.backgroundColor = .appWhite
        }
    }
    
    @objc func person5T() {
        rentalRoom.backgroundColor = .appWolf
        if person5.backgroundColor == .appWhite {
            person5.backgroundColor = .appVine
        } else {
            person5.backgroundColor = .appWhite
        }
    }
    
    @objc func person6T() {
        rentalRoom.backgroundColor = .appWolf
        if person6.backgroundColor == .appWhite {
            person6.backgroundColor = .appVine
        } else {
            person6.backgroundColor = .appWhite
        }
    }
    
    @objc func person7T() {
        rentalRoom.backgroundColor = .appWolf
        if person7.backgroundColor == .appWhite {
            person7.backgroundColor = .appVine
        } else {
            person7.backgroundColor = .appWhite
        }
    }
    
    @objc func person8T() {
        rentalRoom.backgroundColor = .appWolf
        if person8.backgroundColor == .appWhite {
            person8.backgroundColor = .appVine
        } else {
            person8.backgroundColor = .appWhite
        }
        
    }
    
    @objc func person9T() {
        rentalRoom.backgroundColor = .appWolf
        if person9.backgroundColor == .appWolf {
            person9.backgroundColor = .appVine
        } else {
            person9.backgroundColor = .appWolf
        }
    }
}

var rentalAppartC = 0
var rentalHouseC = 0
var rentalRoomC = 0
var rentalAreaC = 0

var room1C = 0
var room2C = 0
var room3C = 0
var room4C = 0
var room5C = 0
var room6C = 0
var room7C = 0
var room8C = 0
var room9C = 0

class service: Service {
    
}
