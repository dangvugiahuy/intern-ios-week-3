//
//  SongFeedViewController.swift
//  Dang Vu Gia Huy
//
//  Created by huy.dang on 8/28/24.
//

import UIKit

class SongFeedViewController: UIViewController {
    
    private var songs: [SongsObject] = [SongsObject]()
    private let service: APIService = APIService()

    @IBOutlet weak var searchBarView: UIView!
    @IBOutlet weak var loadingSongIndicator: UIActivityIndicatorView!
    @IBOutlet weak var songFeedTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupFirstLoadViewController()
        fetchData()
    }
    
    private func setupFirstLoadViewController() {
        
        loadingSongIndicator.isHidden = false
        
        searchBarView.layer.masksToBounds = true
        searchBarView.layer.cornerRadius = 16
        
        let nib = UINib(nibName: "SongFeedTableViewCell", bundle: .main)
        songFeedTableView.register(nib, forCellReuseIdentifier: "songAPICell")
        songFeedTableView.dataSource = self
        songFeedTableView.delegate = self
    }
    
    private func fetchData() {
        loadingSongIndicator.startAnimating()
        service.getSongs { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let model):
                    self.songs.append(contentsOf: model)
                    self.songFeedTableView.reloadData()
                case .failure(let failure):
                    print(failure)
                }
                self.loadingSongIndicator.isHidden = true
                self.loadingSongIndicator.stopAnimating()
            }
        }
    }
}

extension SongFeedViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = songFeedTableView.dequeueReusableCell(withIdentifier: "songAPICell", for: indexPath) as! SongFeedTableViewCell
        let song = songs[indexPath.row]
        cell.song = song
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 96
    }
}
