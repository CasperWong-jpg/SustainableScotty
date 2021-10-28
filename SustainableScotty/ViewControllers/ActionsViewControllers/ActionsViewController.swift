//
//  ActionsViewController.swift
//  SustainableScotty
//
//  Created by Sophia Lau on 9/30/21.
//

import UIKit

class ActionsViewController: UIViewController {

    @IBOutlet weak var favActionsButton: UIButton!
    @IBOutlet weak var quickActionsButton: UIButton!
    @IBOutlet weak var waterActionsbutton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        Helper.createNavBar(navigationItem)


        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
