//
//  QuestionViewCell.swift
//  OMRSheet
//
//  Created by Arghadeep on 25/01/23.
//

import UIKit

class QuestionViewCell: UITableViewCell {
    
    @IBOutlet weak var zeroRatingButton: RadioButton!
    @IBOutlet weak var oneRatingButton: RadioButton!
    @IBOutlet weak var twoRatingButton: RadioButton!
    @IBOutlet weak var threeRatingButton: RadioButton!
    @IBOutlet weak var fourRatingButton: RadioButton!
    @IBOutlet weak var fiveRatingButton: RadioButton!
    @IBOutlet weak var minScaleLabel: UILabel!
    @IBOutlet weak var maxScaleLabel: UILabel!
    @IBOutlet weak var finalScoreButton: RadioButton!
    
    public var getQuestionScore: ((Int)->())? = nil
    
    var score: Int = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupScaleLables(min: String, max: String) {
        minScaleLabel.text = min
        maxScaleLabel.text = max
    }
    
    func resetRadioSelection() {
        zeroRatingButton.isSelected = false
        oneRatingButton.isSelected = false
        twoRatingButton.isSelected = false
        threeRatingButton.isSelected = false
        fourRatingButton.isSelected = false
        fiveRatingButton.isSelected = false
    }
    
    func calculateScore(val: String?) {
        if let val = val {
            finalScoreButton.setTitle(val, for: .normal)
            score = (val as NSString).integerValue
            getQuestionScore?(score)
        }
    }
    
    @IBAction func zeroRatingAction(_ sender: RadioButton) {
        resetRadioSelection()
        zeroRatingButton.isSelected = true
        calculateScore(val: sender.titleLabel?.text)
    }
    
    @IBAction func oneRatingAction(_ sender: RadioButton) {
        resetRadioSelection()
        oneRatingButton.isSelected = true
        calculateScore(val: sender.titleLabel?.text)
    }
    
    @IBAction func twoRatingAction(_ sender: RadioButton) {
        resetRadioSelection()
        twoRatingButton.isSelected = true
        calculateScore(val: sender.titleLabel?.text)
    }
    
    @IBAction func threeRatingAction(_ sender: RadioButton) {
        resetRadioSelection()
        threeRatingButton.isSelected = true
        calculateScore(val: sender.titleLabel?.text)
    }
    
    @IBAction func fourRatingAction(_ sender: RadioButton) {
        resetRadioSelection()
        fourRatingButton.isSelected = true
        calculateScore(val: sender.titleLabel?.text)
    }
    
    @IBAction func fiveRatingAction(_ sender: RadioButton) {
        resetRadioSelection()
        fiveRatingButton.isSelected = true
        calculateScore(val: sender.titleLabel?.text)
    }
}
