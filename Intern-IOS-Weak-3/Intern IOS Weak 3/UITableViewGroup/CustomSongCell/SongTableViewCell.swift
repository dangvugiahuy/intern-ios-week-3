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
    @IBOutlet weak var addSongFavoriteButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    override func prepareForReuse() {
        refreshCellState()
    }
    
    private func setupDataForCell() {
        if let song  = song {
            songImageView.image = UIImage(named: song.songImage)
            songNameLabel.text = song.songName
            songArtistNameLabel.text = song.artistName
            if song.isliked {
                addSongFavoriteButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            }
        }
    }
    
    private func setupUI() {
        songImageView.layer.masksToBounds = true
        songImageView.layer.cornerRadius = 20
    }
    
    private func refreshCellState() {
        songImageView.image = UIImage()
        songNameLabel.text = ""
        songArtistNameLabel.text = ""
        addSongFavoriteButton.setImage(UIImage(systemName: "heart"), for: .normal)
    }
    
    
    @IBAction func addSongToFavorite(_ sender: Any) {
        switch song?.isliked {
        case true:
            song?.isliked = false
            addSongFavoriteButton.setImage(UIImage(systemName: "heart"), for: .normal)
        default:
            song?.isliked = true
            addSongFavoriteButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        }
    }
}
