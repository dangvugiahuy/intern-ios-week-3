//
//  LandingViewController.swift
//  Dang Vu Gia Huy
//
//  Created by huy.dang on 8/27/24.
//

import UIKit

class LandingViewController: UIViewController {

    @IBOutlet weak var containView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        containView.layer.masksToBounds = true
        containView.layer.cornerRadius = 60
    }
}
