//
//  IncomeViewController.swift
//  maiziSplash
//
//  Created by zhan on 15/10/23.
//  Copyright © 2015年 湛礼翔. All rights reserved.
//

import UIKit
class IncomeViewController: UIViewController {
  
  @IBOutlet var yearlyIncomeLabel: UILabel!
  @IBOutlet var balancingLabel: UILabel!
  @IBOutlet var monthlyIncomeLabel: UILabel!
  @IBOutlet var baseSalaryLabel: UILabel!
  @IBOutlet var tableView: UITableView!
  var dailyIncome: [dailyInfo] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    //设定tableView的delegate和dataSource
    self.tableView.delegate = self
    self.tableView.dataSource = self
    //调用updateUI函数
    self.setupUI()
    //请求网络
    HttpTool.sharedInstance.getIncome { (income) -> Void in
      self.yearlyIncomeLabel.text = "\(income.yearlyIncome!)"
      self.baseSalaryLabel.text = "\(income.baseSalary!)元"
      if income.balancing! {
        self.balancingLabel.text = "已结算"
      }else{
        self.balancingLabel.text = "未结算"
      }
      self.dailyIncome = income.dailyIncome!
      //计算月收益
      self.monthlyIncomeLabel.text = "\(self.monthlyIncome() + income.baseSalary!)元"
      self.tableView.reloadData()
    }
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  //MARK: - 设置UI
  func setupUI(){
    self.yearlyIncomeLabel.sizeToFit()
    self.monthlyIncomeLabel.sizeToFit()
    self.baseSalaryLabel.sizeToFit()
  }
  
  //MARK: - 计算一个月的总收益
  func monthlyIncome() -> Int {
    var mothlyIncome = 0
    for i in 0..<dailyIncome.count {
      for j in 0..<dailyIncome[i].orders!.count {
        mothlyIncome += dailyIncome[i].orders![j].income!
      }
    }
    return mothlyIncome
  }
}

//MARK: - tableViewDelegate
extension IncomeViewController: UITableViewDelegate {
  func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    return 95.0
  }
  
  func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return 35.0
  }
  
  func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
    return 10.0
  }
}

//MARK: - tableViewDataSource
extension IncomeViewController: UITableViewDataSource {
  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return dailyIncome.count
  }
  
  func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    let date = dailyIncome[section].date
    return date!
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    let orders = dailyIncome[section].orders
    let cellNumber = orders!.count
    return cellNumber
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = self.tableView.dequeueReusableCellWithIdentifier("Cell") as! incomeCell
    
    //获取到当前订单，并且将订单信息显示在cell上
    cell.orderIdLabel.text = dailyIncome[indexPath.section].orders![indexPath.row].orderId
    cell.orderAmountLabel.text = "\(dailyIncome[indexPath.section].orders![indexPath.row].orderAmount!)元"
    cell.timeLabel.text = dailyIncome[indexPath.section].orders![indexPath.row].time!
    cell.incomeLabel.text = "\(dailyIncome[indexPath.section].orders![indexPath.row].income!)元"
    return cell
  }
}
