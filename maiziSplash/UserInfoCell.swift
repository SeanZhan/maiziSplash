//
//  UserInfoTableViewCell.swift
//  maiziSplash
//
//  Created by zhan on 15/11/14.
//  Copyright © 2015年 湛礼翔. All rights reserved.
//

import UIKit
import SnapKit

class UserInfoCell: UITableViewCell {
  
  var iconImageView = UIImageView(frame: CGRectZero)
  var poneImageView = UIImageView(frame: CGRectZero)
  var addressImageView = UIImageView(frame: CGRectZero)
  var nameLabel = UILabel(frame: CGRectZero)
  var poneLabel = UILabel(frame: CGRectZero)
  var addressLabel = UILabel(frame: CGRectZero)
  var hintImageView = UIImageView(frame: CGRectZero)
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  override func setSelected(selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }
  
  override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setUI()
    self.selectionStyle = .None
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func setUI() {
    self.backgroundColor = UIColor.whiteColor()
    
    self.addSubview(iconImageView)
    iconImageView.image = UIImage(named: "8-1")
    
    iconImageView.snp_makeConstraints { (make) -> Void in
      make.top.leading.equalTo(self).inset(10)
      make.width.equalTo(iconImageView.snp_height)
        .multipliedBy(0.73)
    }
    
    self.addSubview(addressImageView)
    addressImageView.image = UIImage(named: "10-0")
    
    addressImageView.snp_makeConstraints { (make) -> Void in
      make.centerX.equalTo(iconImageView)
      make.top.equalTo(iconImageView.snp_bottom).offset(8)
      make.width.equalTo(iconImageView)
      make.height.equalTo(iconImageView)
      make.bottom.equalTo(self).inset(10)
    }
    
    self.addSubview(nameLabel)
    nameLabel.font = UIFont(name: "Heiti SC", size: 15)
    nameLabel.sizeToFit()
    
    nameLabel.snp_makeConstraints { (make) -> Void in
      make.bottom.equalTo(iconImageView)
      make.leading.equalTo(iconImageView.snp_trailing).offset(3)
    }
    
    self.addSubview(hintImageView)
    hintImageView.image = UIImage(named: "11-1")
    
    hintImageView.snp_makeConstraints { (make) -> Void in
      make.trailing.equalTo(self).offset(-5)
      make.centerY.equalTo(self)
      make.height.equalTo(iconImageView)
      make.width.equalTo(hintImageView.snp_height).multipliedBy(0.583)
    }
    
    self.addSubview(poneLabel)
    poneLabel.font = UIFont(name: "Heiti SC", size: 15)
    poneLabel.sizeToFit()
    
    poneLabel.snp_makeConstraints { (make) -> Void in
      make.trailing.equalTo(hintImageView.snp_leading).offset(-10)
      make.bottom.equalTo(iconImageView)
    }
    
    self.addSubview(poneImageView)
    poneImageView.image = UIImage(named: "9-1")
    
    poneImageView.snp_makeConstraints { (make) -> Void in
      make.trailing.equalTo(poneLabel.snp_leading).offset(-3)
      make.centerY.equalTo(iconImageView)
      make.width.equalTo(iconImageView)
      make.height.equalTo(iconImageView)
    }
    
    self.addSubview(addressLabel)
    addressLabel.font = UIFont(name: "Heiti SC", size: 12)
    addressLabel.numberOfLines = 0
    
    addressLabel.snp_makeConstraints { (make) -> Void in
      make.leading.equalTo(addressImageView.snp_trailing).offset(3)
      make.top.equalTo(addressImageView.snp_top)
      make.trailing.equalTo(poneLabel.snp_trailing)
    }
  }
  
}
