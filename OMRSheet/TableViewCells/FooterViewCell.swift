//
//  FooterViewCell.swift
//  OMRSheet
//
//  Created by Arghadeep on 26/01/23.
//

import UIKit

class FooterViewCell: UITableViewCell {
    
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var licenseView: UIView!
    
    var submitQuestions: (()->())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        submitButton.layer.cornerRadius = 10.0
        licenseView.layer.cornerRadius = 5.0
    }
    
    func updateSubmitButton(isEnabled: Bool) {
        submitButton.isEnabled = isEnabled
        if isEnabled {
            submitButton.backgroundColor = .init(red: 20.0/255.0, green: 66.0/255.0, blue: 126.0/255.0, alpha: 1.0)
            submitButton.setTitleColor(.white, for: .normal)
        } else {
            submitButton.backgroundColor = .init(red: 230.0/255.0, green: 230.0/255.0, blue: 230.0/255.0, alpha: 1.0)
            submitButton.setTitleColor(.init(red: 128.0/255.0, green: 128.0/255.0, blue: 128.0/255.0, alpha: 1.0), for: .disabled)
        }
    }
    
    @IBAction func submitAction(_ sender: UIButton) {
        submitQuestions?()
    }
}
