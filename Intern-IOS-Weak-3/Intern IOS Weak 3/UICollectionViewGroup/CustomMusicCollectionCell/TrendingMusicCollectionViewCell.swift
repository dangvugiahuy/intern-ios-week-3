//
//  TrendingMusicCollectionViewCell.swift
//  Intern IOS Weak 3
//
//  Created by huy.dang on 8/16/24.
//

import UIKit

class TrendingMusicCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var musicImage: UIImageView!
    @IBOutlet weak var musicInfo: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        musicImage.layer.masksToBounds = true
        musicImage.layer.cornerRadius = 20
    }

}
