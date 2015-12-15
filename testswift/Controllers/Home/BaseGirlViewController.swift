//
//  BaseGirlViewController.swift
//  testswift
//
//  Created by laps on 15/12/15.
//  Copyright © 2015年 laps. All rights reserved.
//

import UIKit
import Alamofire
import KFSwiftImageLoader

class BaseGirlViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var page = 0;
    var girlList: NSMutableArray = []
    var girlTableView: UITableView?
    var refreshControl: ODRefreshControl?
    let pageSize = 20
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        self.girlTableView = UITableView(frame: CGRectMake(0, 20, self.view.bounds.size.width, self.view.bounds.size.height - 69))
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
        cell.girlImageView?.image = nil
        cell.girlImageView?.loadImageFromURLString(girl.pic!, placeholderImage: nil, completion: {finished, error in
            print("error : \(error)")
        })
        print("girl.pic : \(girl.pic)")
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        let model = self.girlList.objectAtIndex(indexPath.row)
        var height = CGFloat((model as! GirlModel).height!)
        let width = CGFloat((model as! GirlModel).width!)
        if width > self.view.bounds.width{
            height = self.view.bounds.width * height / width
        }
        print("pic : \(model.title)  height : \(height)")
        return height
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
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
                    let imgs = JSON.valueForKey("imgs") as! NSArray
                    for item in imgs{
                        let gril = GirlModel()
                        print(item)
                        gril.title = item.objectForKey("fromPageTitle") as? String
                        gril.pic = item.objectForKey("objURL") as? String
                        gril.width = item.objectForKey("width") as? Int
                        gril.height = item.objectForKey("height") as? Int
                        self.girlList.insertObject(gril, atIndex: 0)
                    }
                    self.refreshControl?.endRefreshing()
                    self.girlTableView?.reloadData()
                }
        }
    }
    
    func getUrl() ->String{
        return "http://image.baidu.com/search/avatarjson?tn=resultjsonavatarnew&ie=utf-8&word=%E7%BE%8E%E5%A5%B3&cg=girl&pn=\(pageSize * page)&rn=\(pageSize)&itg=0&z=0&fr=&width=&height=&lm=-1&ic=0&s=0&st=-1&gsm=e9070000f0";
    }

}
