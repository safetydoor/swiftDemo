//
//  HipViewController.swift
//  testswift
//
//  Created by laps on 15/12/15.
//  Copyright © 2015年 laps. All rights reserved.
//

import UIKit

class HipViewController: BaseGirlViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func getUrl() -> String {
        //return "http://image.baidu.com/search/avatarjson?tn=resultjsonavatarnew&ie=utf-8&word=%E7%BF%98%E8%87%80&cg=girl&pn=\(pageSize * page)&rn=\(pageSize)&itg=0&z=0&fr=&width=&height=&lm=-1&ic=0&s=0&st=-1&gsm=e9070000f0";
        return "http://image.baidu.com/search/acjson?tn=resultjson_com&ipn=rj&ct=201326592&is=&fp=result&queryWord=gif&cl=2&lm=-1&ie=utf-8&oe=utf-8&adpicid=&st=-1&z=&ic=0&word=gif&s=&se=&tab=&width=&height=&face=0&istype=2&qc=&nc=1&fr=&pn=\(pageSize * page)&rn=\(pageSize)&gsm=78&1452074785227="
    }
    
}
