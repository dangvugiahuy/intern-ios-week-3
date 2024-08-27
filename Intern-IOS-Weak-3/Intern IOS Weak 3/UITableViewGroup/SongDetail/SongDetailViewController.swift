//
//  SongDetailViewController.swift
//  Dang Vu Gia Huy
//
//  Created by huy.dang on 8/27/24.
//

import UIKit

class SongDetailViewController: BaseViewController {
    
    var song: Songs?
        
    @IBOutlet weak var songNameLabel: UILabel!
    @IBOutlet weak var songArtistLabel: UILabel!
    @IBOutlet weak var songImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupData()
    }
    
    private func setupUI() {
        let menuButton = UIBarButtonItem(image: UIImage(systemName: "ellipsis.circle"), style: .plain, target: self, action: nil)
        self.navigationItem.rightBarButtonItem = menuButton
        songImageView.layer.masksToBounds = true
        songImageView.layer.cornerRadius = 32
    }
    
    private func setupData() {
        if let song = song {
            songImageView.image = UIImage(named: song.songImage)
            songNameLabel.text = song.songName
            songArtistLabel.text = song.artistName
        }
    }
}
