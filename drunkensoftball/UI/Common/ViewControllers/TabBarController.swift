//
//  TabBarController.swift
//  drunkensoftball
//
//  Created by Miles Ressler on 2/2/17.
//  Copyright © 2017 Miles Ressler. All rights reserved.
//

import Foundation
import FontAwesome_swift

class TabBarController: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.view.backgroundColor = .white
        self.tabBar.isTranslucent = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let homeTab = UINavigationController(rootViewController: HomeViewController())
        let homeTabItem = UITabBarItem(title: "Home", image: faImage(icon: .home), selectedImage: faImage(icon: .home))
        homeTab.tabBarItem = homeTabItem
        
        let profileTab = UINavigationController(rootViewController: ProfileViewController())
        let profileTabItem = UITabBarItem(title: "Profile", image: faImage(icon: .user), selectedImage: faImage(icon: .user))
        profileTab.tabBarItem = profileTabItem

        self.viewControllers = [homeTab, profileTab]
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        
    }
    
    func faImage(icon: FontAwesome) -> UIImage {
        return UIImage.fontAwesomeIcon(name: icon, textColor: .lightGray , size: CGSize(width: 30, height: 30))
    }
    
}
