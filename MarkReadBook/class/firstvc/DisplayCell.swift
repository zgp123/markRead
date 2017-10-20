//
//  DisplayCell.swift
//  MarkReadBook
//
//  Created by a on 2017/10/17.
//  Copyright © 2017年 良医. All rights reserved.
//

import UIKit

class DisplayCell: BaseCell {

    var bookName:UILabel!
    var bookPic:UIImageView!
    var authorName:UILabel!
    var statue:UILabel!
    var pages:UILabel!
    var progress:UIProgressView!
    

    override func setUpUI()  {
        
        bookPic = UIImageView()
        bookPic?.backgroundColor = UIColor.gray
        bookPic?.image = UIImage.init(named: "hello")
        
        self.addSubview(bookPic)
        
        bookName = UILabel()
        bookName?.font = UIFont.systemFont(ofSize: 16)
        bookName?.textColor = UIColor.black
        bookName?.text = "西游记"
        
        self.addSubview(bookName)
        
        authorName = UILabel()
        authorName.text = "罗贯中"
        authorName.font = UIFont.systemFont(ofSize: 16)
        
        self.addSubview(authorName)
        
        statue = UILabel()
        statue.text = "在读"
        statue.font = UIFont.systemFont(ofSize: 16)
        
        self.addSubview(statue)
        
        pages = UILabel()
        pages.text = "10/60"
        pages.font = UIFont.systemFont(ofSize: 14)
        
        self.addSubview(pages)
        
        progress = UIProgressView()
        progress.trackTintColor = UIColor.init(red: 216/255, green: 216/255, blue: 216/255, alpha: 1)
        progress.progressTintColor = UIColor.init(red: 227/255, green: 28/255, blue: 35/255, alpha: 1)
        progress.progress = 0.5
        progress.layer.cornerRadius = 5
        progress.clipsToBounds = true
        
        self.addSubview(progress)
    }

    override func layoutView() {
        bookPic.snp.makeConstraints { (make) in
            make.left.equalTo(10)
            make.width.equalTo(50)
            make.height.equalTo(80)
            make.centerY.equalTo(self.snp.centerY)
        }
        
        bookName.snp.makeConstraints { (make) in
            make.left.equalTo(self.bookPic.snp.right).offset(10)
            make.top.equalTo(self.bookPic.snp.top)
        }
        
        authorName.snp.makeConstraints { (make) in
            make.left.equalTo(self.bookPic.snp.right).offset(10)
            make.top.equalTo(self.bookName.snp.bottom).offset(10)
        }
        
        statue.snp.makeConstraints { (make) in
            make.top.equalTo(self.bookPic.snp.top)
            make.right.equalTo(-10)
        }
        
        pages.snp.makeConstraints { (make) in
            make.right.equalTo(-10)
            make.top.equalTo(self.statue.snp.bottom).offset(10)
        }
        
        progress.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.bookPic.snp.bottom)
            make.right.equalTo(-10)
            make.height.equalTo(10)
            make.left.equalTo(self.bookPic.snp.right).offset(6)
        }
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
