//
//  BaseViewController.swift
//  Intern IOS Weak 3
//
//  Created by huy.dang on 8/19/24.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func backToPreviousScreen() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func goto(another screen: UIViewController) {
        self.navigationController?.pushViewController(screen, animated: true)
    }
}
