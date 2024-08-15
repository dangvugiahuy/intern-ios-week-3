//
//  ArtTableViewCell.swift
//  Intern IOS Weak 3
//
//  Created by huy.dang on 8/15/24.
//

import UIKit

class ArtTableViewCell: UITableViewCell {

    @IBOutlet weak var artImage: UIImageView!
    @IBOutlet weak var artName: UILabel!
    @IBOutlet weak var artDate: UILabel!
    @IBOutlet weak var artistName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
