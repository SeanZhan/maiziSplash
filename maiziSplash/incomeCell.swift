//
//  incomeCell.swift
//  maiziSplash
//
//  Created by zhan on 15/11/5.
//  Copyright © 2015年 湛礼翔. All rights reserved.
//

import UIKit

class incomeCell: UITableViewCell {
  
  @IBOutlet var orderIdLabel: UILabel!
  @IBOutlet var timeLabel: UILabel!
  @IBOutlet var orderAmountLabel: UILabel!
  @IBOutlet var incomeLabel: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  override func setSelected(selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }
  
}
