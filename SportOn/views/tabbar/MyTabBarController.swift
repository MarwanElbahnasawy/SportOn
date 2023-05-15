//
//  MyTabBarController.swift
//  SportOn
//
//  Created by Marwan Elbahnasawy on 15/05/2023.
//

import UIKit

class MyTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if UIDevice.current.userInterfaceIdiom == .pad{
            if let firstTabBarItem = tabBar.items?[0]{
                firstTabBarItem.image = UIImage(named: "scoreboardTabBarPad")
            }
            
            if let secondTabBarItem = tabBar.items?[1] {
                secondTabBarItem.image = UIImage(named: "favoritesTabBarPad")
            }
        }
        
        
    }
    
    
}
