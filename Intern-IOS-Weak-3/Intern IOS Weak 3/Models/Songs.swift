//
//  Songs.swift
//  Intern IOS Weak 3
//
//  Created by huy.dang on 8/16/24.
//

import Foundation

class Songs {
    let songName: String
    let songImage: String
    let artistName: String
   
    init(songName: String, songImage: String, artistName: String) {
        self.songName = songName
        self.songImage = songImage
        self.artistName = artistName
    }
    
    static func getDemoSongsList() -> [Songs] {
        var songs: [Songs] = [Songs]()
        songs.append(contentsOf: [Songs(songName: "Star Boy", songImage: "song1", artistName: "The Weekend"),
                                  Songs(songName: "Die For You", songImage: "song2", artistName: "The Weekend & Ariana Grade"),
                                  Songs(songName: "Creepin'", songImage: "song3", artistName: "The Weekend & 21 Savage"),
                                  Songs(songName: "Yours Truly", songImage: "song4", artistName: "Ariana Grade"),
                                  Songs(songName: "Sweetener", songImage: "song5", artistName: "Ariana Grade")])
        return songs
    }
}
