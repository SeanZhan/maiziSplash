//
//  MaiziSplashViewController.swift
//  maiziSplash
//
//  Created by 湛礼翔 on 15/10/9.
//  Copyright © 2015年 湛礼翔. All rights reserved.
//

import UIKit

class GuideViewController: UIViewController {
  
  var scrollView: UIScrollView?
  var loginButton: UIButton?
  var imageArray: [String] = ["0-引-1","0-引-2","0-引-3"]
  var pageControl: UIPageControl?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
    scrollView?.delegate = self
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  //MARK: - 设置UI
  func setupView() {
    //初始化scrollView
    scrollView = UIScrollView(frame: CGRect(x: 0,
                                            y: 0,
                                        width: screenWidth,
                                       height: screenHeight))
    
    scrollView?.contentSize = CGSize(width: screenWidth * CGFloat((imageArray.count)), height: screenHeight)
    scrollView?.pagingEnabled = true
    scrollView?.showsHorizontalScrollIndicator = false
    automaticallyAdjustsScrollViewInsets = false
    view.addSubview(scrollView!)
    
    //初始化imageView
    for i in 0..<imageArray.count {
      let imageView = UIImageView(frame: CGRect(x: screenWidth * CGFloat(i),
                                                y: 0,
                                            width: screenWidth,
                                           height: screenHeight))
      //给imageView添加图片
      imageView.image = UIImage(named: imageArray[i])
      scrollView?.addSubview(imageView)
    }
    
    //初始化loginButton
    loginButton = UIButton(frame: CGRect(x: screenWidth / 2-75,
                                         y: screenHeight - 90,
                                     width: 150,
                                    height: 35))
    
    loginButton?.setImage(UIImage(named: "0-1-1"), forState: UIControlState.Normal)
    view.addSubview(loginButton!)
    loginButton?.addTarget(self, action: "loginButtonClick", forControlEvents: UIControlEvents.TouchUpInside)
    
    
    //初始化pageControll
    pageControl = UIPageControl(frame: CGRect(x: screenWidth / 2 - 30,
                                              y: screenHeight - 30,
                                          width: 60,
                                         height: 10))
    
    pageControl?.numberOfPages = imageArray.count
    pageControl?.currentPageIndicatorTintColor = UIColor(red: 250 / 255,
                                                       green: 111 / 255,
                                                        blue: 95 / 255,
                                                       alpha: 1.0)
    
    pageControl?.pageIndicatorTintColor = UIColor(red: 124 / 255,
                                                green: 195 / 255,
                                                 blue: 242 / 255,
                                                alpha: 1.0)
    view.addSubview(pageControl!)
  }
  
  //MARK: - loginButton点击事件
  func loginButtonClick() {
    let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("loginViewController")
    navigationController?.pushViewController(vc, animated: true)
  }
}

//MARK: - scrollViewDelegate
extension GuideViewController: UIScrollViewDelegate{
  func scrollViewDidScroll(scrollView: UIScrollView) {
    let currentPage = scrollView.contentOffset.x / screenWidth
    pageControl?.currentPage = Int(currentPage)
  }
}
