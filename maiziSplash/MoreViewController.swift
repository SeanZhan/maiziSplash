//
//  MoreViewController.swift
//  maiziSplash
//
//  Created by zhan on 15/11/11.
//  Copyright © 2015年 湛礼翔. All rights reserved.
//

import UIKit
import SnapKit

class MoreViewController: UIViewController {
  
  //dataSource
  var icons = [UIImage(named: "5-1-1"),
               UIImage(named: "5-1-2"),
               UIImage(named: "5-1-3"),
               UIImage(named: "5-1-4"),
               UIImage(named: "5-1-5"),
               UIImage(named: "5-1-6")]
  
  var labelText = ["联系客服",
                   "常见问题",
                   "服务范围",
                   "关于我们",
                   "用户协议",
                   "意见反馈"]
  
  private var navigationBar = UIView(frame: CGRectZero)
  private var navigationTitle = UILabel(frame: CGRectZero)
  private var tableView = UITableView(frame: CGRectZero)
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
    
    tableView.delegate = self
    tableView.dataSource = self
    
    //在tableView中注册一个cell
    tableView.registerClass(MoreViewCell.self, forCellReuseIdentifier: "MoreViewCell")
    
    //设置tableViewCell的分割方式
    tableView.separatorStyle = .None
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  //MARK: 设置UI
  func setupUI() {
    
    self.view.backgroundColor = UIColor.grayBackgroundColor()
    
    // 设置navigationBar的约束
    self.view.addSubview(navigationBar)
    navigationBar.backgroundColor = UIColor.mianBlue()
    
    navigationBar.snp_makeConstraints { (make) -> Void in
      make.leading.trailing.top.equalTo(self.view)
      make.height.equalTo(64)
    }
    
    //设置navigationTitle的约束
    navigationBar.addSubview(navigationTitle)
    navigationTitle.text = "更多"
    navigationTitle.font = UIFont(name: "Heiti SC", size: 17)
    navigationTitle.textColor = UIColor.whiteColor()
    navigationTitle.sizeToFit()
    
    navigationTitle.snp_makeConstraints { (make) -> Void in
      make.centerX.equalTo(self.view)
      make.centerY.equalTo(navigationBar).offset(10)
    }
    
    self.view.addSubview(tableView)
    
    tableView.snp_makeConstraints { (make) -> Void in
      make.leading.trailing.bottom.equalTo(self.view)
      make.top.equalTo(navigationBar.snp_bottom)
    }
  }
}

//MARK: - UITableViewDelegate
extension MoreViewController: UITableViewDelegate {
  
  func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    return screenWidth * 100 / 640
  }
  
}

//MARK: - UITableViewDataSource
extension MoreViewController: UITableViewDataSource {
  
  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return icons.count
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("MoreViewCell") as! MoreViewCell
    cell.iconImageView.image = icons[indexPath.row]
    cell.label.text = labelText[indexPath.row]
    return cell
  }
}
