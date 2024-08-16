//
//  Week3UITableViewController.swift
//  Intern IOS Weak 3
//
//  Created by huy.dang on 8/14/24.
//

import UIKit

class Week3UITableViewController: UIViewController {
    
    let artArray: [Art] = Art.getDemoArtList()

    @IBOutlet weak var artList: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let customCellNib = UINib(nibName: "ArtTableViewCell", bundle: .main)
        artList.register(customCellNib, forCellReuseIdentifier: "cell")
        artList.delegate = self
        artList.dataSource = self
    }
    
    @IBAction func goBackToPreviousView(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension Week3UITableViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return artArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = artList.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ArtTableViewCell
        let art = artArray[indexPath.row]
        cell.artImage.image = UIImage(named: art.imageName)
        cell.artName.text = art.name
        cell.artDate.text = "\(art.date)"
        cell.artistName.text = art.artisName
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 350
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = ArtDetailViewController()
        vc.art = artArray[indexPath.row]
        UIViewController.goToAnotherViewController(current: self, another: vc)
    }
}
