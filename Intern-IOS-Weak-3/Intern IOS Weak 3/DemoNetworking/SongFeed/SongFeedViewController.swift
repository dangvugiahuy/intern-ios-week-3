//
//  SongFeedViewController.swift
//  Dang Vu Gia Huy
//
//  Created by huy.dang on 8/28/24.
//

import UIKit

class SongFeedViewController: UIViewController {
    
    private let userdefaults = UserDefaults.standard
    private var searchHistory: [String] = [String]()
    private let topics: [Topics] = Topics.getAllTopics()
    private var songs: [SongsObject] = [SongsObject]()
    private let service: SongsService = SongsService()
    private var isfilted: Bool = false
    private var mediatype: String = ""
    private var type: String = ""
    private var feed: String = ""

    @IBOutlet weak var searchHistoryTableView: UITableView!
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
        topicCollectionView.selectItem(at: IndexPath(row: 0, section: 0), animated: false, scrollPosition: .centeredHorizontally)
        fetchData()
    }
    
    private func setupFirstLoadViewController() {
        
        searchHistory = userdefaults.stringArray(forKey: "SearchHistory") ?? []
        
        mediatype = topics[0].mediatype
        type = topics[0].type
        feed = topics[0].feed
        
        searchHistoryTableView.isHidden = true
        contentNotFoundView.isHidden = true
        viewTapGesture.cancelsTouchesInView = false
        
        searchBarView.layer.masksToBounds = true
        searchBarView.layer.cornerRadius = 16
        
        let songTableCellNib = UINib(nibName: "SongFeedTableViewCell", bundle: .main)
        songFeedTableView.register(songTableCellNib, forCellReuseIdentifier: "songCell")
        songFeedTableView.dataSource = self
        songFeedTableView.delegate = self
        
        let searchTableCellNib = UINib(nibName: "SearchHistoryTableViewCell", bundle: .main)
        searchHistoryTableView.register(searchTableCellNib, forCellReuseIdentifier: "searchCell")
        searchHistoryTableView.dataSource = self
        searchHistoryTableView.delegate = self
        
        let topicsCollectionCellNib = UINib(nibName: "SongFeedTopicCollectionViewCell", bundle: .main)
        topicCollectionView.register(topicsCollectionCellNib, forCellWithReuseIdentifier: "topicCell")
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        collectionViewLayout.scrollDirection = .horizontal
        topicCollectionView.collectionViewLayout = collectionViewLayout
        topicCollectionView.delegate = self
        topicCollectionView.dataSource = self
        
        searchTextField.delegate = self
    }
    
    private func fetchData() {
        loadingSongIndicator.isHidden = false
        loadingSongIndicator.startAnimating()
        service.getSongs(mediatype: mediatype, type: type, feed: feed) { result in
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
        var filter: [SongsObject] = [SongsObject]()
        if type == "playlists" {
            filter = songs.filter {
                $0.name.lowercased().contains(content.lowercased())
            }
        } else {
            filter = songs.filter {
                $0.name.lowercased().contains(content.lowercased()) || $0.artistName!.lowercased().contains(content.lowercased())
            }
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
    
    private func updateSearchHistory(_ list: inout [String]) {
        list.append(searchTextField.text!)
        userdefaults.setValue(list, forKey: "SearchHistory")
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        mediatype = topics[indexPath.row].mediatype
        type = topics[indexPath.row].type
        feed = topics[indexPath.row].feed
        fetchData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch tableView {
        case searchHistoryTableView:
            return searchHistory.count
        default:
            return songs.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch tableView {
        case searchHistoryTableView:
            let cell = songFeedTableView.dequeueReusableCell(withIdentifier: "searchCell", for: indexPath) as! SearchHistoryTableViewCell
            cell.searchContent = searchHistory[indexPath.row]
            return cell
        default:
            let cell = songFeedTableView.dequeueReusableCell(withIdentifier: "songCell", for: indexPath) as! SongFeedTableViewCell
            let song = songs[indexPath.row]
            cell.song = song
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 96
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchHistoryTableView.isHidden = true
        updateSearchHistory(&searchHistory)
        showSongsListAfterSearch()
        searchTextField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        searchHistoryTableView.reloadData()
        refreshSonglist()
        searchHistoryTableView.isHidden = true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        viewTapGesture.cancelsTouchesInView = true
        searchHistoryTableView.isHidden = false
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        refreshSonglist()
        return true
    }
}
