//
//  Artist.swift
//  Intern IOS Weak 3
//
//  Created by huy.dang on 8/16/24.
//

import Foundation

class Artist {
    let artistName: String
    let artistAvt: String
    
    init(artistName: String, artistAvt: String) {
        self.artistName = artistName
        self.artistAvt = artistAvt
    }
    
    static func getDemoArtistList() -> [Artist] {
        var list: [Artist] = [Artist]()
        list.append(contentsOf: [Artist(artistName: "Ariana Grande", artistAvt: "artist2"),
                                 Artist(artistName: "The Weeknd", artistAvt: "artist1"),
                                 Artist(artistName: "Acidrap", artistAvt: "artist3"),
                                 Artist(artistName: "Ryan Jones", artistAvt: "artist4"),
                                 Artist(artistName: "Jamie Gray", artistAvt: "artist5"),
                                 Artist(artistName: "Troye Sivan", artistAvt: "artist6"),
                                 Artist(artistName: "Babymetal", artistAvt: "artist7")])
        return list
    }
}
