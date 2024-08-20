//
//  Week3UIStackViewController.swift
//  Intern IOS Weak 3
//
//  Created by huy.dang on 8/14/24.
//

import UIKit

class Week3UIStackViewController: BaseViewController {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 20
    }
    
    @IBAction func goToPreviousScreen(_ sender: Any) {
        self.backToPreviousScreen()
    }
}
