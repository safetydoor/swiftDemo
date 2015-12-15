//
//  FuckViewController.swift
//  testswift
//
//  Created by laps on 15/12/15.
//  Copyright © 2015年 laps. All rights reserved.
//

import UIKit

class FuckViewController: BaseGirlViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func getUrl() -> String {
        return "http://image.baidu.com/search/avatarjson?tn=resultjsonavatarnew&ie=utf-8&word=%E4%BA%9A%E6%B4%B2%E7%BE%8E%E5%9B%BE&cg=girl&pn=\(pageSize * page)&rn=\(pageSize)&itg=0&z=0&fr=&width=&height=&lm=-1&ic=0&s=0&st=-1&gsm=e9070000f0";
    }
    
}
