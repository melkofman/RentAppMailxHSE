//
//  MainTabBarController.swift
//  RentApp
//
//  Created by Савва Шулятьев on 17.11.2020.
//

import UIKit

class MainTabBarController: UITabBarController, ProfileModuleOutput{
    var moduleOutput: MainTabBarModuleOutput
    
    var dict: [String: AnyObject]
    

    init(dict: [String: AnyObject], moduleOutput: MainTabBarModuleOutput) {
        self.dict = dict
        self.moduleOutput = moduleOutput
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func installationViewController(rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
        let navigationVC = UINavigationController(rootViewController: rootViewController)
        navigationVC.tabBarItem.title = title
        navigationVC.tabBarItem.image = image
        return navigationVC
    }
    
    private func installationViewControllerWithoutNavBar(ViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
        let VC = ViewController
        VC.tabBarItem.title = title
        VC.tabBarItem.image = image
        return VC
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Main Views
        let searchVC = SearchViewController()
        let savesVC = SavesViewController()
        let messengerVC = ObserveChatsViewController(uid: self.dict["uid"]! as! String)

        let profileVC = self.moduleOutput.createProfileVC(dict: dict)
        
        
        self.tabBar.backgroundColor = .appWolf
    
        viewControllers = [
            installationViewControllerWithoutNavBar(ViewController: searchVC, title: "Поиск", image: UIImage(systemName: "magnifyingglass")!),
            installationViewController(rootViewController: savesVC, title: "Арендованные", image: UIImage(systemName: "heart")!),
            installationViewController(rootViewController: messengerVC, title: "Поддержка", image: UIImage(systemName: "bubble.right")!),
            installationViewController(rootViewController: profileVC.viewController, title: "Профиль", image: UIImage(systemName: "person")!)
        ]
        
        // View
        
        tabBar.tintColor = .systemPink
        
    }
    func logout() {
         
    }
    func show_alert(alert: UIAlertController) {
         
    }
    
}
