//
//  RadioButton.swift
//  OMRSheet
//
//  Created by Arghadeep on 24/01/23.
//

import Foundation
import UIKit

class RadioButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = bounds.width / 2
        layer.borderColor = .init(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1)
        layer.borderWidth = 1
        self.setTitleColor(.white, for: .selected)
    }
    
    override var isSelected: Bool {
        didSet {
            self.backgroundColor = isSelected ? .blue : .white
        }
    }
}
