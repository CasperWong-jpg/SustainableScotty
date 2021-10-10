//
//  CommunityCellTableViewCell.swift
//  SustainableScotty
//
//  Created by Casper Wong on 10/7/21.
//

import UIKit

class CommunityCellTableViewCell: UITableViewCell {
    
    @IBOutlet weak var header: UILabel!
    
    @IBOutlet weak var numUsers: UILabel!
    
    @IBOutlet weak var communityImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        communityImage.layer.cornerRadius = communityImage.frame.size.height / 5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
