//
//  CouponCell.swift
//  maiziSplash
//
//  Created by zhan on 15/11/14.
//  Copyright © 2015年 湛礼翔. All rights reserved.
//

import UIKit
import SnapKit

class CouponCell: UITableViewCell {
  
  var couponImageView = UIImageView(frame: CGRectZero)
  
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
    self.backgroundColor = UIColor.grayBackgroundColor()
    
    self.addSubview(couponImageView)
    
    couponImageView.snp_makeConstraints { (make) -> Void in
      make.top.bottom.equalTo(self).inset(10)
      make.centerY.centerX.equalTo(self)
      make.width.equalTo(couponImageView.snp_height).multipliedBy(3.7)
    }
  }
  
}
