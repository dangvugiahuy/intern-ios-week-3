//
//  Week3UICollectionViewController.swift
//  Intern IOS Weak 3
//
//  Created by huy.dang on 8/14/24.
//

import UIKit

class Week3UICollectionViewController: UIViewController {
    
    let artistList: [Artist] = Artist.getDemoArtistList()
    let musicList: [Songs] = Songs.getDemoSongsList()
    
    @IBOutlet weak var artistCollectionView: UICollectionView!
    @IBOutlet weak var trendingMusicList: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView(collection: artistCollectionView, nibName: "CustomCollectionViewCell", CellId: "artistCell")
        setupCollectionView(collection: trendingMusicList, nibName: "TrendingMusicCollectionViewCell", CellId: "musicCell")
    }
    
    @IBAction func goBackToPreviousView(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    private func setupCollectionView(collection: UICollectionView, nibName: String, CellId: String) {
        let nib = UINib(nibName: "\(nibName)", bundle: .main)
        collection.register(nib, forCellWithReuseIdentifier: "\(CellId)")
        collection.delegate = self
        collection.dataSource = self
    }
}

extension Week3UICollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == trendingMusicList {
            return musicList.count
        }
        return artistList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == trendingMusicList {
            let cell = trendingMusicList.dequeueReusableCell(withReuseIdentifier: "musicCell", for: indexPath) as! TrendingMusicCollectionViewCell
            let song: Songs = musicList[indexPath.row]
            cell.musicImage.image = UIImage(named: "\(song.songImage)")
            cell.musicInfo.text = song.songName + " - " + song.artistName
            return cell
        }
        let cell = artistCollectionView.dequeueReusableCell(withReuseIdentifier: "artistCell", for: indexPath) as! CustomCollectionViewCell
        let artist: Artist = artistList[indexPath.row]
        cell.artistImage.image = UIImage(named: "\(artist.artistAvt)")
        cell.artistNameLabel.text = artist.artistName
        return cell
    }
    
}
