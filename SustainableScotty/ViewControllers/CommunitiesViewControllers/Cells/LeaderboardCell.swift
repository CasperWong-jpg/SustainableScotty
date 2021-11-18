//
//  LeaderboardCell.swift
//  SustainableScotty
//
//  Created by Casper Wong on 11/18/21.
//

import UIKit

class LeaderboardCell: UITableViewCell {

    @IBOutlet weak var PlacingCell: UILabel!
    
    @IBOutlet weak var ScoreCell: UILabel!
    
    @IBOutlet weak var NameCell: UILabel!
    
    @IBOutlet weak var ImageCell: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
