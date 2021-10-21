//
//  AllLeaderboards.swift
//  SustainableScotty
//
//  Created by Casper Wong on 10/21/21.
//

import UIKit
import Firebase

class AllCommunitiesViewController: CommunitiesViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }


    override func loadCommunities() {
        db.collection("communities").addSnapshotListener { (querySnapshot, err) in
            self.communities = []
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                if let snapshotDocuments = querySnapshot?.documents {
                    for doc in snapshotDocuments {
                        let data = doc.data()
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
