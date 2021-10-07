//
//  CommunitiesViewController.swift
//  SustainableScotty
//
//  Created by Sophia Lau on 9/30/21.
//

import UIKit
import Firebase

class CommunitiesViewController: UIViewController {
    
    
    @IBOutlet weak var SearchCommunitiesButton: UIButton!
    @IBOutlet weak var CreateCommunitiesButton: UIButton!
    @IBOutlet weak var AllCommunitiesButton: UIButton!
    
    @IBOutlet weak var CommunitiesTableView: UITableView!
    
    let db = Firestore.firestore()
    
    var communities: [Community] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Makes buttons rounded :)
        SearchCommunitiesButton.circleCorner()
        CreateCommunitiesButton.circleCorner()
        AllCommunitiesButton.circleCorner()

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
