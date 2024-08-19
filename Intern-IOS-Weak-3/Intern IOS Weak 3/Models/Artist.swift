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
    let follower: Int
    
    init(artistName: String, artistAvt: String, follower: Int) {
        self.artistName = artistName
        self.artistAvt = artistAvt
        self.follower = follower
    }
    
    static func getDemoArtistList() -> [Artist] {
        var list: [Artist] = [Artist]()
        list.append(contentsOf: [Artist(artistName: "Ariana Grande", artistAvt: "artist2", follower: Int.random(in: 10_000_000...50_000_000)),
                                 Artist(artistName: "The Weeknd", artistAvt: "artist1", follower: Int.random(in: 10_000_000...50_000_000)),
                                 Artist(artistName: "Acidrap", artistAvt: "artist3", follower: Int.random(in: 10_000_000...50_000_000)),
                                 Artist(artistName: "Ryan Jones", artistAvt: "artist4", follower: Int.random(in: 10_000_000...50_000_000)),
                                 Artist(artistName: "Jamie Gray", artistAvt: "artist5", follower: Int.random(in: 10_000_000...50_000_000)),
                                 Artist(artistName: "Troye Sivan", artistAvt: "artist6", follower: Int.random(in: 10_000_000...50_000_000)),
                                 Artist(artistName: "Babymetal", artistAvt: "artist7", follower: Int.random(in: 10_000_000...50_000_000))])
        return list
    }
}
