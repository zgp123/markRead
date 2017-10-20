//
//  BaseCell.swift
//  MarkReadBook
//
//  Created by a on 2017/10/19.
//  Copyright © 2017年 良医. All rights reserved.
//

import UIKit

class BaseCell: UITableViewCell {

    required init?(coder aDecoder:NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(style:UITableViewCellStyle, reuseIdentifier:String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setUpUI();
        self.layoutView()
    }
    
     func setUpUI() {
        
    }

     func layoutView() {
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
