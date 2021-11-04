//
//  HomeViewController.swift
//  SustainableScotty
//
//  Created by Sophia Lau on 9/30/21.
//

import UIKit
import Firebase

class HomeViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var Header: UINavigationItem!
    
    @IBOutlet weak var actionCell: UITableViewCell!
    var actions: [Action] = [
        Action(action_title: "Refill Reusable Waterbottle", times_logged: 125, coins: 15),
        Action(action_title: "Brought Reusable Utensils", times_logged: 90, coins: 20),
        Action(action_title: "Brought Reusable Mug", times_logged: 87, coins: 15)
    ]

    override func viewDidLoad() {
        
        super.viewDidLoad()
        Helper.createNavBar(navigationItem)
        Header.title = "Your Frequent Actions"

        // Do any additional setup after loading the view.
    }
    
    //extension HomeViewController: UITableViewDataSource {
        
    //}
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
