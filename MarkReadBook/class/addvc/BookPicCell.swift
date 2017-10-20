//
//  BookPicCell.swift
//  MarkReadBook
//
//  Created by a on 2017/10/19.
//  Copyright © 2017年 良医. All rights reserved.
//

import UIKit

class BookPicCell: BaseCell {

    var bgPic:UIImageView!
    var subTitle:UILabel!
    
    override func setUpUI() {
        
        self.selectionStyle = .none
        bgPic = UIImageView.init()
        bgPic.backgroundColor = UIColor.gray
        self.addSubview(bgPic)
        
        subTitle = UILabel()
        subTitle.font = UIFont.systemFont(ofSize: 14)
        subTitle.text = "封面"
        self.addSubview(subTitle)
        
    }
    
    override func layoutView() {
        bgPic.snp.makeConstraints { (make) in
            make.left.equalTo(10)
            make.top.equalTo(10)
            make.bottom.equalTo(-10)
            make.width.equalTo(bgPic.snp.height).multipliedBy(5.0/7.0)
        }
        
        subTitle.snp.makeConstraints { (make) in
            make.right.equalTo(-10)
            make.centerY.equalTo(self.snp.centerY)
        }
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
