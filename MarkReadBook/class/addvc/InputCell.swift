//
//  InputCell.swift
//  MarkReadBook
//
//  Created by a on 2017/10/20.
//  Copyright © 2017年 良医. All rights reserved.
//

import UIKit

class InputCell: BaseCell {

    var inputTextFiled: UITextField!
    override func setUpUI() {
        self.selectionStyle = .none
        inputTextFiled = UITextField()
        inputTextFiled.font = UIFont.systemFont(ofSize: 14)
        inputTextFiled.textColor = UIColor.gray
        self.addSubview(inputTextFiled)
    }
    
    override func layoutView() {
        inputTextFiled.placeholder = "请输入"
        inputTextFiled.snp.makeConstraints { (make) in
            make.left.equalTo(15)
            make.right.equalTo(-15)
            make.centerY.equalTo(self.snp.centerY)
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
