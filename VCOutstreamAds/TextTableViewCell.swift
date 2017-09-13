//
//  TextTableViewCell.swift
//  VCOutstreamAds
//
//  Created by James Rainville on 9/12/17.
//  Copyright © 2017 ShastaRain. All rights reserved.
//

import UIKit

class TextTableViewCell: UITableViewCell {
    @IBOutlet weak var textView: UITextView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
