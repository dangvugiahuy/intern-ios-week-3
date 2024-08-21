//
//  Week3UITableViewController.swift
//  Intern IOS Weak 3
//
//  Created by huy.dang on 8/14/24.
//

import UIKit

class Week3UITableViewController: BaseViewController {
    
    var songList: [Songs] = [Songs]()
    
    @IBOutlet weak var songListTableView: UITableView!
    @IBOutlet weak var searchBarView: UIView!
    @IBOutlet weak var searchTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupData(list: &songList)
        setupUI()
        let customCellNib = UINib(nibName: "SongTableViewCell", bundle: .main)
        songListTableView.register(customCellNib, forCellReuseIdentifier: "cell")
        songListTableView.delegate = self
        songListTableView.dataSource = self
        searchTextField.delegate = self
    }
    
    private func setupUI() {
        searchBarView.layer.masksToBounds = true
        searchBarView.layer.cornerRadius = 16
    }
    
    private func setupData(list: inout [Songs]) {
        list = Songs.getDemoSongsList()
    }
    
    private func updateTableViewAfterSearch(list: inout [Songs], content: String) {
        let filter: [Songs] = list.filter {
            $0.songName.lowercased().contains(content.lowercased())
        }
        list = filter.isEmpty ? Songs.getDemoSongsList() : filter
    }
    
    @IBAction func goBackToPreviousView(_ sender: Any) {
        self.backToPreviousScreen()
    }
    
    @IBAction func endEditSearch(_ sender: Any) {
        searchTextField.resignFirstResponder()
    }
    
    @IBAction func tapOutOfTextField(_ sender: Any) {
        if searchTextField.isEditing {
            searchTextField.endEditing(true)
        }
    }
}

extension Week3UITableViewController: UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = songListTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SongTableViewCell
        let song = songList[indexPath.row]
        cell.song = song
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        updateTableViewAfterSearch(list: &songList, content: searchTextField.text!)
        songListTableView.reloadData()
        searchTextField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if searchTextField.hasText == false {
            songList = Songs.getDemoSongsList()
            songListTableView.reloadData()
        }
    }
}
