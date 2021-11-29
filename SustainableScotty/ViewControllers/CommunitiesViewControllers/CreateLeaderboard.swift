//
//  CreateLeaderboard.swift
//  SustainableScotty
//
//  Created by Casper Wong on 11/18/21.
//

import UIKit
import Firebase

class CreateLeaderboard: UIViewController {

    @IBOutlet weak var CommunityName: UITextField!
    @IBOutlet weak var CreateButton: UIButton!
    let db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CreateButton.circleCorner()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func ButtonPressed(_ sender: Any) {
        if let name = CommunityName.text, name != "", let groupCreator = Auth.auth().currentUser?.email {
            //var ref: DocumentReference? = nil
            db.collection("communities").document(name).setData([
                "CommunityName": name,
                "Members": [groupCreator],
                "Admins": [groupCreator]
            ]) { err in
                if let err = err {
                    print("Error adding document: \(err)")
                } else {
                    print("Document added!")
                    self.navigationController?.popViewController(animated: true)
                }
            }
        }
        else {
            print("Error: either group name cannot be empty, or you are not logged in")
        }
    }
    
}
