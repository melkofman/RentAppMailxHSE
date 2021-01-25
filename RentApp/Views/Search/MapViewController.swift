//
//  MapViewController.swift
//  apartsharing
//
//  Created by Савва Шулятьев on 06.01.2021.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {


    // MARK: - Proterties
    
    lazy var contentSizeForScroll = CGSize(width: 900, height: 200)


    // MARK: - Views

    lazy var mapView = MKMapView()
    lazy var searchSettings = UIView()
    lazy var goBackToSearch = UIButton()
    lazy var settings = UIButton()
    lazy var searchInfo = UILabel()
    lazy var scrollView = UIScrollView()
    
    lazy var viewAppart1 = UIView()
    lazy var viewAppart2 = UIView()
    lazy var viewAppart3 = UIView()
    
    lazy var labelAppart1 = UILabel()
    lazy var labelAppart2 = UILabel()
    lazy var labelAppart3 = UILabel()
    
    lazy var buttonAppart1 = UIButton()
    lazy var buttonAppart2 = UIButton()
    lazy var buttonAppart3 = UIButton()
    
    


    // MARK: - Lifecycle methods

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(room2C)
        
        var appartsAnalized: Array<Appart>
        
        let Appart1: Appart = Appart(name: "Квартира в центре", lattitude: 55.75370903771494, longtitude: 37.61981338262558, set: "Appart", room: 2, maxPerson: 5, money: 3400)
        let Appart2: Appart = Appart(name: "Квартира у парка", lattitude: 55.70, longtitude: 37.51, set: "Appart", room: 3, maxPerson: 4, money: 3000)
        let Appart3: Appart = Appart(name: "Квартира на 1 этаже", lattitude: 55.78370903771494, longtitude: 37.61981338262558, set: "Appart", room: 3, maxPerson: 4, money: 2500)
        
        let apparts = [
            Appart1,
            Appart2,
            Appart3
        ]

        appartsAnalized = [Appart2]
        
        viewColors()

        self.view.addSubview(mapView)
        mapViewConstraints()
        mapViewSettings()

        self.mapView.addSubview(searchSettings)
        searchSettingsConstraints()
        searchSettingsSettings()
        
        self.searchSettings.addSubview(goBackToSearch)
        goBackToSearchConstraints()
        goBackToSearchSettings()
        
        self.searchSettings.addSubview(settings)
        settingsConstraints()
        settingsSettings()
        
        self.searchSettings.addSubview(searchInfo)
        searchInfoConstraints()
        searchInfoSettings()
        
        if room2C == 1 && room3C == 0 {
            fetchAppartsOnMap2(appartsAnalized)
        } else {
            fetchAppartsOnMap1(apparts)
        }
        
        self.mapView.addSubview(scrollView)
        scrollViewConstraints()
        self.scrollView.contentSize = contentSizeForScroll
        
        self.scrollView.addSubview(viewAppart1)
        self.scrollView.addSubview(viewAppart2)
        self.scrollView.addSubview(viewAppart3)
        viewConstraint()
        
        self.viewAppart1.addSubview(labelAppart1)
        self.viewAppart2.addSubview(labelAppart2)
        self.viewAppart3.addSubview(labelAppart3)
        labelConstraint()
        
        self.viewAppart1.addSubview(buttonAppart1)
        self.viewAppart2.addSubview(buttonAppart2)
        self.viewAppart3.addSubview(buttonAppart3)
        buttonConstraint()
        
        buttonAppart2.addTarget(self, action: #selector(playTapped), for: .touchDown)
    }


    // MARK: - Colors

    private func viewColors() {
        self.view.backgroundColor = .white
        self.scrollView.backgroundColor = .appVine
        viewAppart1.backgroundColor = .white
        viewAppart2.backgroundColor = .white
        viewAppart3.backgroundColor = .white
        labelAppart1.backgroundColor = .white
        labelAppart2.backgroundColor = .white
        labelAppart3.backgroundColor = .white
        buttonAppart1.backgroundColor = .gray
        buttonAppart2.backgroundColor = .gray
        buttonAppart3.backgroundColor = .gray
        
        if room2C == 1 && room3C == 0 {
            viewAppart2.alpha = 0
            viewAppart3.alpha = 0
            
            labelAppart2.alpha = 0
            labelAppart3.alpha = 0
            
            buttonAppart2.alpha = 0
            buttonAppart3.alpha = 0
        } else {
            viewAppart2.alpha = 1
            viewAppart3.alpha = 1
            
            labelAppart2.alpha = 1
            labelAppart3.alpha = 1
            
            buttonAppart2.alpha = 1
            buttonAppart3.alpha = 1
        }
        
    }


    // MARK: - Constraints methods
    
    private func buttonConstraint() {
        buttonAppart1.translatesAutoresizingMaskIntoConstraints = false
        buttonAppart2.translatesAutoresizingMaskIntoConstraints = false
        buttonAppart3.translatesAutoresizingMaskIntoConstraints = false
        
        self.buttonAppart1.bottomAnchor.constraint(equalTo: viewAppart1.bottomAnchor, constant: 10).isActive = true
        self.buttonAppart1.trailingAnchor.constraint(equalTo: viewAppart1.trailingAnchor, constant: -10).isActive = true
        self.buttonAppart1.leadingAnchor.constraint(equalTo: viewAppart1.leadingAnchor, constant: 10).isActive = true
        self.buttonAppart1.heightAnchor.constraint(equalToConstant: 100).isActive = true
        buttonAppart1.setTitle("Арендовать", for: .normal)
        buttonAppart1.tintColor = .white
        buttonAppart1.setTitleColor(.white, for: .normal)
        
        self.buttonAppart2.bottomAnchor.constraint(equalTo: viewAppart2.bottomAnchor, constant: 10).isActive = true
        self.buttonAppart2.trailingAnchor.constraint(equalTo: viewAppart2.trailingAnchor, constant: -10).isActive = true
        self.buttonAppart2.leadingAnchor.constraint(equalTo: viewAppart2.leadingAnchor, constant: 10).isActive = true
        self.buttonAppart2.heightAnchor.constraint(equalToConstant: 100).isActive = true
        buttonAppart2.setTitle("Арендовать", for: .normal)
        buttonAppart2.tintColor = .white
        buttonAppart2.setTitleColor(.white, for: .normal)
        
        self.buttonAppart3.bottomAnchor.constraint(equalTo: viewAppart3.bottomAnchor, constant: 10).isActive = true
        self.buttonAppart3.trailingAnchor.constraint(equalTo: viewAppart3.trailingAnchor, constant: -10).isActive = true
        self.buttonAppart3.leadingAnchor.constraint(equalTo: viewAppart3.leadingAnchor, constant: 10).isActive = true
        self.buttonAppart3.heightAnchor.constraint(equalToConstant: 100).isActive = true
        buttonAppart3.setTitle("Арендовать", for: .normal)
        buttonAppart3.tintColor = .white
        buttonAppart3.setTitleColor(.white, for: .normal)
        
        
    }
    
    private func labelConstraint() {
        labelAppart1.translatesAutoresizingMaskIntoConstraints = false
        labelAppart2.translatesAutoresizingMaskIntoConstraints = false
        labelAppart3.translatesAutoresizingMaskIntoConstraints = false
        
        self.labelAppart1.topAnchor.constraint(equalTo: viewAppart1.topAnchor, constant: 10).isActive = true
        self.labelAppart1.trailingAnchor.constraint(equalTo: viewAppart1.trailingAnchor, constant: -10).isActive = true
        self.labelAppart1.leadingAnchor.constraint(equalTo: viewAppart1.leadingAnchor, constant: 10).isActive = true
        self.labelAppart1.heightAnchor.constraint(equalToConstant: 20).isActive = true
        labelAppart1.text = "Квартира у парк"
        labelAppart1.textColor = .black
        
        self.labelAppart2.topAnchor.constraint(equalTo: viewAppart2.topAnchor, constant: 10).isActive = true
        self.labelAppart2.trailingAnchor.constraint(equalTo: viewAppart2.trailingAnchor, constant: -10).isActive = true
        self.labelAppart2.leadingAnchor.constraint(equalTo: viewAppart2.leadingAnchor, constant: 10).isActive = true
        self.labelAppart2.heightAnchor.constraint(equalToConstant: 20).isActive = true
        labelAppart2.text = "Кваритра в центре"
        labelAppart2.textColor = .black
        
        self.labelAppart3.topAnchor.constraint(equalTo: viewAppart3.topAnchor, constant: 10).isActive = true
        self.labelAppart3.trailingAnchor.constraint(equalTo: viewAppart3.trailingAnchor, constant: -10).isActive = true
        self.labelAppart3.leadingAnchor.constraint(equalTo: viewAppart3.leadingAnchor, constant: 10).isActive = true
        self.labelAppart3.heightAnchor.constraint(equalToConstant: 20).isActive = true
        labelAppart3.text = "Квартира на 1 этаже"
        labelAppart3.textColor = .black
    }
    
    private func viewConstraint() {
        self.viewAppart1.translatesAutoresizingMaskIntoConstraints = false
        self.viewAppart2.translatesAutoresizingMaskIntoConstraints = false
        self.viewAppart3.translatesAutoresizingMaskIntoConstraints = false
        
        self.viewAppart1.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 10).isActive = true
        self.viewAppart1.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10).isActive = true
        self.viewAppart1.widthAnchor.constraint(equalToConstant: 200).isActive = true
        self.viewAppart1.heightAnchor.constraint(equalToConstant: 160).isActive = true
        
        self.viewAppart2.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 10).isActive = true
        self.viewAppart2.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 220).isActive = true
        self.viewAppart2.widthAnchor.constraint(equalToConstant: 200).isActive = true
        self.viewAppart2.heightAnchor.constraint(equalToConstant: 160).isActive = true
        
        self.viewAppart3.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 10).isActive = true
        self.viewAppart3.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 430).isActive = true
        self.viewAppart3.widthAnchor.constraint(equalToConstant: 200).isActive = true
        self.viewAppart3.heightAnchor.constraint(equalToConstant: 160).isActive = true
    }
    
    private func scrollViewConstraints() {
        self.scrollView.translatesAutoresizingMaskIntoConstraints = false
        self.scrollView.bottomAnchor.constraint(equalTo: mapView.bottomAnchor, constant: 0).isActive = true
        self.scrollView.trailingAnchor.constraint(equalTo: mapView.trailingAnchor, constant: 0).isActive = true
        self.scrollView.leadingAnchor.constraint(equalTo: mapView.leadingAnchor, constant: 0).isActive = true
        self.scrollView.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }

    private func mapViewConstraints() {
        self.mapView.translatesAutoresizingMaskIntoConstraints = false
        self.mapView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        self.mapView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.mapView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        self.mapView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }

    private func searchSettingsConstraints() {
        self.searchSettings.translatesAutoresizingMaskIntoConstraints = false
        self.searchSettings.topAnchor.constraint(equalTo: self.mapView.topAnchor, constant: 0).isActive = true
        self.searchSettings.leadingAnchor.constraint(equalTo: self.mapView.leadingAnchor, constant: 0).isActive = true
        self.searchSettings.trailingAnchor.constraint(equalTo: self.mapView.trailingAnchor, constant: 0).isActive = true
        self.searchSettings.heightAnchor.constraint(equalToConstant: 59).isActive = true
    }
    
    private func goBackToSearchConstraints() {
        self.goBackToSearch.translatesAutoresizingMaskIntoConstraints = false
        self.goBackToSearch.leadingAnchor.constraint(equalTo: searchSettings.leadingAnchor, constant: 20).isActive = true
        self.goBackToSearch.centerYAnchor.constraint(equalTo: searchSettings.centerYAnchor).isActive = true
        self.goBackToSearch.heightAnchor.constraint(equalToConstant: 20).isActive = true
        self.goBackToSearch.widthAnchor.constraint(equalToConstant: 20).isActive = true
    }

    private func settingsConstraints() {
        self.settings.translatesAutoresizingMaskIntoConstraints = false
        self.settings.centerYAnchor.constraint(equalTo: searchSettings.centerYAnchor).isActive = true
        self.settings.trailingAnchor.constraint(equalTo: searchSettings.trailingAnchor, constant: -20).isActive = true
        self.settings.heightAnchor.constraint(equalToConstant: 20).isActive = true
        self.settings.widthAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    private func searchInfoConstraints() {
        self.searchInfo.translatesAutoresizingMaskIntoConstraints = false
        self.searchInfo.centerXAnchor.constraint(equalTo: searchSettings.centerXAnchor).isActive = true
        self.searchInfo.centerYAnchor.constraint(equalTo: searchSettings.centerYAnchor).isActive = true
        self.searchInfo.heightAnchor.constraint(equalToConstant: 20).isActive = true
        self.searchInfo.leadingAnchor.constraint(equalTo: searchSettings.leadingAnchor, constant: 60).isActive = true
        self.searchInfo.trailingAnchor.constraint(equalTo: searchSettings.trailingAnchor, constant: -60).isActive = true
        
    }

    // MARK: - UI settings

    private func mapViewSettings() {
        mapView.mapType = .mutedStandard
        let coordinate = CLLocationCoordinate2D(latitude: 55.75370903771494, longitude: 37.61981338262558)
        let span = MKCoordinateSpan(latitudeDelta: 0.55, longitudeDelta: 0.55)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        mapView.setRegion(region, animated: true)
    }
    
    private func searchSettingsSettings() {
        self.searchSettings.clipsToBounds = true
        self.searchSettings.layer.cornerRadius = 15
        self.searchSettings.layer.borderWidth = 2
        self.searchSettings.layer.borderColor = .appPurple
        self.searchSettings.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
    }
    
    private func goBackToSearchSettings() {
        self.searchSettings.backgroundColor = .white
        self.goBackToSearch.setImage(UIImage(systemName: "arrow.left.square"), for: .normal)
        self.goBackToSearch.tintColor = .appPurple
    }
    
    private func settingsSettings() {
        self.settings.backgroundColor = .white
        self.settings.setImage(UIImage(systemName: "list.dash"), for: .normal)
        self.settings.tintColor = .appPurple
    }
    
    private func searchInfoSettings() {
        searchInfo.backgroundColor = .white
        searchInfo.text = "Поиск жилья"
        searchInfo.textAlignment = .center
    }


    // MARK: - Action methods

    func fetchAppartsOnMap1(_ apparts: [Appart]) {
      for appart in apparts {
        let annotations = MKPointAnnotation()
        annotations.title = appart.name
        annotations.coordinate = CLLocationCoordinate2D(latitude:
          appart.lattitude, longitude: appart.longtitude)
        annotations.subtitle = String(appart.money)
        mapView.addAnnotation(annotations)
      }
    }
    
    func fetchAppartsOnMap2(_ appartsAnalized: [Appart]) {
      for appart in appartsAnalized {
        let annotations = MKPointAnnotation()
        annotations.title = appart.name
        annotations.coordinate = CLLocationCoordinate2D(latitude:
          appart.lattitude, longitude: appart.longtitude)
        annotations.subtitle = String(appart.money)
        mapView.addAnnotation(annotations)
      }
    }

    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if !(annotation is MKUserLocation) {
            let pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: String(annotation.hash))

            let rightButton = UIButton(type: .contactAdd)
            rightButton.tag = annotation.hash

            pinView.animatesDrop = true
            pinView.canShowCallout = true
            pinView.rightCalloutAccessoryView = rightButton

            return pinView
        }
        else {
            return nil
        }
    }
    
    @objc func playTapped() {
        print("hellow")
        buttonAppart2.backgroundColor = .systemPink
        goSaveAppart = 1
    }
    
    private func analizeOfService() {

    }
}

var goSaveAppart = 0


