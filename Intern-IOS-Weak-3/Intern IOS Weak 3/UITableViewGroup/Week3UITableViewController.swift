//
//  Week3UITableViewController.swift
//  Intern IOS Weak 3
//
//  Created by huy.dang on 8/14/24.
//

import UIKit

class Week3UITableViewController: BaseViewController {
    
    var songList: [Songs] = Songs.getDemoSongsList()
    
    
    @IBOutlet weak var songListTableView: UITableView!
    @IBOutlet weak var searchBarView: UIView!
    @IBOutlet weak var searchTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    
    //Can't handle (temponary)
    private func updateTableViewAfterSearch(list: inout [Songs], content: String) {
        let temp = list.filter {
            $0.songName.lowercased().contains(content)
        }
        list = temp
//        songListTableView.reloadData()
    }
    
    private func refreshSongList(list: inout [Songs]) {
        list = Songs.getDemoSongsList()
        songListTableView.reloadData()
    }
    
    @IBAction func goBackToPreviousView(_ sender: Any) {
        self.backToPreviousScreen()
    }
}

extension Week3UITableViewController: UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
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
        searchTextField.resignFirstResponder()
        return true
    }
}
