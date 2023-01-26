//
//  UIView + Extensions.swift
//  OMRSheet
//
//  Created by Arghadeep on 20/01/23.
//

import UIKit

extension UIView {
    
    static var identifier: String {
        return String(describing: self)
    }
    
    static var nib:UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
}
