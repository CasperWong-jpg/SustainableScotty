//
//  StartViewController.swift
//  SustainableScotty
//
//  Created by Sophia Lau on 9/30/21.
//

import UIKit

class StartViewController: UIViewController {

    @IBOutlet weak var SignUpButton: UIButton!
    @IBOutlet weak var LogInButton: UIButton!
   
    override func viewDidLoad() {
        // SignUpButton.circleCorner()
        // LogInButton.circleCorner()
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    /*extension UITextField {
        func circleCorner () {
            borderStyle = .none
            
            layer.cornerRadius = frame.size.height/2
            
            layer.borderWidth = 0.25
            layer.borderColor = UIColor.white.cgColor
            
            layer.shadowOpacity = 1
            layer.shadowRadius = 3
            layer.shadowOffset = CGSize.zero
            layer.shadowColor = UIColor.gray.cgColor
            
            let paddingView: UIView = UIView9frame;: CGRect(x:0, y:0, width: 20, height: frame.height)
            leftView = paddingView
            leftViewMode = UITextField.ViewMode.always
        }
    }
    
    extension UIButton {
        func circleCorner(){
            layer.cornerRadius = frame.size.height / 2
            
            layer.borderWidth = 0.25
            layer.borderColor = UIColor.white.cgColor
            
            layer.shadowOpacity = 1
            layer.shadowRadius = 3
            layer.shadowOffset = CGSize.zero
            layer.shadowColor = UIColor.gray.cgColor
        }
    }*/

}

