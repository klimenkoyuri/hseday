//
//  InfoCell.swift
//  HSE Day
//
//  Created by Anton Scherbakov on 13/08/15.
//  Copyright (c) 2015 StyleRU. All rights reserved.
//

import UIKit

class InfoCell: UITableViewCell {

    @IBOutlet var number: UILabel!
    @IBOutlet var check: UIImageView!
    @IBOutlet var name: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
