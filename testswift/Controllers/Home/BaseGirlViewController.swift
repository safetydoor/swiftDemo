//
//  BaseGirlViewController.swift
//  testswift
//
//  Created by laps on 15/12/15.
//  Copyright © 2015年 laps. All rights reserved.
//

import UIKit
import Alamofire

class BaseGirlViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var page = 0;
    var girlList: NSMutableArray = []
    var girlTableView: UITableView?
    var refreshControl: ODRefreshControl?
    let pageSize = 60
    
    /**
     statusbar : 20 naviBar : 44  tabbar : 49
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        
        self.girlTableView = UITableView(frame: CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height - 50))
        self.girlTableView?.delegate = self;
        self.girlTableView?.dataSource = self;
        self.girlTableView?.registerClass(GirlCell.self, forCellReuseIdentifier: "GirlCell")
        self.girlTableView?.separatorStyle = UITableViewCellSeparatorStyle.None
        self.view.addSubview(self.girlTableView!)
        self.refreshControl = ODRefreshControl(inScrollView: self.girlTableView)
        self.refreshControl!.addTarget(self, action: "dropViewDidBeginRefreshing:", forControlEvents: UIControlEvents.ValueChanged)
        self.loadData()
    }
    
    func dropViewDidBeginRefreshing(refreshControl: ODRefreshControl)
    {
        page = page + 1
        self.refreshControl?.beginRefreshing()
        self.loadData()
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let girl = self.girlList.objectAtIndex(indexPath.row) as! GirlModel
        let cell = tableView.dequeueReusableCellWithIdentifier("GirlCell", forIndexPath: indexPath) as! GirlCell;
        cell.titleLabel?.text = girl.title
        cell.setImageUrl(girl.pic!)
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        let model = self.girlList.objectAtIndex(indexPath.row)
        var height = CGFloat((model as! GirlModel).height!)
        let width = CGFloat((model as! GirlModel).width!)
        if width > self.view.bounds.width{
            height = self.view.bounds.width * height / width
        }
        return height
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("section : \(section) , count : \(self.girlList.count)")
        return self.girlList.count
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadData(){
        let url = self.getUrl()
        print("request url : \(url)")
        Alamofire.request(.GET, url)
            .responseJSON { response in
                //print(response.request)  // original URL request
                //print(response.response) // URL response
                //print(response.data)     // server data
                //print(response.result)   // result of response serialization
                
                if let JSON = response.result.value {
                    let value = JSON.valueForKey("data")
                    if (value != nil) {
                        let imgs = value as! NSArray
                        for item in imgs{
                            let girl = GirlModel()
                            girl.title = item.objectForKey("fromPageTitle") as? String
                            girl.pic = item.objectForKey("hoverURL") as? String
                            girl.width = item.objectForKey("width") as? Int
                            girl.height = item.objectForKey("height") as? Int
                            if (girl.title == nil || girl.pic == nil) {
                                continue;
                            }
                            do{
                                let regular = try NSRegularExpression(pattern: "<strong>.*?</strong>", options: NSRegularExpressionOptions.CaseInsensitive)
                                girl.title = regular.stringByReplacingMatchesInString(girl.title!, options: NSMatchingOptions.ReportCompletion, range: NSMakeRange(0, girl.title!.characters.count), withTemplate: "");
                            }catch{
                                print(error)
                            }
                            self.girlList.insertObject(girl, atIndex: 0)
                            print("GirlModel : title : \(girl.title), url : \(girl.pic)")
                        }
                        self.refreshControl?.endRefreshing()
                        self.girlTableView?.reloadData()
                    }
                }
        }
    }
    
    func getUrl() ->String{
        return "http://image.baidu.com/search/avatarjson?tn=resultjsonavatarnew&ie=utf-8&word=%E7%BE%8E%E5%A5%B3&cg=%E7%BE%8E%E5%A5%B3&pn=\(pageSize * page)&rn=\(pageSize)&itg=0&z=0&fr=&width=&height=&lm=-1&ic=0&s=0&st=-1&gsm=e9070000f0";
    }

}
