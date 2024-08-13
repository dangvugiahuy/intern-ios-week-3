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
        let config = UIImage.SymbolConfiguration(pointSize: 30, weight: .medium, scale: .default)
        let icon = UIImage(systemName: "arrow.up.left", withConfiguration: config)
        button.setImage(icon, for: .normal)
        button.tintColor = UIColor.black
        return button
    }
}
