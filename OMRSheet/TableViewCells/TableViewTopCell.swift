//
//  TableViewTopCell.swift
//  OMRSheet
//
//  Created by Arghadeep on 20/01/23.
//

import UIKit

class TableViewTopCell: UITableViewCell {
    
    @IBOutlet weak var mainLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.mainLabel.text = "For each item below, place a mark (✘) in the box that best describes you currently. Be sure to only select one response for each question."
    }
}
