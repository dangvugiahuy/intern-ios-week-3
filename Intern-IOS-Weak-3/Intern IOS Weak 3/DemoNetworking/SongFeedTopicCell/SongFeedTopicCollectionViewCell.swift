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
        setUI()
    }
    
    override func prepareForReuse() {
        topicButton.isSelected = false
        self.isSelected = false
    }
    
    private func setupData() {
        if let topic = topic {
            topicButton.setTitle(topic.name, for: .normal)
            topicButton.setTitle(topic.name, for: .selected)
            if topic.isChoose {
                topicButton.isSelected = true
                self.isSelected = topic.isChoose
            }
        }
    }
    
    private func setUI() {
        topicButton.setTitleColor(UIColor(named: "Primary500"), for: .normal)
        topicButton.setTitleColor(.white, for: .selected)
        topicButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        topicButton.layer.masksToBounds = true
        topicButton.layer.cornerRadius = topicButton.layer.bounds.height / 2
        topicButton.layer.borderColor = UIColor(named: "Primary500")?.cgColor
        topicButton.layer.borderWidth = 2
    }

    @IBAction func selected(_ sender: Any) {
        guard let topic = topic else { return }
        topic.isChoose.toggle()
        topicButton.isSelected = topic.isChoose
        self.isSelected = topic.isChoose
        if topicButton.isSelected {
            topicButton.backgroundColor = UIColor(named: "Primary500")
        } else {
            topicButton.backgroundColor = .clear
        }
    }
}
