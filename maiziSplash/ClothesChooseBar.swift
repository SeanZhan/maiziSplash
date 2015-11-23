//
//  ClothesChooseView.swift
//  maiziSplash
//
//  Created by zhan on 15/11/6.
//  Copyright © 2015年 湛礼翔. All rights reserved.
//

import UIKit

protocol ClothesChooseBarDelegate {
  func didSelectButton(numbel: Int)
}

class ClothesChooseBar: UIView {
  
  var buttonArray: [String]?
  var vernierView: UIView?
  var delegate: ClothesChooseBarDelegate?
  
  var buttonNumbel:Int = 0 {
    willSet {
      let button = self.subviews[newValue] as! UIButton
      button.setTitleColor(UIColor.mianBlue(), forState: .Normal)
      
      UIView.animateWithDuration(0.1) { () -> Void in
        self.vernierView?.frame.origin.x = CGFloat(newValue) * (self.frame.width / CGFloat((self.buttonArray?.count)!))
      }
    }didSet{
      let button = self.subviews[oldValue] as! UIButton
      button.setTitleColor(UIColor.blackColor(), forState: .Normal)
    }
  }
  
  init(frame: CGRect,buttonArray: [String]){
    super.init(frame: frame)
    self.buttonArray = buttonArray
    setUI()
  }
  
  //MARK: - 设定视图UI
  func setUI(){
    let buttonWidth = frame.width / CGFloat(buttonArray!.count)
    let buttonHeight = frame.height
    //根据需要的button数量，添加button
    for i in 0..<buttonArray!.count {
      let button = UIButton(frame: CGRect(x: buttonWidth * CGFloat(i), y: 0, width: buttonWidth, height: buttonHeight))
      button.setTitle(buttonArray![i], forState: UIControlState.Normal)
      button.setTitleColor(i != 0 ? UIColor.blackColor() : UIColor.mianBlue() , forState: .Normal)
      button.titleLabel?.font = UIFont(name: "Heiti SC", size: 15)
      button.backgroundColor = UIColor.whiteColor()
      
      button.tag = i
      button.addTarget(self, action: "buttonClick:", forControlEvents: .TouchUpInside)
      
      button.layer.borderColor = UIColor.borderColor().CGColor
      button.layer.borderWidth = 1.0
      self.addSubview(button)
    }
    //定义一个游标
    vernierView = UIView(frame: CGRect(x: 0, y: buttonHeight - 5, width: buttonWidth, height: 5))
    vernierView?.backgroundColor = UIColor.mianBlue()
    self.addSubview(vernierView!)
  }
  
  //MARK: - button的委托事件
  func buttonClick(sender: UIButton) {
    self.buttonNumbel = sender.tag
    //将选中的button的tag回传
    delegate?.didSelectButton(sender.tag)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
