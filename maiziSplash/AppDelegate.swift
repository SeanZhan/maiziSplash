//
//  AppDelegate.swift
//  maiziSplash
//
//  Created by 湛礼翔 on 15/10/9.
//  Copyright © 2015年 湛礼翔. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  
  
  func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

    let isOpened = NSUserDefaults.standardUserDefaults().valueForKey("isOpened") as? Bool
    
    if (isOpened != nil){
      let notFirstLoadViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("nv")
      self.window?.rootViewController = notFirstLoadViewController
    }
    else{
      let isFirstLoadViewController = GuideViewController()
      let nvController = UINavigationController(rootViewController: isFirstLoadViewController)
      nvController.navigationBar.hidden = true
      self.window?.rootViewController = nvController
      NSUserDefaults.standardUserDefaults().setBool(true, forKey: "isOpened")
    }
    
    return true
  }
  
  func applicationWillResignActive(application: UIApplication) {
    
  }
  
  func applicationDidEnterBackground(application: UIApplication) {
  }
  
  func applicationWillEnterForeground(application: UIApplication) {
    
  }
  
  func applicationDidBecomeActive(application: UIApplication) {
    
  }
  
  func applicationWillTerminate(application: UIApplication) {
    
  }
  
  
}

