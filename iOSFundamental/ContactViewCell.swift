//
//  ContactViewCell.swift
//  iOSFundamental
//
//  Created by XORGEEK3 on 30/12/20.
//  Copyright © 2020 XORGEEK. All rights reserved.
//

import UIKit

class ContactViewCell: UITableViewCell {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var phone: UILabel!
    @IBOutlet weak var address: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
