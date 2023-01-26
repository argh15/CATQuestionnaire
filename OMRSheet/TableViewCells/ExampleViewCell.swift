//
//  ExampleViewCell.swift
//  OMRSheet
//
//  Created by Arghadeep on 24/01/23.
//

import Foundation
import UIKit

class ExampleViewCell: UITableViewCell {
    
    @IBOutlet weak var oneRatingButton: RadioButton!
        
    override func awakeFromNib() {
        super.awakeFromNib()
        oneRatingButton.isSelected = true
    }
    
}
