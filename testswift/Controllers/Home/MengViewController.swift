//
//  MengViewController.swift
//  testswift
//
//  Created by laps on 15/12/9.
//  Copyright © 2015年 laps. All rights reserved.
//

import UIKit

class MengViewController: BaseGirlViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func getUrl() -> String {
        return "http://image.baidu.com/search/avatarjson?tn=resultjsonavatarnew&ie=utf-8&word=%E8%90%8C%E5%A6%B9%E5%AD%90&cg=girl&pn=\(pageSize * page)&rn=\(pageSize)&itg=0&z=0&fr=&width=&height=&lm=-1&ic=0&s=0&st=-1&gsm=e9070000f0";
    }
}
