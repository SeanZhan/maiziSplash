//
//  ClothesOrder.swift
//  maiziSplash
//
//  Created by zhan on 15/11/12.
//  Copyright © 2015年 湛礼翔. All rights reserved.
//

import Foundation

class ClothesOrder {
  var clothes: ClothesInfo
  var clothesNumber: Int
  
  init(clothes: ClothesInfo,clothesNumber: Int) {
    self.clothes = clothes
    self.clothesNumber = clothesNumber
  }
}
