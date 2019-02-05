//
//  MyDataTableViewCell.swift
//  JSONRemoteParsing
//
//  Created by Muhammad Faisal Imran Khan on 2/2/19.
//  Copyright © 2019 MI Apps. All rights reserved.
//

import UIKit

class MyDataTableViewCell: UITableViewCell {

    @IBOutlet var myName: UILabel!
    @IBOutlet var myEmail: UILabel!
    @IBOutlet var myLogo: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
