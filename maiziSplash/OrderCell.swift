//
//  OrderCell.swift
//  maiziSplash
//
//  Created by zhan on 15/11/12.
//  Copyright © 2015年 湛礼翔. All rights reserved.
//

import UIKit
import SnapKit

//MARK: - 定义一个协议用于删除cell
protocol OrderCellDelegate {
  func didDelete(indexPath: Int)
  func didChangeNumber()
}

class OrderCell: UITableViewCell {
  
  var borderView = UIView(frame: CGRectZero)
  var clothesImageView = UIImageView(frame: CGRectZero)
  var clothesNameLabel = UILabel(frame: CGRectZero)
  var minimissNumberButton = UIButton(frame: CGRectZero)
  var numberLabel = UILabel(frame: CGRectZero)
  var addNumberButton = UIButton(frame: CGRectZero)
  var multiplyLable = UILabel(frame: CGRectZero)
  var priceLabel = UILabel(frame: CGRectZero)
  var deleteButton = UIButton(frame: CGRectZero)
  var lineView = UIView(frame: CGRectZero)
  
  var order: ClothesOrder?

  var cellIndexPath: Int?  //这个属性用于删除当前订单操作
  
  var delegate: OrderCellDelegate?
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  override func setSelected(selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }
  
  override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupUI()
    super.selected = false
    super.selectionStyle = .None
  }

  required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
  }
  
  //MARK: - 设置cell的UI
  func setupUI() {
    
    //设置borderImageView的约束
    self.addSubview(borderView)
    borderView.snp_makeConstraints { (make) -> Void in
      make.top.bottom.leading.equalTo(self).inset(15)
      make.width.equalTo(borderView.snp_height).multipliedBy(0.92)
    }
    
    //设置clothesImageView的约束
    borderView.addSubview(clothesImageView)
    clothesImageView.snp_makeConstraints { (make) -> Void in
      make.top.leading.bottom.trailing.equalTo(borderView).inset(5)
    }
    
    //设置clothesNameLabel的约束
    self.addSubview(clothesNameLabel)
    clothesNameLabel.sizeToFit()
    clothesNameLabel.font = UIFont(name: "Heiti SC", size: 13)
    
    clothesNameLabel.snp_makeConstraints { (make) -> Void in
      make.leading.equalTo(borderView.snp_trailing).offset(5)
      make.top.equalTo(borderView)
    }
    
    //设置minimissNumberButton的约束
    self.addSubview(minimissNumberButton)
    minimissNumberButton.setBackgroundImage(UIImage(named: "2-4"), forState: .Normal)
    minimissNumberButton.setBackgroundImage(UIImage(named: "2-2-0"), forState: .Highlighted)
    minimissNumberButton.addTarget(self, action: "minimissNumberButtonClick", forControlEvents: .TouchUpInside)
    minimissNumberButton.layer.borderColor = UIColor.borderColor().CGColor
    minimissNumberButton.layer.borderWidth = 1.0
    
    minimissNumberButton.snp_makeConstraints { (make) -> Void in
      make.leading.equalTo(borderView.snp_trailing).offset(50)
      make.height.equalTo(minimissNumberButton.snp_width).multipliedBy(0.8)
      make.centerY.equalTo(borderView)
    }
    
    //设置numberLabel的约束
    self.addSubview(numberLabel)
    numberLabel.backgroundColor = UIColor.grayBackgroundColor()
    numberLabel.layer.borderColor = UIColor.borderColor().CGColor
    numberLabel.layer.borderWidth = 1.0
    numberLabel.textColor = UIColor.priceRed()
    numberLabel.font = UIFont(name: "Heiti SC", size: 12)
    numberLabel.textAlignment = .Center
    
    numberLabel.snp_makeConstraints { (make) -> Void in
      make.top.bottom.equalTo(minimissNumberButton)
      make.leading.equalTo(minimissNumberButton.snp_trailing)
      make.width.equalTo(minimissNumberButton.snp_height).multipliedBy(1.86)
    }
    
    //设置addNumberButton的约束
    self.addSubview(addNumberButton)
    addNumberButton.setBackgroundImage(UIImage(named: "4-5"), forState: .Normal)
    addNumberButton.setBackgroundImage(UIImage(named: "4-4"), forState: .Highlighted)
    addNumberButton.addTarget(self, action: "addNumberButtonClick", forControlEvents: .TouchUpInside)
    addNumberButton.layer.borderColor = UIColor.borderColor().CGColor
    addNumberButton.layer.borderWidth = 1.0
    
    addNumberButton.snp_makeConstraints { (make) -> Void in
      make.top.bottom.equalTo(numberLabel)
      make.leading.equalTo(numberLabel.snp_trailing)
      make.width.equalTo(minimissNumberButton)
    }
    
    //设置multiplyLable的约束
    self.addSubview(multiplyLable)
    multiplyLable.textAlignment = .Center
    multiplyLable.text = "×"
    multiplyLable.font = UIFont(name: "Heiti SC", size: 12)
    
    multiplyLable.snp_makeConstraints { (make) -> Void in
      make.width.height.equalTo(12)
      make.leading.equalTo(addNumberButton.snp_trailing).offset(15)
      make.bottom.equalTo(addNumberButton)
    }
    
    //设置priceLabel的约束
    self.addSubview(priceLabel)
    priceLabel.font = UIFont(name: "Heiti SC", size: 15)
    priceLabel.textColor = UIColor.priceRed()
    
    priceLabel.snp_makeConstraints { (make) -> Void in
      make.bottom.equalTo(multiplyLable)
      make.leading.equalTo(multiplyLable.snp_trailing)
      make.trailing.equalTo(self).offset(-20)
      make.width.equalTo(50)
    }
    
    //设置deleteButton的约束
    self.addSubview(deleteButton)
    deleteButton.setBackgroundImage(UIImage(named: "5-4"), forState: .Normal)
    deleteButton.addTarget(self, action: "deleteButtonClick", forControlEvents: .TouchUpInside)
    
    deleteButton.snp_makeConstraints { (make) -> Void in
      make.top.trailing.equalTo(self).inset(5)
      make.width.height.equalTo(self.snp_width).multipliedBy(0.068)
    }
    
    //设置lineView的约束
    self.addSubview(lineView)
    lineView.backgroundColor = UIColor.borderColor()
    
    lineView.snp_makeConstraints { (make) -> Void in
      make.bottom.trailing.equalTo(self)
      make.leading.equalTo(self).inset(20)
      make.height.equalTo(1)
    }
    
  }
  
  //MARK: minimissNumberButton的点击事件
  func minimissNumberButtonClick() {
    if order!.clothesNumber > 1 {
      --order!.clothesNumber
      numberLabel.text = "\(order!.clothesNumber)"
      delegate?.didChangeNumber()
    }
  }
  
  //MARK: addNumberButtonClick的点击事件
  func addNumberButtonClick() {
    ++order!.clothesNumber
    numberLabel.text = "\(order!.clothesNumber)"
    delegate?.didChangeNumber()
  }
  
  //MARK: deleteButtonClick的点击事件
  func deleteButtonClick() {
    delegate?.didDelete(cellIndexPath!)
  }
}
