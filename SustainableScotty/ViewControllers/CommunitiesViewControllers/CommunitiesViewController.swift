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
        // AllCommunitiesButton.circleCorner()
        
        // Load and format table data (leaderboard items)
        loadCommunities()
        
        CommunitiesTableView.dataSource = self
        CommunitiesTableView.delegate = self
        
        CommunitiesTableView.register(UINib(nibName: K.CommNibName, bundle: nil), forCellReuseIdentifier: K.CommCellIdentifier)
    }
    
    func loadCommunities() {
        db.collection("communities").addSnapshotListener { (querySnapshot, err) in
            self.communities = []
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                if let snapshotDocuments = querySnapshot?.documents {
                    for doc in snapshotDocuments {
                        let data = doc.data()
                        let usersInCommunity = data["Members"] as! Array<String>
                        // SLOW EFFICIENCY: Probably faster to have an array in users database containing communities they are in, rather than checking if each community contains user
                        if let user = Auth.auth().currentUser?.email, usersInCommunity.contains(user) {
                            if let newTitle = data["CommunityName"] as? String, let members = data["Members"] as? Array<Any> {
                                let newCommunity = Community(title: newTitle, numUsers: members.count)
                                self.communities.append(newCommunity)
                                
                                DispatchQueue.main.async {
                                    self.CommunitiesTableView.reloadData()
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}


extension CommunitiesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return communities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.CommCellIdentifier, for: indexPath) as! CommunityCell
        cell.header.text = communities[indexPath.row].title
        cell.numUsers.text = "Size:  \(communities[indexPath.row].numUsers)"
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
