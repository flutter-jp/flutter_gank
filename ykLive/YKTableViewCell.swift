//
//  YKTableViewCell.swift
//  ykLive
//
//  Created by xiaomo on 2017/04/25.
//  Copyright © 2017年 xiaomo. All rights reserved.
//

import UIKit

class YKTableViewCell: UITableViewCell {
    @IBOutlet weak var avator: UIImageView!
    @IBOutlet weak var nick: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var viewers: UILabel!
    @IBOutlet weak var pic: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
