//
//  ViewController.swift
//  Intern IOS Weak 3
//
//  Created by huy.dang on 8/14/24.
//

import UIKit

class ViewController: BaseViewController {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func gotoUITableView(_ sender: Any) {
        self.goto(another: Week3UITableViewController())
    }
    
    @IBAction func gotoUICollectionView(_ sender: Any) {
        self.goto(another: Week3UICollectionViewController())
    }
    
}

