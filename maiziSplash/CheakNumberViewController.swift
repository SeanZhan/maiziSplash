//
//  CheakNumberViewController.swift
//  maiziSplash
//
//  Created by zhan on 15/11/11.
//  Copyright © 2015年 湛礼翔. All rights reserved.
//

import UIKit
import SnapKit

class CheakNumberViewController: UIViewController {
  
  private var navigationBar = UIView(frame: CGRectZero)
  private var backButton = UIButton(frame: CGRectZero)
  private var navigationBarTitle = UILabel(frame: CGRectZero)
  private var textField = UITextField(frame: CGRectZero)
  private var makeSureButton = UIButton(frame: CGRectZero)
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  //MARK: - 设定UI
  func setupUI() {
    
    self.view.backgroundColor = UIColor.grayBackgroundColor()
    
    //给背景添加一个点按手势
    let gustrue = UITapGestureRecognizer(target: self, action: "backgroundClick")
    self.view.addGestureRecognizer(gustrue)
    
    //写入navigationBar的约束
    self.view.addSubview(navigationBar)
    navigationBar.backgroundColor = UIColor.whiteColor()

    navigationBar.snp_makeConstraints(closure: { (make) -> Void in
      make.leading.trailing.top.equalTo(self.view)
      make.height.equalTo(64)
    })
    
    //写入backButton的约束
    navigationBar.addSubview(backButton)
    backButton.addTarget(self, action: "backButtonClick", forControlEvents: .TouchUpInside)
    backButton.setImage(UIImage(named: "1-1"), forState: .Normal)
    
    backButton.snp_makeConstraints { (make) -> Void in
      make.height.width.equalTo(44)
      make.leading.bottom.equalTo(navigationBar)
    }
    
    //写入navigationBarTitle的约束
    navigationBar.addSubview(navigationBarTitle)
    navigationBarTitle.text = "优惠码"
    navigationBarTitle.font = UIFont(name: "Heiti SC", size: 17)
    navigationBarTitle.sizeToFit()
    
    navigationBarTitle.snp_makeConstraints { (make) -> Void in
      make.centerX.equalTo(self.view)
      make.centerY.equalTo(backButton)
    }
    
    //写入textField的约束
    self.view.addSubview(textField)
    textField.backgroundColor = UIColor.whiteColor()
    textField.layer.borderWidth = 1.0
    textField.layer.borderColor = UIColor.borderColor().CGColor
    textField.placeholder = "    请输入优惠序号"
    
    textField.snp_makeConstraints { (make) -> Void in
      make.leading.trailing.equalTo(self.view).inset(15)
      make.top.equalTo(navigationBar.snp_bottom).offset(20)
      make.height.equalTo(self.view.snp_height).multipliedBy(0.0883)
    }
    
    //写入makeSureButton的约束
    self.view.addSubview(makeSureButton)
    makeSureButton.backgroundColor = UIColor.mianBlue()
    makeSureButton.setTitle("确定", forState: .Normal)
    makeSureButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
    makeSureButton.titleLabel?.font = UIFont(name: "Heiti SC", size: 17)
    makeSureButton.showsTouchWhenHighlighted = true
    
    makeSureButton.snp_makeConstraints { (make) -> Void in
      make.leading.trailing.height.equalTo(textField)
      make.top.equalTo(textField.snp_bottom).offset(30)
    }
  }
  
  //MARK: - backButton的点击事件
  func backButtonClick() {
    self.navigationController?.popViewControllerAnimated(true)
  }
  
  //MARK: 背景的点击事件
  func backgroundClick() {
    textField.resignFirstResponder()
  }
}
