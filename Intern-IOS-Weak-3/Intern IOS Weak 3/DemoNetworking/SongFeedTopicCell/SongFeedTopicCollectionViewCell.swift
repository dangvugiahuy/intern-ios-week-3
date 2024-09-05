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
    @IBOutlet weak var topicLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    override func prepareForReuse() {
        
    }
    
    private func setupData() {
        if let topic = topic {
            topicLabel.text = topic.name
        }
    }
    
    private func setupUI() {
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 20
        self.layer.borderColor = UIColor(named: "Primary500")?.cgColor
        self.layer.borderWidth = 2
        
        let normalView = UIView(frame: self.bounds)
        normalView.backgroundColor = .clear
        self.backgroundView = normalView
        
        let selectedView = UIView(frame: self.bounds)
        selectedView.backgroundColor = UIColor(named: "Primary500")
        self.selectedBackgroundView = selectedView
    }
}
