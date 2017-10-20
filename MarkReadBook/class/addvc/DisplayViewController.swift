//
//  DisplayViewController.swift
//  MarkReadBook
//
//  Created by a on 2017/10/18.
//  Copyright © 2017年 良医. All rights reserved.
//

import UIKit

class DisplayViewController: RootViewController,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    let tableView:UITableView! = UITableView()
    var model:BookModel! = BookModel()
    let addButton:UIButton = UIButton(type: .custom)
    
    var ploceArray:NSArray = ["请输入书名","请输入总页数","请输入作者名","请输入译者名","请输入出版社名","请输入发行时间"]
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false
        model = BookModel()
    }

    override func initView() {
        
        self.title = "添加"
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.sectionFooterHeight = 0.5
        tableView.sectionHeaderHeight = 1
        tableView.tableFooterView = UIView()
        self.tableView.register(InputCell.self, forCellReuseIdentifier: "InputCell")
        self.view.addSubview(tableView)
        
        addButton.backgroundColor = UIColor.init(red: 227/255, green: 28/255, blue: 35/255, alpha: 1)
        addButton.setTitle("保存", for: .normal)
        addButton.addTarget(self, action: #selector(addButtonClick), for: .touchUpInside)
        self.view.addSubview(addButton)
    }
    
    @objc func addButtonClick() {
        // 更新读书进度
    }
    
    override func layoutView() {
        tableView.snp.makeConstraints { (make) in
            if #available(iOS 11.0, *) {
                make.edges.equalTo(self.view.safeAreaInsets)
            } else {
                make.left.right.bottom.equalTo(0)
                make.top.equalTo(64)
            };
        }
        
        addButton.snp.makeConstraints { (make) in
            make.height.equalTo(45)
            make.right.left.equalTo(0)
            make.bottom.equalTo(0)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 80
        }
        else {
            return 50
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = BookPicCell.init(style: .default, reuseIdentifier: "")
            
            return cell
            
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "InputCell") as! InputCell
            cell.inputTextFiled.delegate = self
            cell.inputTextFiled.placeholder = ploceArray[indexPath.row-1] as? String
        
            cell.inputTextFiled.tag = 1000+indexPath.row
            
            if indexPath.row == 2 || indexPath.row == 6 {
                cell.inputTextFiled.keyboardType = .numberPad
            }
            
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
    
            let sheet:UIAlertController = UIAlertController.init(title: nil, message: nil, preferredStyle: .actionSheet)
            let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
            let okAction = UIAlertAction(title: "相册", style: .default, handler:{
                (UIAlertAction) -> Void in
                self.fromAlbum(0)
            })
            let buml = UIAlertAction(title: "相机", style: .default, handler:{
                (UIAlertAction) -> Void in
                self.fromAlbum(1)
            })
            
            sheet.addAction(cancelAction)
            sheet.addAction(okAction)
            sheet.addAction(buml)
            self.present(sheet, animated: true, completion: nil)
            
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.tag == 1001 {
            model.bookName = textField.text!
        }
        else if textField.tag == 1002 {
            model.countPage = textField.text!
        }
        else if textField.tag == 1003 {
            model.author = textField.text!
        }
        else if textField.tag == 1004 {
            model.translator = textField.text!
        }
        else if textField.tag == 1005 {
            model.publish = textField.text!
        }
        else if textField.tag == 1006 {
            model.publishDate = textField.text!
        }
    }
    
    func fromAlbum(_ type:NSInteger) {
        //判断设置是否支持图片库
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            //初始化图片控制器
            let picker = UIImagePickerController()
            //设置代理
            picker.delegate = self as UIImagePickerControllerDelegate & UINavigationControllerDelegate
            //指定图片控制器类型
            if type == 0 {
                 picker.sourceType = UIImagePickerControllerSourceType.photoLibrary
            }
            else if type == 1 {
                 picker.sourceType = UIImagePickerControllerSourceType.camera
            }
           
            //设置是否允许编辑
            picker.allowsEditing = false
            //弹出控制器，显示界面
            self.present(picker, animated: true, completion: {
                () -> Void in
            })
        }else{
            let alter:UIAlertController! = UIAlertController.init(title: "提示", message: "请前往设置打开相册权限", preferredStyle: .alert)
            self.present(alter, animated: true, completion: {
                
            })
            
        }
        
    }
    
    //选择图片成功后代理
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [String : Any]) {
        //查看info对象
        print(info)
        
        //显示的图片
        let image:UIImage!
        
        image = info[UIImagePickerControllerOriginalImage] as! UIImage
        let cell:BookPicCell = self.tableView.cellForRow(at: IndexPath.init(row: 0, section: 0)) as! BookPicCell

        cell.bgPic.image = image
        //图片控制器退出
        picker.dismiss(animated: true, completion: {
            () -> Void in
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
