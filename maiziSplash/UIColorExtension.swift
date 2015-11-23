//
//  UIColorExtension.swift
//  maiziSplash
//
//  Created by zhan on 15/11/18.
//  Copyright © 2015年 湛礼翔. All rights reserved.
//

import Foundation

extension UIColor{
  //app中的#f4f4f4灰色背景
  class func grayBackgroundColor() -> UIColor {
    return UIColor(red: 244 / 250, green: 244 / 250, blue: 244 / 250, alpha: 1.0)
  }
  
  //app中#dddddd边框线条色
  class func borderColor() -> UIColor {
    return UIColor(red: 221 / 255, green: 221 / 255, blue: 221 / 255, alpha: 1.0)
  }
  
  //app中的#28ccfc蓝色
  class func mianBlue() -> UIColor {
    return UIColor(red: 40 / 255, green: 204 / 255, blue: 252 / 255, alpha: 1.0)
  }
  
  //app中价格字体颜色#ff4d0f
  class func priceRed() -> UIColor {
    return UIColor(red: 255 / 255, green: 77 / 255, blue: 15 / 255, alpha: 1.0)
  }
  
}

