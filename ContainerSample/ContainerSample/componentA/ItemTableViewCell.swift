//
//  ItemTableViewCell.swift
//  ContainerSample
//
//  Created by YamamotoKazunori on 2017/01/18.
//  Copyright © 2017年 YamamotoKazunori. All rights reserved.
//

import UIKit

class ItemTableViewCell: UITableViewCell {

    @IBOutlet var titleLabel: UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
