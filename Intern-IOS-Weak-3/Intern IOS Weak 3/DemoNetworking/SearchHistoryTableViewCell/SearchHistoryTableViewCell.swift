//
//  SearchHistoryTableViewCell.swift
//  Dang Vu Gia Huy
//
//  Created by huy.dang on 9/5/24.
//

import UIKit

class SearchHistoryTableViewCell: UITableViewCell {
    
    var searchContent: String? {
        didSet {
            setupData()
        }
    }

    @IBOutlet weak var searchContentLabel: UILabel!
    @IBOutlet weak var deleteSearchContentButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    private func setupData() {
        if let searchContent = searchContent {
            searchContentLabel.text = searchContent
        }
    }
    
    @IBAction func deleteSearchContent(_ sender: Any) {
        
    }
}
