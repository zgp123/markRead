//
//  RootViewController.swift
//  MarkReadBook
//
//  Created by a on 2017/10/19.
//  Copyright © 2017年 良医. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let backItem = UIBarButtonItem.init(image: UIImage.init(named: "back_normal"), style: .plain, target: self, action: #selector(back))
        
        self.navigationItem.leftBarButtonItem = backItem
        self.navigationItem.leftBarButtonItem?.tintColor = UIColor.gray
        self.automaticallyAdjustsScrollViewInsets = true
        
        self.initView()
        self.layoutView()
    }

    func initView() {
        
    }
    
    func layoutView() {
        
    }
    
    @objc public func back() {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
