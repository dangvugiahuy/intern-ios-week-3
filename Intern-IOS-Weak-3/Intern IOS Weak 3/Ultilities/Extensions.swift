//
//  Extension.swift
//  Intern IOS Weak 3
//
//  Created by huy.dang on 8/15/24.
//

import Foundation
import UIKit


extension UIImageView {
    func load(from urlString: String) {
        guard let url = URL(string: urlString) else { return }
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
