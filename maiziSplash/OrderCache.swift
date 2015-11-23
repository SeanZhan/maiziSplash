//
//  orderCache.swift
//  maiziSplash
//
//  Created by zhan on 15/11/12.
//  Copyright © 2015年 湛礼翔. All rights reserved.
//

import Foundation

class OrderCache {
  
  //当前类型的一个单例
  class var sharedInstance: OrderCache {
    struct Static {
      static var oneToken: dispatch_once_t = 0
      static var instance: OrderCache? = nil
    }
    dispatch_once(&Static.oneToken) { () -> Void in
      Static.instance = OrderCache()
    }
    return Static.instance!
  }
  
  //MARK: - 用于存储订单信息的数组
  var orderArray: [ClothesOrder] = []
  
  //MARK: - 新增订单
  func addOrder(order: ClothesOrder) {
    //如果数组为空则直接添加订单信息
    if orderArray.count == 0 {
      orderArray.append(order)
    }else{
      //遍历数组，如果数组中有同类衣服的则修改数量,否则给数组添加元素
      var haveSame = false
      for i in 0..<orderArray.count {
        if order.clothes == orderArray[i].clothes {
          orderArray[i].clothesNumber += order.clothesNumber
          haveSame = true
          break
        }
      }
      //当遍历完成未发现有同类衣服，则添加新的元素进入数组
      if !haveSame {
        orderArray.append(order)
      }
    }
  }
  
}
