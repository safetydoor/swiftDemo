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
        
        //美女
        //return "http://image.baidu.com/search/avatarjson?tn=resultjsonavatarnew&ie=utf-8&word=%E8%90%8C%E5%A6%B9%E5%AD%90&cg=girl&pn=\(pageSize * page)&rn=\(pageSize)&itg=0&z=0&fr=&width=&height=&lm=-1&ic=0&s=0&st=-1&gsm=e9070000f0";
        //萌宠
        
        return "http://image.baidu.com/search/acjson?tn=resultjson_com&ipn=rj&ct=201326592&is=&fp=result&queryWord=%E5%AE%A0%E7%89%A9&cl=2&lm=-1&ie=utf-8&oe=utf-8&adpicid=&st=-1&z=&ic=0&word=%E5%AE%A0%E7%89%A9&s=&se=&tab=&width=&height=&face=0&istype=2&qc=&nc=1&fr=&pn=\(pageSize * page)&rn=\(pageSize)&gsm=78&1452067235633=";
        //return "http://image.baidu.com/search/avatarjson?tn=resultjsonavatarnew&ie=utf-8&word=%E5%AE%A0%E7%89%A9&cg=%E5%AE%A0%E7%89%A9&pn=\(pageSize * page)&rn=\(pageSize)&itg=0&z=0&fr=&width=&height=&lm=-1&ic=0&s=0&st=-1&gsm=e9070000f0";
    }
}
