//
//  SongFeedViewController.swift
//  Dang Vu Gia Huy
//
//  Created by huy.dang on 8/28/24.
//

import UIKit

class SongFeedViewController: UIViewController {
    
    private let topics: [Topics] = Topics.getAllTopics()
    private var songs: [SongsObject] = [SongsObject]()
    private let service: SongsService = SongsService()
    private var isfilted: Bool = false

    @IBOutlet weak var topicCollectionView: UICollectionView!
    @IBOutlet var viewTapGesture: UITapGestureRecognizer!
    @IBOutlet weak var searchBarView: UIView!
    @IBOutlet weak var contentNotFoundView: UIView!
    @IBOutlet weak var loadingSongIndicator: UIActivityIndicatorView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var songFeedTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupFirstLoadViewController()
        fetchData()
    }
    
    private func setupFirstLoadViewController() {
        
        contentNotFoundView.isHidden = true
        viewTapGesture.cancelsTouchesInView = false
        
        searchBarView.layer.masksToBounds = true
        searchBarView.layer.cornerRadius = 16
        
        let nib = UINib(nibName: "SongFeedTableViewCell", bundle: .main)
        songFeedTableView.register(nib, forCellReuseIdentifier: "songAPICell")
        songFeedTableView.dataSource = self
        songFeedTableView.delegate = self
        searchTextField.delegate = self
        
        let collectionViewCellNib = UINib(nibName: "SongFeedTopicCollectionViewCell", bundle: .main)
        topicCollectionView.register(collectionViewCellNib, forCellWithReuseIdentifier: "topicCell")
        topicCollectionView.delegate = self
        topicCollectionView.dataSource = self
    }
    
    private func fetchData() {
        loadingSongIndicator.isHidden = false
        loadingSongIndicator.startAnimating()
        service.getSongs(inTop: 10) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let model):
                    self.songs = model
                    self.songFeedTableView.reloadData()
                case .failure(let failure):
                    print(failure)
                }
                self.loadingSongIndicator.isHidden = true
                self.loadingSongIndicator.stopAnimating()
            }
        }
    }
    
    private func filterSongsByArtistOrName(list songs: inout [SongsObject], content: String) -> Bool {
        let filter: [SongsObject] = songs.filter {
            $0.name.lowercased().contains(content.lowercased()) || $0.artistName.lowercased().contains(content.lowercased())
        }
        songs = filter.isEmpty ? [SongsObject]() : filter
        isfilted.toggle()
        return songs.isEmpty
    }
    
    private func showSongsListAfterSearch() {
        if let content = searchTextField.text {
            if filterSongsByArtistOrName(list: &songs, content: content) {
                contentNotFoundView.isHidden = false
            } else {
                songFeedTableView.reloadData()
            }
        }
    }
    
    private func refreshSonglist() {
        if !searchTextField.hasText {
            if isfilted {
                if !contentNotFoundView.isHidden {
                    contentNotFoundView.isHidden.toggle()
                }
                fetchData()
                isfilted.toggle()
            }
        }
    }
    
    @IBAction func tapOutOfTextField(_ sender: Any) {
        if searchTextField.isEditing {
            searchTextField.endEditing(true)
            viewTapGesture.cancelsTouchesInView = false
        }
    }
    
    @IBAction func handleUserDeleteSearchContentWithoutClearButton(_ sender: Any) {
        refreshSonglist()
    }
}

extension SongFeedViewController: UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return topics.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = topicCollectionView.dequeueReusableCell(withReuseIdentifier: "topicCell", for: indexPath) as! SongFeedTopicCollectionViewCell
        let topic = topics[indexPath.row]
        cell.topic = topic
        return cell
    }
    
//    Handle collection cell width fit content (incomplete)
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: topics[].sizeWith, height: <#T##Double#>)
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
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
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        showSongsListAfterSearch()
        searchTextField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        refreshSonglist()
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        viewTapGesture.cancelsTouchesInView = true
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        refreshSonglist()
        return true
    }
}
