//
//  SongFeedTopicCollectionViewCell.swift
//  Dang Vu Gia Huy
//
//  Created by huy.dang on 8/28/24.
//

import UIKit

class SongFeedTopicCollectionViewCell: UICollectionViewCell {
    
    var topic: Topics? {
        didSet {
           setupData()
        }
    }
    
    @IBOutlet weak var topicButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    private func setupData() {
        if let topic = topic {
            topicButton.titleLabel?.text = topic.name
        }
    }

    private func setUIForSelected() {
        topicButton.configuration?.background.backgroundColor = UIColor(named: "Primary500")
        topicButton.configuration?.baseForegroundColor = .white
    }
    
    private func setUIForNormal() {
        topicButton.configuration?.background.backgroundColor = .clear
        topicButton.configuration?.baseForegroundColor = UIColor(named: "Primary500")
    }
    
    @IBAction func selected(_ sender: Any) {
        if topicButton.isSelected == false {
            topicButton.isSelected.toggle()
            setUIForSelected()
        } else {
            topicButton.isSelected.toggle()
            setUIForNormal()
        }
    }
}
