//
//  HttpTool.swift
//  maiziSplash
//
//  Created by zhan on 15/10/22.
//  Copyright © 2015年 湛礼翔. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class HttpTool {
  class var sharedInstance: HttpTool {
    struct Static {
      static var onceToken: dispatch_once_t = 0
      static var instance : HttpTool? = nil
    }
    dispatch_once(&Static.onceToken){
      Static.instance = HttpTool()
    }
    return Static.instance!
  }
  private func getRequst(url: String,parameter:[String : AnyObject]?,completionHandler: ( NSData?, ErrorType?) -> Void){
    request(.GET, NetInfo.WEB_SERVER + url, parameters: parameter, encoding: ParameterEncoding.URL).response { (_, _, data, error) -> Void in
      completionHandler(data,error)
    }
  }
  
  //请求广告数据
  func getAdInfo(completionHandler: (urls:[String]) -> Void){
    self.getRequst(NetInfo.GET_ADS_DATA, parameter: nil) { (data, error) -> Void in
      //判断是否出错
      if error == nil{
        //如果没有出错开始解析Json
        let json = JSON(data: (data as NSData!))
        let ads = json["ads"]
        var addrs = [String]()
        for i in 0 ..< ads.count{
          if let imageAddress = ads[i]["image"].string{
            addrs.append(imageAddress)
          }
        }
        completionHandler(urls: addrs)
      }
    }
  }
  
  //请求收益数据
  func getIncome(completionHandler: (income: incomeInfo) -> Void) {
    self.getRequst(NetInfo.GET_INCOME_DATA, parameter: nil) { (data, error) -> Void in
      //如果没有错误，解析Json
      if error == nil {
        let json = JSON(data: (data as NSData!))
        let yearlyIncome = json["yearlyIncome"].int
        let baseSaraly = json["baseSalary"].int
        let balancing = json["balancing"].bool
        let dailyIncomeArray = json["dailyIncome"].arrayObject
        
        var dailyInfoArray = [dailyInfo]()
        for i in 0..<dailyIncomeArray!.count {
          let oneDayInfo = dailyInfo()
          oneDayInfo.date = dailyIncomeArray![i]["date"] as? String
          oneDayInfo.orders = [orderInfo]()
          for j in 0..<dailyIncomeArray![i]["orders"]!!.count {
            let order = orderInfo()
            order.orderId = dailyIncomeArray![i]["orders"]!![j]["orderId"] as? String
            order.orderAmount = dailyIncomeArray![i]["orders"]!![j]["orderAmount"] as? Int
            order.income = dailyIncomeArray![i]["orders"]!![j]["income"] as? Int
            order.time = dailyIncomeArray![i]["orders"]!![j]["time"] as? String
            oneDayInfo.orders?.append(order)
          }
          dailyInfoArray.append(oneDayInfo)
        }
        
        //封装数据
        let incomeObj = incomeInfo()
        incomeObj.yearlyIncome = yearlyIncome
        incomeObj.baseSalary = baseSaraly
        incomeObj.balancing = balancing
        incomeObj.dailyIncome = dailyInfoArray
        
        completionHandler(income: incomeObj)
      }
    }
  }
}
