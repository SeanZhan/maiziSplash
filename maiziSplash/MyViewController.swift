//
//  MyViewController.swift
//  maiziSplash
//
//  Created by 湛礼翔 on 15/10/18.
//  Copyright © 2015年 湛礼翔. All rights reserved.
//

import UIKit

class MyViewController: UIViewController {
  
  @IBOutlet var nameLabel: UILabel!
  @IBOutlet var poneNumberLaber: UILabel!
  @IBOutlet var myIndent: UILabel!
  @IBOutlet var myMoney: UILabel!
  @IBOutlet var myAdress: UILabel!
  @IBOutlet var cheakNumber: UILabel!
  @IBOutlet var shareNumber: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  //MARK: - 设置UI
  func setupView() {
    nameLabel.adjustsFontSizeToFitWidth = true
    poneNumberLaber.adjustsFontSizeToFitWidth = true
    poneNumberLaber.text = NSUserDefaults.standardUserDefaults().valueForKey("userPoneNumber") as? String
    myIndent.adjustsFontSizeToFitWidth = true
    myMoney.adjustsFontSizeToFitWidth = true
    myAdress.adjustsFontSizeToFitWidth = true
    shareNumber.adjustsFontSizeToFitWidth = true
    cheakNumber.adjustsFontSizeToFitWidth = true
  }
  
  //MARK: - “验证优惠码”按钮的点击事件
  
  @IBAction func cheaKNumberButtonClick(sender: AnyObject) {
    let vc = CheakNumberViewController()
    self.navigationController?.pushViewController(vc, animated: true)
  }
}
