//
//  GirlCell.swift
//  testswift
//
//  Created by laps on 15/12/10.
//  Copyright © 2015年 laps. All rights reserved.
//

import UIKit


class GirlCell: UITableViewCell {
    
    var titleLabel: UILabel?
    var girlImageView: UIImageView?

    override func awakeFromNib()
    {
        super.awakeFromNib()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        titleLabel = UILabel()
        titleLabel?.textColor = UIColor.whiteColor()
        titleLabel?.backgroundColor = UIColor(hue: 0, saturation: 0, brightness: 0, alpha: 0.2)
        titleLabel?.font = UIFont.systemFontOfSize(14)
        titleLabel?.textAlignment = NSTextAlignment.Center
        girlImageView = UIImageView()
        girlImageView?.backgroundColor = UIColor(hue: 0, saturation: 0, brightness: 0, alpha: 0.4)
        print(girlImageView)
        self.addSubview(girlImageView!)
        self.addSubview(titleLabel!)
        self.selectionStyle = UITableViewCellSelectionStyle.None
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        print("self.bounds : \(self.bounds)")
        titleLabel?.frame = CGRectMake(16, self.bounds.height - 60, self.bounds.width - 32, 50)
        girlImageView?.frame = CGRectMake(16, 10, self.bounds.width - 32, self.bounds.height - 10)
    }

}
