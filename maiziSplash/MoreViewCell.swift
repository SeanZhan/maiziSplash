//
//  MoreViewCell.swift
//  maiziSplash
//
//  Created by zhan on 15/11/11.
//  Copyright © 2015年 湛礼翔. All rights reserved.
//

import UIKit
import SnapKit

class MoreViewCell: UITableViewCell {
  
  var iconImageView = UIImageView(frame: CGRectZero)
  var label = UILabel(frame: CGRectZero)
  var separateLine = UIView(frame: CGRectZero)
  var hintImageView = UIImageView(frame: CGRectZero)
  
  override func awakeFromNib() {
    super.awakeFromNib()

  }
  
  override func setSelected(selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }
  
  override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupUI()
    super.selectionStyle = .None
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  //MARK: 设置UI
  func setupUI() {

    //设置iconImageView的约束
    self.addSubview(iconImageView)
    
    iconImageView.snp_makeConstraints { (make) -> Void in
      make.leading.top.bottom.equalTo(self).inset(15)
      make.width.equalTo(iconImageView.snp_height)
    }
    
    //设置label的约束
    self.addSubview(label)
    label.sizeToFit()
    label.font = UIFont(name: "Heiti SC", size: 15)
    
    label.snp_makeConstraints { (make) -> Void in
      make.leading.equalTo(iconImageView.snp_trailing).offset(10)
      make.top.bottom.equalTo(self)
    }
    
    //设置separateLine的约束
    self.addSubview(separateLine)
    separateLine.backgroundColor = UIColor.borderColor()
    
    separateLine.snp_makeConstraints { (make) -> Void in
      make.leading.trailing.top.equalTo(self)
      make.height.equalTo(1.0)
    }
    
    //设置hintImageView的约束
    self.addSubview(hintImageView)
    hintImageView.image = UIImage(named: "11-1")
    
    hintImageView.snp_makeConstraints { (make) -> Void in
      make.centerY.equalTo(iconImageView)
      make.trailing.equalTo(self.snp_trailingMargin).offset(-5)
      make.top.bottom.equalTo(self).inset(20)
      make.width.equalTo(hintImageView.snp_height).multipliedBy(0.583)
    }
    
  }
}
