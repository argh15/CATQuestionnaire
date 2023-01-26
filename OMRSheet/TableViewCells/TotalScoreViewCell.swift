//
//  TotalScoreViewCell.swift
//  OMRSheet
//
//  Created by Arghadeep on 25/01/23.
//

import UIKit

class TotalScoreViewCell: UITableViewCell {
    
    @IBOutlet weak var totalScoreButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        totalScoreButton.layer.borderWidth = 1
        totalScoreButton.layer.borderColor = .init(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1)
        totalScoreButton.layer.cornerRadius = 5
    }
    
    func setScore(score: Int) {
        totalScoreButton.setTitle("\(score)", for: .normal)
    }
}
