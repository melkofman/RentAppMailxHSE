//
//  ViewController.swift
//  RentApp
//
//  Created by Савва Шулятьев on 17.11.2020.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.viewControllers = [initialTabBar, finalTabBar]
    }
    
    lazy public var initialTabBar: TaskViewController = {
        
        let initialTabBar = TaskViewController()
        
        let title = "Tasks"
        

        

        
        let tabBarItems = (title: title, image: defaultImage, selectedImage: selectedImage)

        let tabBarItem = UITabBarItem(title: tabBarItems.title, image: tabBarItems.image, selectedImage: tabBarItems.selectedImage)
        
        initialTabBar.tabBarItem = tabBarItem

        return initialTabBar
    }()
    
    lazy public var finalTabBar: OwnTaskViewController = {
        
        let finalTabBar = OwnTaskViewController()
        

        

        
        let tabBarItem = UITabBarItem(title: "H", image: zz, selectedImage: <#T##UIImage?#>)
        
        finalTabBar.tabBarItem = tabBarItem
        
        return finalTabBar
    }()

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

extension TabBarController: UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print("Selected \(viewController.title!)")
    }
    
}

