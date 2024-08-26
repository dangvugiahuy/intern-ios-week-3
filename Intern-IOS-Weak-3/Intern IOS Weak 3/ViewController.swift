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
        self.setupNavigationBarItem()
    }
    
    @IBAction func gotoUITableView(_ sender: Any) {
        self.goto(another: Week3UITableViewController())
    }
    
    @IBAction func gotoUICollectionView(_ sender: Any) {
        self.goto(another: Week3UICollectionViewController())
    }
    
    @IBAction func gotoUIStackView(_ sender: Any) {
        self.goto(another: Week3UIStackViewController())
    }
    
    @IBAction func goToUIScrollView(_ sender: Any) {
        self.goto(another: Week3UIScrollViewController())
    }
    
}

