//
//  SongTableViewCell.swift
//  Intern IOS Weak 3
//
//  Created by huy.dang on 8/19/24.
//

import UIKit

class SongTableViewCell: UITableViewCell {
    
    var song: Songs? {
        didSet {
            setupDataForCell()
        }
    }
    
    @IBOutlet weak var songImageView: UIImageView!
    @IBOutlet weak var songNameLabel: UILabel!
    @IBOutlet weak var songArtistNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    override func prepareForReuse() {
        
    }
    
    private func setupDataForCell() {
        if let song  = song {
            songImageView.image = UIImage(named: song.songImage)
            songNameLabel.text = song.songName
            songArtistNameLabel.text = song.artistName
        }
    }
    
    private func setupUI() {
        songImageView.layer.masksToBounds = true
        songImageView.layer.cornerRadius = 20
    }
}
