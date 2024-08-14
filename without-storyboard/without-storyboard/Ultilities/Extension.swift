//
//  Extension.swift
//  without-storyboard
//
//  Created by huy.dang on 8/13/24.
//

import Foundation
import UIKit

extension UIImageView {
    static func createBlackLine() -> UIImageView {
        let blackLine: UIImageView = UIImageView()
        blackLine.contentMode = .scaleAspectFill
        blackLine.backgroundColor = UIColor.black
        blackLine.translatesAutoresizingMaskIntoConstraints = false
        return blackLine
    }
}

extension UILabel {
    static func createTitle(content: String, titleFont: UIFont) -> UILabel {
        let title: UILabel = UILabel()
        title.text = content
        title.font = titleFont
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }
}

extension UIButton {
    static func createBackButton() -> UIButton {
        let button: UIButton = UIButton()
        let config = UIImage.SymbolConfiguration(pointSize: 40, weight: .unspecified, scale: .unspecified)
        let icon = UIImage(systemName: "arrow.up.left", withConfiguration: config)
        button.setImage(icon, for: .normal)
        button.tintColor = UIColor.black
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    
    static func autoLayoutBackButton(button: UIButton, view: UIView) -> [NSLayoutConstraint] {
        let sequence = [button.topAnchor.constraint(equalTo: view.topAnchor, constant: 60), button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16)]
        return sequence
    }
}
