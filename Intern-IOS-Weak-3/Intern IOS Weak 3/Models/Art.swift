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
    let description: String
    
    init(name: String, imageName: String, date: Int, artisName: String, description: String) {
        self.name = name
        self.imageName = imageName
        self.date = date
        self.artisName = artisName
        self.description = description
    }
    
    static func getDemoArtList() -> [Art] {
        var list: [Art] = [Art]()
        list.append(contentsOf: [Art(name: "The Large Plane Trees (Road Menders at Saint-Rémy)", imageName: "img1", date: 1889, artisName: "Vincent van Gogh", description: """
Like Two Poplars in the Alpilles near Saint-Rémy (on view nearby), Vincent van Gogh painted this autumnal landscape while living at an asylum near Saint-Rémy in southern France where he was treated for severe depression. Understanding that painting from nature eased his symptoms, Van Gogh’s physician permitted the artist to paint landscapes outside of the asylum. Van Gogh described this painting in a letter to his brother Theo: “The last study I did is a view of the village, where they were at work under some enormous plane trees—repairing the pavements. . . . There are heaps of sand, stones, and the gigantic trunks—the leaves yellowing and here and there you can get a glimpse of a house front and small figures.”
"""),
                                 Art(name: "Two Poplars in the Alpilles near Saint-Rémy", imageName: "img2", date: 1889, artisName: "Vincent van Gogh", description: """
Vincent van Gogh painted this autumnal landscape while living at an asylum near Saint-Rémy in southern France where he was treated for severe depression. Although initially restricted to painting in his room, the artist was vigorously prolific when his physician allowed him to resume working outdoors. This painting reveals the full power of Van Gogh’s mature style. Trees twist and lean against a darkening sky, while the intense colors applied with thick brushstrokes suggest his emotional response to the windswept landscape.
"""),
                                 Art(name: "The Cliffs at Beg-ar-Fry, Saint-Jean-du-Doigt", imageName: "img3", date: 1895, artisName: "Maxime Maufra", description: """
Maxime Maufra was initially an amateur artist, but in 1883 he gave up a career in business to devote himself entirely to painting. He traveled throughout Normandy and Britany painting sea and landscapes. During a visit to Pont-Aven in northwestern France in 1890 he met Paul Gauguin and a group of young artists who were inspired by Gauguin’s approaches to color and composition in his art. In particular, Maufra began to translate forms into flat planes of bold color arranged in decorative patterns as seen in this seascape of the Breton coast. Perhaps the most striking aspect of this painting is the way the artist framed the composition at the left with the view of a steep cliff.
"""),
                                 Art(name: "The Port of l'Estaque, the Pier", imageName: "img4", date: 1906, artisName: "Georges Braque", description: """
Celebrated as the one of the inventors of Cubism, Georges Braque was also an important member of the French Fauves (Wild Beasts). Their principal aim was to liberate color from natural appearances in order to use it for purely expressive purposes. Braque painted The Port of L’Estaque on his first visit to the south of France. He was only twenty-four years old and bursting with enthusiasm. His excitement is felt in the undulating hills and the short, powerful strokes of pure, iridescent color, often applied in complementary color contrasts of red/green, blue/orange, and violet/yellow. However, his color harmonies do not follow any systematic method but are instead the result of an improvisational process sparked by the artist’s emotional reaction to ­the subject.
"""),
                                 Art(name: "End of Olsons", imageName: "img5", date: 1969, artisName: "Andrew Wyeth", description: """
A prominent realist painter during the modern era, Wyeth focused on rural themes throughout his long career. End of Olsons is the final painting he produced at the rustic Maine home of Alvaro and Anna Christina Olson, siblings he befriended for more than 20 years. The brother and sister had died recently, and Wyeth’s composition presents the abandoned house accompanied by a pair of swallows soon to depart for the winter.
""")])
        return list
    }
}
