//
//  SongFeedTableViewCell.swift
//  Dang Vu Gia Huy
//
//  Created by huy.dang on 8/28/24.
//

import UIKit

class SongFeedTableViewCell: UITableViewCell {
    
    var song: SongsObject? {
        didSet {
            setupData()
        }
    }

    @IBOutlet weak var songImageView: UIImageView!
    @IBOutlet weak var songNameLabel: UILabel!
    @IBOutlet weak var songArtistLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    private func setupUI() {
        songImageView.contentMode = .scaleAspectFill
        songImageView.layer.masksToBounds = true
        songImageView.layer.cornerRadius = 20
    }
    
    private func setupData() {
        if let song = song {
            songNameLabel.text = song.name
            songArtistLabel.text = song.artistName
            songImageView.load(from: song.artworkUrl100!)
        }
    }
}
