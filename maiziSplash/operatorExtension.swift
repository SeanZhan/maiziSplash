//
//  operatorExtension.swift
//  maiziSplash
//
//  Created by zhan on 15/11/18.
//  Copyright © 2015年 湛礼翔. All rights reserved.
//

import Foundation

//重载运算符“==”
func ==(left: ClothesInfo,right: ClothesInfo) -> Bool {
  return (left.clothesName == right.clothesName) && (left.clothesSeason == right.clothesSeason)
  
}