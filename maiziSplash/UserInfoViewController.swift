//
//  UserInfoViewController.swift
//  maiziSplash
//
//  Created by zhan on 15/11/16.
//  Copyright © 2015年 湛礼翔. All rights reserved.
//

import UIKit

class UserInfoViewController: UIViewController {
  
  @IBOutlet var surNameTextFeild: UITextField!
  
  @IBOutlet var poneNumberTextFeild: UITextField!
  
  @IBOutlet var sexChooseBackgurondView: UIView!
  
  @IBOutlet var areaTextFeild: UITextField!
  
  @IBOutlet var communityTextFeild: UITextField!
  
  @IBOutlet var buildingTextFeild: UITextField!
  
  var sexChooseBar: ClothesChooseBar?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setUI()
    
    sexChooseBar?.delegate = self
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  //MARK: - 设置UI
  private func setUI() {
    //设置surNameTextFeild
    surNameTextFeild.layer.borderColor = UIColor.borderColor().CGColor
    surNameTextFeild.layer.borderWidth = 1.0
    surNameTextFeild.placeholder = "  请输入姓氏"
    
    let surNameLeftView = UIView(frame: CGRect(x: 0,
                                               y: 20,
                                           width: (surNameTextFeild.frame.height - 25) * 0.7 + 10,
                                          height: surNameTextFeild.frame.height - 25))
    
    surNameTextFeild.leftViewMode = .Always
    surNameTextFeild.leftView = surNameLeftView
    
    let surNameLeftImage = UIImageView(frame: CGRect(x: 10,
                                                     y: 0,
                                                 width: surNameLeftView.frame.width - 10,
                                                 height: surNameLeftView.frame.height))
    
    surNameLeftImage.image = UIImage(named: "8-1")
    surNameLeftView.addSubview(surNameLeftImage)
    
    
    //设置poneNumberTextFeild
    poneNumberTextFeild.layer.borderColor = UIColor.borderColor().CGColor
    poneNumberTextFeild.layer.borderWidth = 1.0
    poneNumberTextFeild.placeholder = "  请输入手机号码"
    
    let poneNumberLeftView =  UIView(frame: CGRect(x: 0,
                                                   y: 20,
                                               width: (poneNumberTextFeild.frame.height - 25) * 0.7 + 10,
                                              height: poneNumberTextFeild.frame.height - 25))
    
    poneNumberTextFeild.leftViewMode = .Always
    poneNumberTextFeild.leftView = poneNumberLeftView
    
    let poneNumberLeftImage = UIImageView(frame: CGRect(x: 10,
                                                     y: 0,
                                                 width: poneNumberLeftView.frame.width - 10,
                                                height: poneNumberLeftView.frame.height))
    
    poneNumberLeftImage.image = UIImage(named: "9-1")
    poneNumberLeftView.addSubview(poneNumberLeftImage)
    
    //设置areaTextFeild
    areaTextFeild.layer.borderColor = UIColor.borderColor().CGColor
    areaTextFeild.layer.borderWidth = 1.0
    let areaTextFeildLeftView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: areaTextFeild.frame.height))
    areaTextFeild.leftView = areaTextFeildLeftView
    areaTextFeild.leftViewMode = .Always
    
    let areaTextFeildLeftLabel = UILabel(frame: CGRect(x: 10, y: 0, width: 30, height: areaTextFeild.frame.height))
    areaTextFeildLeftView.addSubview(areaTextFeildLeftLabel)
    areaTextFeildLeftLabel.text = "区"
    areaTextFeildLeftLabel.textAlignment = .Center
    
    //设置communityTextFeild
    communityTextFeild.layer.borderColor = UIColor.borderColor().CGColor
    communityTextFeild.layer.borderWidth = 1.0
    let communityTextFeildLeftView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: communityTextFeild.frame.height))
    communityTextFeild.leftView = communityTextFeildLeftView
    communityTextFeild.leftViewMode = .Always
    
    let communityTextFeildLeftLabel = UILabel(frame: CGRect(x: 10, y: 0, width: 40, height: communityTextFeild.frame.height))
    communityTextFeildLeftView.addSubview(communityTextFeildLeftLabel)
    communityTextFeildLeftLabel.text = "小区"
    communityTextFeildLeftLabel.textAlignment = .Center
    
    //设置buildingTextFeild
    buildingTextFeild.layer.borderColor = UIColor.borderColor().CGColor
    buildingTextFeild.layer.borderWidth = 1.0
    let buildingTextFeildLeftView = UIView(frame: CGRect(x: 0, y: 0, width: 80, height: communityTextFeild.frame.height))
    buildingTextFeild.leftView = buildingTextFeildLeftView
    buildingTextFeild.leftViewMode = .Always
    
    let buildingTextFeildLeftLabel = UILabel(frame: CGRect(x: 10, y: 0, width: 70, height:  buildingTextFeild.frame.height))
    buildingTextFeildLeftView.addSubview(buildingTextFeildLeftLabel)
    buildingTextFeildLeftLabel.text = "详细地址"
    buildingTextFeildLeftLabel.textAlignment = .Center
    
    //设置性别选择按钮
    sexChooseBar = ClothesChooseBar(frame: CGRect(x: 0,
                                                      y: 0,
                                                  width: sexChooseBackgurondView.frame.width,
                                                 height: sexChooseBackgurondView.frame.height),
                                  buttonArray: ["先生","女士"])
    sexChooseBackgurondView.addSubview(sexChooseBar!)
  }
  
  //MARK: - 背景View的点击事件
  @IBAction func backgroundClick(sender: UIControl) {
    surNameTextFeild.resignFirstResponder()
    poneNumberTextFeild.resignFirstResponder()
    areaTextFeild.resignFirstResponder()
    communityTextFeild.resignFirstResponder()
    buildingTextFeild.resignFirstResponder()
  }
  
  //MARK: - 保存按钮点击事件
  @IBAction func saveButtonClick(sender: UIButton) {
  }
  
  //返回按钮点击事件
  @IBAction func backButtonClick(sender: UIButton) {
    self.navigationController?.popViewControllerAnimated(true)
  }
}

//MARK: - ClothesChooseBarDelegate
extension UserInfoViewController: ClothesChooseBarDelegate {
  
  func didSelectButton(numbel: Int) {
    if numbel == 0 {
      print("sir")
    }else {
      print("lady")
    }
  }
}
