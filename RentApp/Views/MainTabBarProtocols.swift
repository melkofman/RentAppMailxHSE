//
//  MainTabBarProtocols.swift
//  RentApp
//
//  Created by Melanie Kofman on 08.01.2021.
//

import UIKit

protocol MainTabBarModuleInput: class {
    
}

protocol MainTabBarModuleOutput: class {
    func createProfileVC(dict: [String: AnyObject]) -> ProfileContainer
    
}


protocol MainTabBarViewInput {
    
}

protocol MainTabBarViewOutput: class {
    
    
}

protocol MainTabBarInteractorInput {
    
     
}

protocol MainTabBarInteractorOutput: class {
   
    
}

protocol MainTabBarRouterInput {

}

protocol MainTabBarRouterOutput: class {
    
}

