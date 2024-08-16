//
//  CustomCollectionViewCell.swift
//  Intern IOS Weak 3
//
//  Created by huy.dang on 8/16/24.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var artistImage: UIImageView!
    @IBOutlet weak var artistNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        artistImage.layer.masksToBounds = true
        artistImage.layer.cornerRadius = artistImage.frame.height / 2
    }

}
