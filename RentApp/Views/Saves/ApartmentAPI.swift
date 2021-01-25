//
//  ApartmentAPI.swift
//  RentApp
//
//  Created by Тагир Ракипов on 06.01.2021.
//

import Foundation


class ApartmentAPI {
    
    static func getApartments() -> [Apartment] {
        
        
        let aparts = [
            Apartment(address: "Москва, Тверская 7", country: "РФ", ownerPhone: "555-55-55", pictureIndex: "ap1.jpg", price: 2500, square: 40, rooms: 2)
        ]
        return aparts
    }
}
    
class ApartmentAPI2 {

    static func getApartments1() -> [Apartment] {
        let aparts = [
            Apartment(address: "", country: "", ownerPhone: "", pictureIndex: nil, price: 0, square: 0, rooms: 0)
        ]
        return aparts
        
    }
}



