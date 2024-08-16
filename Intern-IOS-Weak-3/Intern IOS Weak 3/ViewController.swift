//
//  ViewController.swift
//  Intern IOS Weak 3
//
//  Created by huy.dang on 8/14/24.
//

import UIKit

class ViewController: UIViewController {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func gotoUITableView(_ sender: Any) {
        UIViewController.goToAnotherViewController(current: self, another: Week3UITableViewController())
    }
    
    @IBAction func gotoUICollectionView(_ sender: Any) {
        UIViewController.goToAnotherViewController(current: self, another: Week3UICollectionViewController())
    }
    
}

