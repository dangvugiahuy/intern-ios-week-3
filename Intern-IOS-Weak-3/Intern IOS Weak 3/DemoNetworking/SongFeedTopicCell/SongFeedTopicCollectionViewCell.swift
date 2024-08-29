//
//  SongFeedTopicCollectionViewCell.swift
//  Dang Vu Gia Huy
//
//  Created by huy.dang on 8/28/24.
//

import UIKit

class SongFeedTopicCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var topicButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    private func setUIForSelected() {
        topicButton.backgroundColor = UIColor(named: "Primary500")
        topicButton.tintColor = UIColor.white
    }
    
    private func setUIForNormal() {
        topicButton.backgroundColor = UIColor.clear
        topicButton.tintColor = UIColor(named: "Primary500")
    }
    
    @IBAction func selected(_ sender: Any) {
        if topicButton.isSelected == false {
            setUIForSelected()
        } else {
            setUIForNormal()
        }
    }
}
