//
//  Extension.swift
//  Intern IOS Weak 3
//
//  Created by huy.dang on 8/15/24.
//

import Foundation
import UIKit

extension UIViewController {
    
    static func goToAnotherViewController(current crvc: UIViewController, another anvc: UIViewController) {
        crvc.navigationController?.pushViewController(anvc, animated: true)
    }
    
}
