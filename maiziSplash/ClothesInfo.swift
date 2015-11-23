//
//  ClothesType.swift
//  maiziSplash
//
//  Created by zhan on 15/11/6.
//  Copyright © 2015年 湛礼翔. All rights reserved.
//

import Foundation
import UIKit

//定义一个衣服类型的枚举，包含单件和袋洗
enum Type {
  case single
  case bag
}

//定义一个衣服季节的枚举
enum Season {
  case springAndFall
  case summer
  case winter
  case leather
  case none
}

struct ClothesInfo {
  
  var clothesName: String!
  
  var price: Int {
    switch clothesName {
      //春秋
    case "T恤":
      return 8
    case "衬衫":
      return 8
    case "短风衣":
      return 12
    case "长风衣":
      return 18
    case "西装":
      return 20
    case "袋洗":
      return 68
      //夏装
    case "鸭舌帽":
      return 10
    case "短衬衫":
      return 8
    case "短裙":
      return 8
    case "长裙":
      return 10
    case "套裙":
      return 12
    case "裤装":
      return 10
      //冬装
    case "保暖衬衫":
      return 12
    case "风衣":
      return 15
    case "狐狸毛领":
      return 15
    case "毛外套":
      return 20
    case "棉服":
      return 20
    case "呢子大衣":
      return 30
    case "睡袍":
      return 30
    case "围巾":
      return 10
    case "羽绒服":
      return 25
      //皮衣
    case "长款皮衣":
      return 40
    case "短款皮衣":
      return 30
      //袋洗
    case "袋洗":
      return 68
    default:
      return 0
    }
    
  }
  
  var clothesImage: UIImage? {
    switch clothesName {
      //春秋
    case "T恤":
      return UIImage(named: "2-3")
    case "衬衫":
      return UIImage(named: "3-3")
    case "短风衣":
      return UIImage(named: "4-3")
    case "长风衣":
      return UIImage(named: "5-3")
    case "西装":
      return UIImage(named: "6-0")
    case "T恤":
      return UIImage(named: "2-3")
      //夏装
    case "鸭舌帽":
      return UIImage(named: "image10")
    case "短衬衫":
      return UIImage(named: "image11")
    case "短裙":
      return UIImage(named: "x-3短群")
    case "长裙":
      return UIImage(named: "x-4长裙")
    case "套裙":
      return UIImage(named: "x-5套裙")
    case "裤装":
      return UIImage(named: "x-6裤装")
      //冬装
    case "保暖衬衫":
      return UIImage(named: "d-1保暖衬衫")
    case "风衣":
      return UIImage(named: "d-2风衣")
    case "狐狸毛领":
      return UIImage(named: "d-3狐狸毛领")
    case "毛外套":
      return UIImage(named: "d-4毛外套")
    case "棉服":
      return UIImage(named: "d-5棉服")
    case "呢子大衣":
      return UIImage(named: "d-6呢子大衣")
    case "睡袍":
      return UIImage(named: "d-7睡袍")
    case "围巾":
      return UIImage(named: "d-8围巾")
    case "羽绒服":
      return UIImage(named: "d-9羽绒服")
      //皮衣
    case "长款皮衣":
      return UIImage(named: "image16")
    case "短款皮衣":
      return UIImage(named: "image12")
      //袋洗
    case "袋洗":
      return UIImage(named: "6-2")
    default:
      return nil
    }
  }
  
  var clothesType: Type {
    if clothesName == "袋洗" {
      return Type.bag
    }else {
      return Type.single
    }
  }
  
  var clothesSeason: Season
  
  init(clothesName: String,season: Season) {
    self.clothesName = clothesName
    self.clothesSeason = season
  }
  
}
