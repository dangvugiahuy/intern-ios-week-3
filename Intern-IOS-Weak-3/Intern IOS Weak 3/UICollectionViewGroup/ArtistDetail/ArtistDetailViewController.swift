//
//  ArtistDetailViewController.swift
//  Intern IOS Weak 3
//
//  Created by huy.dang on 8/16/24.
//

import UIKit

class ArtistDetailViewController: BaseViewController {
    
    var artist: Artist?
    var songs: [Songs]?

    @IBOutlet weak var artistSongsTableView: UITableView!
    @IBOutlet weak var artistImageView: UIImageView!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var artistNumberFollowLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        let nib = UINib(nibName: "SongTableViewCell", bundle: .main)
        artistSongsTableView.register(nib, forCellReuseIdentifier: "cell")
        artistSongsTableView.delegate = self
        artistSongsTableView.dataSource = self
    }
    
    private func setupUI() {
        if let artist = artist {
            artistImageView.image = UIImage(named: "\(artist.artistAvt)")
            artistImageView.layer.masksToBounds = true
            artistImageView.layer.cornerRadius = artistImageView.bounds.width / 2
            artistNameLabel.text = artist.artistName
            artistNumberFollowLabel.text = "\(artist.follower.formatted()) Followers"
        }
    }
    @IBAction func backToPreviousScreen(_ sender: Any) {
        self.backToPreviousScreen()
    }
}

extension ArtistDetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let songs = songs {
            return songs.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = artistSongsTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SongTableViewCell
        if let songs = songs {
            cell.song = songs[indexPath.row]
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 96
    }
}
