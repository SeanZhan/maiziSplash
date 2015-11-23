//
//  OpenCouponAndUserInfoCell.swift
//  maiziSplash
//
//  Created by zhan on 15/11/14.
//  Copyright © 2015年 湛礼翔. All rights reserved.
//

import UIKit
import SnapKit

class OpenCouponOrUserInfoCell: UITableViewCell {
  
  var nameLabel = UILabel(frame: CGRectZero)
  var hintLabel = UILabel(frame: CGRectZero)
  var hintImageView = UIImageView(frame: CGRectZero)
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  override func setSelected(selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }
  
  init(style: UITableViewCellStyle, reuseIdentifier: String?,name: String,hint: String) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    setUI()
    self.selectionStyle = .None
    nameLabel.text = name
    hintLabel.text = hint
  }

  required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
  }
  
  func setUI() {
    self.backgroundColor = UIColor.whiteColor()
    self.layer.borderColor = UIColor.borderColor().CGColor
    self.layer.borderWidth = 1.0
    
    self.addSubview(nameLabel)
    nameLabel.font = UIFont(name: "Heiti SC", size: 17)
    nameLabel.sizeToFit()
    
    nameLabel.snp_makeConstraints { (make) -> Void in
      make.centerY.equalTo(self)
      make.leading.equalTo(self).offset(15)
      make.top.bottom.equalTo(self).inset(10)
    }
    
    self.addSubview(hintImageView)
    hintImageView.image = UIImage(named: "11-1")
    
    hintImageView.snp_makeConstraints { (make) -> Void in
      make.centerY.equalTo(self)
      make.top.bottom.equalTo(self).inset(15)
      make.trailing.equalTo(self).inset(15)
      make.width.equalTo(hintImageView.snp_height).multipliedBy(0.58)
    }
    
    self.addSubview(hintLabel)
    hintLabel.font = UIFont(name: "Heiti SC", size: 15)
    hintLabel.sizeToFit()
    
    hintLabel.snp_makeConstraints { (make) -> Void in
      make.centerY.equalTo(self)
      make.top.bottom.equalTo(self).inset(10)
      make.trailing.equalTo(hintImageView.snp_leading).offset(-10)
    }
  }
}
