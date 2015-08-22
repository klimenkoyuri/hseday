//
//  OrgCell.swift
//  HSE Day
//
//  Created by Юрий on 12.08.15.
//  Copyright (c) 2015 StyleRU. All rights reserved.
//

import UIKit

class OrgCell: UITableViewCell {
 
    @IBOutlet var img: UIImageView!
    @IBOutlet var name: UILabel!
    @IBOutlet var descr: UITextView!
    
    
    

   
    override func awakeFromNib() {
        super.awakeFromNib()
        
        name.numberOfLines = 1
        name.adjustsFontSizeToFitWidth = true
        
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
