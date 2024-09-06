//
//  SearchHistoryTableViewCell.swift
//  Dang Vu Gia Huy
//
//  Created by huy.dang on 9/6/24.
//

import UIKit

protocol SearchHistoryTableViewCellDelegate: AnyObject {
    func deleteSearchContent(with indexPath: IndexPath)
}

class SearchHistoryTableViewCell: UITableViewCell {
    
    weak var delegate: SearchHistoryTableViewCellDelegate?
    
    var searchContent: String? {
        didSet {
            setupData()
        }
    }
    
    var indexPath: IndexPath?
    
    @IBOutlet weak var searchContentLabel: UILabel!
    
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
        delegate?.deleteSearchContent(with: indexPath!)
    }
}
