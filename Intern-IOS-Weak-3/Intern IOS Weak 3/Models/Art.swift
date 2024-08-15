//
//  Art.swift
//  Intern IOS Weak 3
//
//  Created by huy.dang on 8/15/24.
//

import Foundation

class Art {
    let name: String
    let imageName: String
    let date: Int
    let artisName: String
    
    init(name: String, imageName: String, date: Int, artisName: String) {
        self.name = name
        self.imageName = imageName
        self.date = date
        self.artisName = artisName
    }
    
    static func getDemoArtList() -> [Art] {
        var list: [Art] = [Art]()
        list.append(contentsOf: [Art(name: "The Large Plane Trees (Road Menders at Saint-Rémy)", imageName: "img1", date: 1889, artisName: "Vincent van Gogh"),
                                 Art(name: "Two Poplars in the Alpilles near Saint-Rémy", imageName: "img2", date: 1889, artisName: "Vincent van Gogh"),
                                 Art(name: "The Cliffs at Beg-ar-Fry, Saint-Jean-du-Doigt", imageName: "img3", date: 1895, artisName: "Maxime Maufra"),
                                 Art(name: "The Port of l'Estaque, the Pier", imageName: "img4", date: 1906, artisName: "Georges Braque"),
                                 Art(name: "End of Olsons", imageName: "img5", date: 1969, artisName: "Andrew Wyeth")])
        return list
    }
}
