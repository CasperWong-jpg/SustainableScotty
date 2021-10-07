//
//  Helper.swift
//  SustainableScotty
//
//  Created by Sophia Lau on 10/3/21.
//

import Foundation
import UIKit

class Helper{
    // place any helper functions here
    
}


extension UITextField {
    // Rounds corners for text fields!
    func circleCorner () {
        borderStyle = .none
        
        layer.cornerRadius = frame.size.height/2
        
        layer.borderWidth = 0.25
        layer.borderColor = UIColor.white.cgColor
        
        layer.shadowOpacity = 1
        layer.shadowRadius = 3
        layer.shadowOffset = CGSize.zero
        layer.shadowColor = UIColor.gray.cgColor
        
        let paddingView: UIView = UIView(frame: CGRect(x:0, y:0, width: 20, height: frame.height))
        leftView = paddingView
        leftViewMode = UITextField.ViewMode.always
    }
}

extension UIButton{
    // Rounds corners for buttons!
    func circleCorner(){
        layer.cornerRadius = frame.size.height / 2
        
        layer.borderWidth = 0.25
        layer.borderColor = UIColor.white.cgColor
        
        layer.shadowOpacity = 1
        layer.shadowRadius = 3
        layer.shadowOffset = CGSize.zero
        layer.shadowColor = UIColor.gray.cgColor
    }
}
