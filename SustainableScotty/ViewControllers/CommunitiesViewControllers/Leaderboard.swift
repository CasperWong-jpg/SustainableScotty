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
    
    var usersArray: [User] = []
    
    var joined: Bool = true

    @IBOutlet weak var LeaderboardTitle: UILabel!
    
    @IBOutlet weak var LeaderboardSize: UILabel!
    
    @IBOutlet weak var TableView: UITableView!
    
    @IBOutlet weak var JoinLeaveButton: UIButton!
    
    @IBOutlet weak var InviteOthers: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        LeaderboardTitle.text = "\(CommunityName) !!"
        loadUsers()
        
        // Table stuff
        TableView.dataSource = self
        
        TableView.register(UINib(nibName: K.LeaderboardNibName, bundle: nil), forCellReuseIdentifier: K.LeaderboardCellIdentifier)
    }
    
    func loadUsers() {
        // See: https://firebase.google.com/docs/firestore/query-data/queries?authuser=0
        db.collection("communities").whereField("CommunityName", isEqualTo: CommunityName).getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    let usersInCommunity = document.data()["Members"] as! Array<String>
                    let adminsInCommunity = document.data()["Admins"] as! Array<String>
                    
                    // Title stuff
                    self.LeaderboardSize.text = "Size: \(usersInCommunity.count)"
                                        
                    // Join & leave + invite stuff
                    if let buttonPresser = Auth.auth().currentUser?.email {
                        if usersInCommunity.contains(buttonPresser) {
                            self.JoinLeaveButton.setTitleColor(.red, for: .normal)
                            self.JoinLeaveButton.setTitle("Leave", for: .normal)
                            self.joined = true
                            if adminsInCommunity.contains(buttonPresser) {
                                self.InviteOthers.isHidden = false
                            }
                        }
                        else {
                            self.JoinLeaveButton.setTitleColor(.green, for: .normal)
                            self.JoinLeaveButton.setTitle("Join", for: .normal)
                            self.joined = false
                        }
                    }
                    else {
                        self.JoinLeaveButton.setTitle("Error authenticating user", for: .normal)
                    }
                    
                    // Back to table stuff
                    self.usersArray = []
                    if usersInCommunity.count == 0 {
                        DispatchQueue.main.async {
                            self.TableView.reloadData()
                        }
                    }
                    for userID in usersInCommunity {
                        // Get points of user from user database. ONLY WORKS FOR LOWER CASE
                        self.db.collection("users").document(userID).getDocument { (userInfo, error) in
                            if let userInfo = userInfo, userInfo.exists {
                                if let points = userInfo["coins"] as? Int {
                                    let newUser = User(name: userID, score: points)
                                    self.usersArray.append(newUser)
                                    
                                    // SLOW EFFICIENCY
                                    self.usersArray.sort(by: { $0.score > $1.score })
                                    print(self.usersArray)
                                    
                                    DispatchQueue.main.async {
                                        self.TableView.reloadData()
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    @IBAction func JoinLeavePressed(_ sender: Any) {
        if let buttonPresser = Auth.auth().currentUser?.email{
            if self.joined {
                db.collection("communities").document(CommunityName).updateData(["Members" : FieldValue.arrayRemove([buttonPresser])])
            }
            else {
                db.collection("communities").document(CommunityName).updateData(["Members" : FieldValue.arrayUnion([buttonPresser])])
            }
            self.joined = !self.joined
            self.viewDidLoad()
        }
            
        /*
        // Alternative method
        db.collection("communities").document(CommunityName).getDocument{ (document, error) in
            if let document = document, document.exists, let buttonPresser = Auth.auth().currentUser?.email {
                var newMembers = document["Members"] as! [String]
                
                if self.joined {
                    if let index = newMembers.firstIndex(of: buttonPresser) {
                        newMembers.remove(at: index)
                    }
                }
                else {
                    newMembers.append(buttonPresser)
                }
                self.db.collection("communities").document(self.CommunityName).updateData(["Members": newMembers])
                self.joined = !self.joined
                self.viewDidLoad()
            }
        }
        */
    }
    
    
    @IBAction func invitePressed(_ sender: Any) {
        print("You got me!")
    }
}



extension Leaderboard: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usersArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.LeaderboardCellIdentifier, for: indexPath) as! LeaderboardCell
        cell.NameCell.text = "\(usersArray[indexPath.row].name)"
        cell.ScoreCell.text = "\(usersArray[indexPath.row].score)"
        cell.PlacingCell.text = "\(indexPath.row + 1)"
        
        return cell
    }
}
