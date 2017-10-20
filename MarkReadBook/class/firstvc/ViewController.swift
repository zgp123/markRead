//
//  ViewController.swift
//  MarkReadBook
//
//  Created by a on 2017/10/13.
//  Copyright © 2017年 良医. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: RootViewController,UITableViewDataSource,UITableViewDelegate {

    var tableView : UITableView!
    var addButton : UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.leftBarButtonItem = nil
    }

    override func initView() {
        self.title = "读书在记"
        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 100
        tableView.sectionFooterHeight = 0.5
        tableView.sectionHeaderHeight = 1
        tableView.tableFooterView = UIView()  
        
        self.tableView.register(DisplayCell.self, forCellReuseIdentifier: "tableViewcell")
        self.view.addSubview(tableView)
        
        addButton = UIButton(type:.custom)
        addButton.backgroundColor = UIColor.init(red: 227/255, green: 28/255, blue: 35/255, alpha: 1)
        addButton.layer.cornerRadius = 30
        addButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        addButton.setTitle("添加", for: .normal)
        addButton.addTarget(self, action: #selector(addButtonClick), for: .touchUpInside)
        self.view.addSubview(addButton)
    }
    
    override func layoutView() {
        tableView.snp.makeConstraints { (make) in
            if #available(iOS 11.0, *) {
                make.edges.equalTo(self.view.safeAreaInsets)
            } else {
                // Fallback on earlier versions
                make.edges.equalTo(self.view)
            };
        }
        
        addButton.snp.makeConstraints { (make) in
            make.width.height.equalTo(60)
            make.right.equalTo(-30)
            make.bottom.equalTo(-80)
        }
    }
    
    @objc func addButtonClick() {
        self.navigationController?.pushViewController(DisplayViewController(), animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:DisplayCell! = tableView.dequeueReusableCell(withIdentifier: "tableViewcell") as! DisplayCell
        
//        cell?.textLabel?.text = "djakaaaaaaaa"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated:false)
    }
    
    
}

