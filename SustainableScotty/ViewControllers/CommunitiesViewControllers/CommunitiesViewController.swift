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

    }
}


extension CommunitiesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return communities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.CommCellIdentifier, for: indexPath) as! CommunityCellTableViewCell
        // cell.header.text = communities[indexPath.row].title
        // cell.numUsers.text = "Size:  \(communities[indexPath.row].numUsers)"
        return cell
    }
}

extension CommunitiesViewController: UITableViewDelegate{
    var allowsSelectionDuringEditing: Bool { true }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "SwitchLeaderboard", sender: self)
    }
    
   /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? SpecificLeaderboard {
            destination.CommunityName = communities[(tableView.indexPathForSelectedRow?.row)!].title
            tableView.deselectRow(at: tableView.indexPathForSelectedRow!, animated: true)
        }
    }
    */
}
