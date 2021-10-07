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
        SignUpButton.circleCorner()
        LogInButton.circleCorner()
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

