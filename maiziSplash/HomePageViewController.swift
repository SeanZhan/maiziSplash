//
//  HomePageViewController.swift
//  maiziSplash
//
//  Created by 湛礼翔 on 15/10/18.
//  Copyright © 2015年 湛礼翔. All rights reserved.
//

import UIKit

class HomePageViewController: UIViewController {
  
  @IBOutlet var scrollView: UIScrollView!
  @IBOutlet var pageControl: UIPageControl!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setUI()
    loadAdData()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  //MARK: - 请求网络数据
  func loadAdData() {
    HttpTool.sharedInstance.getAdInfo { (urls) -> Void in
      self.createImageView(urls)
    }
  }
  
  //MARK: - 构建ImageView
  func createImageView(urls: [String]) {
    //设定contentSize
    scrollView.contentSize = CGSize(width: screenWidth * CGFloat(urls.count),
                                   height: scrollView.frame.height)
    //设定pageControl
    pageControl.numberOfPages = urls.count
    
    //填充scrollView
    for i in 0 ..< urls.count{
      let imageView = UIImageView(frame: CGRect(x: screenWidth*CGFloat(i),
                                                y: 0,
                                            width: screenWidth,
                                           height: scrollView.frame.height))
      
      scrollView.addSubview(imageView)
      imageView.startLoader()
      imageView.setImageWithURL(NSURL(string: urls[i]), placeholderImage: nil, options: [.CacheMemoryOnly,.RefreshCached] , progress: { (r, t) -> Void in
        imageView.updateImageDownloadProgress(CGFloat(r)/CGFloat(t))
        }, completed: { (_, _, _) -> Void in
          imageView.reveal()
      })
    }
  }
  
  //MARK: 对UI进行设置
  func setUI() {
    //设定scrollView
    scrollView.showsHorizontalScrollIndicator = false
    scrollView.showsVerticalScrollIndicator = false
    scrollView.bounces = false
    scrollView.pagingEnabled = true
    scrollView.delegate = self
  }
  
  //MARK: - “件洗”按钮的点击事件
  @IBAction func garmentButtonClick(sender: UIButton) {
    
  }
  
  //MARK: - "袋洗"按钮的点击事件
  @IBAction func bagButtonClick(sender: UIButton) {
    let vc = self.storyboard?.instantiateViewControllerWithIdentifier("addShoopingCartViewController") as! addShoopingCartViewController
    vc.modalPresentationStyle = .Custom
    vc.clothesInfo = ClothesInfo(clothesName: "袋洗", season: Season.none)
    
    self.navigationController?.presentViewController(vc, animated: true, completion: { () -> Void in
      
       vc.view.superview?.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
      
    })
  }
}

//MARK: - UIScrollViewDelegate
extension HomePageViewController: UIScrollViewDelegate {
  func scrollViewDidScroll(scrollView: UIScrollView) {
    let pageNumber = Int(fabs(scrollView.contentOffset.x / screenWidth))
    pageControl.currentPage = pageNumber
  }
}