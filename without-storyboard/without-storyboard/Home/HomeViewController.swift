//
//  HomeViewController.swift
//  without-storyboard
//
//  Created by huy.dang on 8/13/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let button: UIButton = {
        let button: UIButton = UIButton(type: .roundedRect)
        button.setTitle("GET TICKET", for: .normal)
        button.backgroundColor = UIColor.black
        button.tintColor = UIColor.white
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let demoImage: UIImageView = {
        let demoImage: UIImageView = UIImageView()
        demoImage.image = UIImage(named: "demoImage")
        demoImage.contentMode = .scaleAspectFill
        demoImage.translatesAutoresizingMaskIntoConstraints = false
        return demoImage
    }()
    
    private let container: UILabel = {
        let container: UILabel = UILabel()
        container.text = """
At the heart of this exhibition lies the inspiration that flows from the depths of each created work. it offers a journey through the unique world of each author, where every image and word has its own meaning. The exhibition is full of colors and textures that come to life before the eyes of the audience, inviting them on a creative journey. Each element of the exhibition is a reflection of the author's soul, his own attitude to the world and his own feelings. This exhibition is the embodiment of art that is born from the heart and opens up a world of new possibilities.
"""
        container.textAlignment = .justified
        container.font = UIFont.systemFont(ofSize: 14)
        container.translatesAutoresizingMaskIntoConstraints = false
        container.numberOfLines = 0
        return container
    }()
    
    private let blackLine1: UIImageView = UIImageView.createBlackLine()
    
    private let blackLine2: UIImageView = UIImageView.createBlackLine()
    
    private let subTitle: UILabel = UILabel.createTitle(content: "ABOUT EXHIBITION", titleFont: UIFont.systemFont(ofSize: 17, weight: .semibold))
    
    private let bigTitle: UILabel = UILabel.createTitle(content: "CREATED FROM THE HEART", titleFont: UIFont.systemFont(ofSize: 24, weight: .semibold))
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        addConstraint()
    }
    
    func addConstraint() {
        var constraints = [NSLayoutConstraint]()
        
        constraints.append(contentsOf: [demoImage.topAnchor.constraint(equalTo: view.topAnchor),
                                        demoImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                        demoImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                                        demoImage.heightAnchor.constraint(equalTo: demoImage.widthAnchor, multiplier: 1)])
        
        constraints.append(contentsOf: [button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
                                        button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
                                        button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
                                        button.heightAnchor.constraint(equalToConstant: 40)])
        
        constraints.append(contentsOf: [container.bottomAnchor.constraint(greaterThanOrEqualTo: button.topAnchor, constant: -100),
                                        container.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
                                        container.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)])
        
        constraints.append(contentsOf: [blackLine1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
                                        blackLine1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
                                        blackLine1.bottomAnchor.constraint(equalTo: container.topAnchor, constant: -10),
                                        blackLine1.heightAnchor.constraint(equalToConstant: 2)])
        
        constraints.append(contentsOf: [subTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
                                        subTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
                                        subTitle.bottomAnchor.constraint(equalTo: blackLine1.topAnchor, constant: -10)])
        
        constraints.append(contentsOf: [blackLine2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
                                        blackLine2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
                                        blackLine2.bottomAnchor.constraint(equalTo: subTitle.topAnchor, constant: -15),
                                        blackLine2.heightAnchor.constraint(equalToConstant: 2)])
        
        constraints.append(contentsOf: [bigTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
                                        bigTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
                                        bigTitle.bottomAnchor.constraint(equalTo: blackLine2.topAnchor, constant: -10),
                                        bigTitle.topAnchor.constraint(equalTo: demoImage.bottomAnchor, constant: 50)])
        
        NSLayoutConstraint.activate(constraints)
    }
    
    func setupUI() {
        view.addSubview(button)
        view.addSubview(demoImage)
        view.addSubview(container)
        view.addSubview(blackLine1)
        view.addSubview(subTitle)
        view.addSubview(blackLine2)
        view.addSubview(bigTitle)
    }
}

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
