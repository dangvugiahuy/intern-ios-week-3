//
//  ArtDetailViewController.swift
//  Intern IOS Weak 3
//
//  Created by huy.dang on 8/15/24.
//

import UIKit

class ArtDetailViewController: UIViewController {
    
    @IBOutlet weak var artImage: UIImageView!
    @IBOutlet weak var artLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var artDescription: UILabel!
    @IBOutlet weak var backButton: UIButton!
    
    var art: Art?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    @IBAction func goBackToPreviousView(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    private func setupUI() {
        if let artItem = art {
            artImage.image = UIImage(named: "\(artItem.imageName)")
            artLabel.text = artItem.name
            artistNameLabel.text = artItem.artisName
            artDescription.text = artItem.description
            artDescription.textAlignment = .justified
        }
    }
}
