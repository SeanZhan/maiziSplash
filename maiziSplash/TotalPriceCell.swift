//
//  TotalPriceCell.swift
//  maiziSplash
//
//  Created by zhan on 15/11/16.
//  Copyright © 2015年 湛礼翔. All rights reserved.
//

import UIKit
import SnapKit

class TotalPriceCell: UITableViewCell {
  
  private var nameLabel = UILabel(frame: CGRectZero)
  var totalPriceLabel = UILabel(frame: CGRectZero)
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  override func setSelected(selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }
  
  override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    self.selectionStyle = .None
    
    self.addSubview(totalPriceLabel)
    totalPriceLabel.textColor = UIColor.priceRed()
    totalPriceLabel.font = UIFont(name: "Heiti SC", size: 17)
    totalPriceLabel.sizeToFit()
    
    totalPriceLabel.snp_makeConstraints { (make) -> Void in
      make.centerY.equalTo(self)
      make.trailing.equalTo(self).offset(-15)
    }
    
    self.addSubview(nameLabel)
    nameLabel.font = UIFont(name: "Heiti SC", size: 15)
    nameLabel.sizeToFit()
    nameLabel.text = "费用总计:"
    
    nameLabel.snp_makeConstraints { (make) -> Void in
      make.centerY.equalTo(self)
      make.trailing.equalTo(totalPriceLabel.snp_leading).offset(-5)
    }
  }

  required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
  }
  
  
  
}
