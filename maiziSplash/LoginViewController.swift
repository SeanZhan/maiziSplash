//
//  LoginViewController.swift
//  maiziSplash
//
//  Created by 湛礼翔 on 15/10/13.
//  Copyright © 2015年 湛礼翔. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
  
  @IBOutlet var poneNumberFelid: UITextField!
  @IBOutlet var captchaFelid: UITextField!
  @IBOutlet var dealLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  //MARK: - 一个设置视图的函数
  func setupView(){
    //设定边框
    poneNumberFelid.layer.borderWidth = 1.0
    poneNumberFelid.layer.borderColor = UIColor(red: 221/255,
                                              green: 221/255,
                                               blue: 221/255,
                                              alpha: 1.0).CGColor
    captchaFelid.layer.borderWidth = 1.0
    captchaFelid.layer.borderColor = UIColor(red: 221/255,
                                           green: 221/255,
                                            blue: 221/255,
                                           alpha: 1.0).CGColor
    
    //设定leftView
    let poneLeftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 1))
    poneNumberFelid.leftView = poneLeftView
    poneNumberFelid.leftViewMode = .Always
    
    let captchaLeftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 1))
    captchaFelid.leftView = captchaLeftView
    captchaFelid.leftViewMode = .Always
    //设定dealLabel
    dealLabel.adjustsFontSizeToFitWidth = true
  }
  
  //MARK: - loninButton点击事件
  @IBAction func loginButtonClick(sender: UIButton) {
    let vc = self.storyboard?.instantiateViewControllerWithIdentifier("tabBarController")
    navigationController?.pushViewController(vc!, animated: true)
    let userPoneNumber = poneNumberFelid.text
    guard (poneNumberFelid.text == "")
      else{
        NSUserDefaults.standardUserDefaults().setValue(userPoneNumber, forKey: "userPoneNumber")
        return
    }
  }
}
