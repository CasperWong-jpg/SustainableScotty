//
//  ActionsCell.swift
//  SustainableScotty
//
//  Created by Sophia Lau on 10/31/21.
//

import UIKit

class ActionsCell: UITableViewCell {

    @IBOutlet weak var actionTitle: UILabel!
    @IBOutlet weak var timesLogged: UILabel!
    @IBOutlet weak var coinReward: UILabel!
    
    @IBOutlet weak var actionImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Do any additional setup after loading the view.
    }
   
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
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
