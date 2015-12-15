//
//  CustomTabBarController.swift
//  testswift
//
//  Created by laps on 15/12/9.
//  Copyright © 2015年 laps. All rights reserved.
//

import UIKit

class CustomTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.tintColor = UIColor.redColor()
        self.tabBar(self.tabBar, didSelectItem: (self.tabBar.items?.first)!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tabBar(tabBar: UITabBar, didSelectItem item: UITabBarItem) {
        switch item.tag {
        case 0:
            self.navigationItem.title = "1111111111"
        case 1:
            self.navigationItem.title = "2222222222"
        default:
            self.navigationItem.title = "3333333333"
        }
        
    }
    
}
