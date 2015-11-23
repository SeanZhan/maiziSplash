//
//  addShoopingCartViewController.swift
//  maiziSplash
//
//  Created by zhan on 15/11/7.
//  Copyright © 2015年 湛礼翔. All rights reserved.
//

import UIKit

class addShoopingCartViewController: UIViewController {
  
  var clothesInfo: ClothesInfo?
  var clothesNumbel: Int = 1
  
  @IBOutlet var imageView: UIImageView!
  @IBOutlet var clothesNameLabel: UILabel!
  @IBOutlet var priceLabel: UILabel!
  @IBOutlet var numbelLabel: UILabel!
  @IBOutlet var minimissNumbelButton: UIButton!
  @IBOutlet var addNumbelButton: UIButton!
  @IBOutlet var addShoopingCartButton: UIButton!
  @IBOutlet var unitLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setUI()
    initialize()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  //MARK: - 设置UI
  func setUI(){
    clothesNameLabel.sizeToFit()
    priceLabel.sizeToFit()
    minimissNumbelButton.setBackgroundImage(UIImage(named: "2-2-0"), forState: UIControlState.Highlighted)
    addNumbelButton.setBackgroundImage(UIImage(named: "4-4"), forState: .Highlighted)
    addShoopingCartButton.setBackgroundImage(UIImage(named: "5-5"), forState: .Highlighted)
    
    numbelLabel.text = "1"
    numbelLabel.backgroundColor = UIColor.grayBackgroundColor()
    numbelLabel.layer.borderColor = UIColor.borderColor().CGColor
    numbelLabel.layer.borderWidth = 1.0
  }
  
  //MARK: 用传入的数据对界面进行初始化
  func initialize(){

    imageView.image = clothesInfo!.clothesImage
    clothesNameLabel.text = clothesInfo!.clothesName
    priceLabel.text = "￥\(clothesInfo!.price)"
    if clothesInfo?.clothesType == Type.bag {
      unitLabel.text = "/袋"
      imageView.layer.borderWidth = 1.0
      imageView.layer.borderColor = UIColor(red: 0,
                                          green: 194 / 255,
                                           blue: 171 / 255,
                                          alpha: 1.0).CGColor
      
    }else{
      unitLabel.text = "/件"
      imageView.layer.borderWidth = 1.0
      imageView.layer.borderColor = UIColor.mianBlue().CGColor
    }
  }
  
  //MARK: - “添加到洗衣篮”点击事件
  @IBAction func addShoopingButtonClick(sender: UIButton) {
    
    self.dismissViewControllerAnimated(true, completion: nil)
    
    //将订单信息传到单例的数组中
    OrderCache.sharedInstance.addOrder(ClothesOrder(clothes: clothesInfo!, clothesNumber: clothesNumbel))
  }
  
  //MARK: - “减小”按钮的点击事件
  @IBAction func minimiissNumbelButtonClick(sender: UIButton) {
    if clothesNumbel > 1{
      numbelLabel.text = "\(--clothesNumbel)"
    }else{
      numbelLabel.text = "\(clothesNumbel)"
    }
  }
  
  //MARK: - "增加"按钮的点击事件
  @IBAction func addNumbelButtonClick(sender: UIButton) {
    numbelLabel.text = "\(++clothesNumbel)"
  }
  
  //MARK: - 点击背景的事件
  @IBAction func backgroundClick(sender: UIControl) {
    self.dismissViewControllerAnimated(true, completion: nil)
  }
  
}
