//
//  clothesBasketViewController.swift
//  maiziSplash
//
//  Created by zhan on 15/11/9.
//  Copyright © 2015年 湛礼翔. All rights reserved.
//

import UIKit
import SnapKit

class clothesBasketViewController: UIViewController {
  
  var isUseCoupon = false  //是否使用优惠券
  
  var totalPrice = 0  //费用总计
  
  @IBOutlet var deleteAllOrderButton: UIButton!  //“删除订单”按钮
  
  @IBOutlet var tableView: UITableView!
  
  @IBOutlet var shouldPayMoneyLabel: UILabel!  //支付的费用
  
  //当购物篮为空的时候显示的图片
  private var baskitNilImageView = UIImageView(frame: CGRectZero)
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.dataSource = self
    tableView.delegate = self
    
    //设置tableView的cell分割方式
    tableView.separatorStyle = .None

    //tableView中注册一个cell
    tableView.registerClass(OrderCell.self, forCellReuseIdentifier: "OrderCell")
    
    setUI()
  }
  
  override func viewWillAppear(animated: Bool) {
    
    //每次显示的时候判断是否有订单，如果没有，则显示洗衣篮为空,并且隐藏“删除订单”按钮
    orderArrayIsNil()
    //计算价格并且计算之后刷新tableView
    functionForTotalPrice()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  //MARK: - 设置UI的函数
  private func setUI() {
    //baskitNilImageView的约束
    self.view.addSubview(baskitNilImageView)
    baskitNilImageView.image = UIImage(named: "3-4-1洗衣篮-空")
    
    baskitNilImageView.snp_makeConstraints(closure: { (make) -> Void in
      make.leading.trailing.bottom.equalTo(self.view)
      make.top.equalTo(self.view).inset(64)
    })
  }
  
  //MARK: - 计算总价格的函数
  private func functionForTotalPrice() {
    var totalPrice = 0
    for i in 0..<OrderCache.sharedInstance.orderArray.count {
      totalPrice += OrderCache.sharedInstance.orderArray[i].clothesNumber * OrderCache.sharedInstance.orderArray[i].clothes.price
    }
    self.totalPrice = totalPrice
    
    if isUseCoupon && self.totalPrice >= 30 {
      shouldPayMoneyLabel.text = "￥\(self.totalPrice - 30)"
    }else {
      shouldPayMoneyLabel.text = "￥\(self.totalPrice)"
    }
    tableView.reloadData()
  }
  
  //MARK: - 当订单为空的时候做的一些操作
  private func orderArrayIsNil() {
    baskitNilImageView.hidden = OrderCache.sharedInstance.orderArray.isEmpty ? false : true
    deleteAllOrderButton.hidden = OrderCache.sharedInstance.orderArray.isEmpty ? true : false
    
    //订单全部删除时重置isUseCoupon
    if OrderCache.sharedInstance.orderArray.isEmpty {
      isUseCoupon = false
    }
  }
  
  //MARK: - 导航栏上的“删除订单”按钮点击事件
  @IBAction func deleteAllOrderButtonClick(sender: UIButton) {
    OrderCache.sharedInstance.orderArray.removeAll()
    tableView.reloadData()
    
    //清空订单之后进行一系列操作
    orderArrayIsNil()
  }
  
}

//MARK: - UITableViewDataSource
extension clothesBasketViewController: UITableViewDataSource {
  
  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 2
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if section == 0 {
      return OrderCache.sharedInstance.orderArray.count + 1
    }else {
      return 2
    }
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    if indexPath.section == 0 {
      return returnFirstSectionCell(indexPath)
    }else {
      return returnSecondSectionCell(indexPath)
    }
    
  }
  
  //MARK: - 返回第一个Section的cell，包含订单和费用总计
  func returnFirstSectionCell(indexPath: NSIndexPath) -> UITableViewCell {
    //最后一个cell是费用总计
    if indexPath.row == OrderCache.sharedInstance.orderArray.count {
      let totalPriceCell = TotalPriceCell(style: .Default, reuseIdentifier: "totalPriceCell")
      totalPriceCell.totalPriceLabel.text = "￥\(totalPrice)"
      return totalPriceCell
    }else {
      let cell = tableView.dequeueReusableCellWithIdentifier("OrderCell") as! OrderCell
      
      cell.delegate = self  //设置cell的delegate是当前controller
      
      let order = OrderCache.sharedInstance.orderArray[indexPath.row]
      
      //判断是件洗还是袋洗，设置不同的图框
      if order.clothes.clothesType == Type.bag {
        cell.borderView.layer.borderColor = UIColor(red: 0,
          green: 194 / 255,
          blue: 171 / 255,
          alpha: 1.0).CGColor
        
      }else{
        cell.borderView.layer.borderColor = UIColor.mianBlue().CGColor
      }
      cell.borderView.layer.borderWidth = 1.0
      
      cell.clothesImageView.image = order.clothes.clothesImage
      cell.clothesNameLabel.text = "\(order.clothes.clothesName)"
      cell.priceLabel.text = "￥\(order.clothes.price)"
      cell.numberLabel.text = "\(order.clothesNumber)"
      
      //将订单信息传入cell中,用于加减操作
      cell.order = order
      //将当前的indexPath传入cell，用于进行删除当前订单操作
      cell.cellIndexPath = indexPath.row
      
      return cell
    }
  }
  
    
  //MARK: - 返回第二个section的cell
  func returnSecondSectionCell(indexPath: NSIndexPath) -> UITableViewCell {
    if indexPath.row == 0 {
      if isUseCoupon {
        let couponCell = CouponCell(style: .Default, reuseIdentifier: "couponCell")
        couponCell.couponImageView.image = UIImage(named: "6-4")
        return couponCell
      }else {
        let openCouponCell = OpenCouponOrUserInfoCell(style: .Default, reuseIdentifier: "openCouponCell", name: "洗衣券", hint: " 点击使用")
        return openCouponCell
      }
      
    }else {
      let openUserInfoCell = OpenCouponOrUserInfoCell(style: .Default, reuseIdentifier: "openUserInfoCell", name: "用户信息", hint: "填写")
      return openUserInfoCell
    }
  }
  
}

//MARK: - UITableViewDelegate
extension clothesBasketViewController: UITableViewDelegate {
  
  func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    //第一段的cell的高度
    if indexPath.section == 0 {
      if indexPath.row == OrderCache.sharedInstance.orderArray.count {
        return screenWidth * 90 / 640  //合计费用高度
      }else {
        return screenWidth * 180 / 640 //订单高度
      }
    }else {
      if indexPath.row == 0 && isUseCoupon {
        return screenWidth * 180 / 640
      }else {
        return screenWidth * 90 / 640
      }
      
    }
    
  }
  
  func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return screenWidth * 7 / 640
  }
  
  func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
    return screenWidth * 7 / 640
  }
  
  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    
    if indexPath.section == 1 && indexPath.row == 0 {
      
      //如果费用总计大于等于30，可以使用优惠券
      if totalPrice >= 30 {
        isUseCoupon = true
        tableView.reloadData()
        //计算价格
        functionForTotalPrice()
      }else {
        let alertView = UIAlertController(title: "温馨提示", message: "费用低于30元不可以使用洗衣券", preferredStyle: .Alert)
        let cancelAction = UIAlertAction(title: "确定", style: .Cancel, handler: nil)
        alertView.addAction(cancelAction)
        self.presentViewController(alertView, animated: true, completion: nil)
      }
    }
    
    if indexPath.section == 1 && indexPath.row == 1 {
      
      let vc = self.storyboard?.instantiateViewControllerWithIdentifier("UserInfoViewController") 
      self.navigationController?.pushViewController(vc!, animated: true)
    }
  }
}

//MARK: - OrderCellDelegate 用于回传cell中的删除操作
extension clothesBasketViewController: OrderCellDelegate {
  func didDelete(indexPath: Int) {
    OrderCache.sharedInstance.orderArray.removeAtIndex(indexPath)
    tableView.reloadData()
    
    //每次删除之后判断订单是否为空，如果为空则要进行一些操作
    orderArrayIsNil()
    //每进行一次删除重新计算一次总价格
    functionForTotalPrice()
  }
  
  //将cell中数量改变的消息回传
  func didChangeNumber() {
    functionForTotalPrice()
  }
}
