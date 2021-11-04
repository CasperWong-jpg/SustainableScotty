//
//  Leaderboard.swift
//  SustainableScotty
//
//  Created by Casper Wong on 10/31/21.
//

import UIKit
import Firebase

class Leaderboard: UIViewController {
    
    let db = Firestore.firestore()
    
    var CommunityName: String = "Error getting community"
    
    var joined: Bool = true

    @IBOutlet weak var LeaderboardTitle: UILabel!
    
    @IBOutlet weak var LeaderboardSize: UILabel!
    
    @IBOutlet weak var TableView: UITableView!
    
    @IBOutlet weak var JoinLeaveButton: UIButton!
    
    @IBOutlet weak var InviteOthers: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        LeaderboardTitle.text = "\(CommunityName) !!"

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
