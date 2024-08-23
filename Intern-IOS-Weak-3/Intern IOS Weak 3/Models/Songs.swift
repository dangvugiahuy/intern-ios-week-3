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
    var isliked: Bool
   
    init(songName: String, songImage: String, artistName: String, isliked: Bool) {
        self.songName = songName
        self.songImage = songImage
        self.artistName = artistName
        self.isliked = isliked
    }
    
    static func getDemoSongsList() -> [Songs] {
        var songs: [Songs] = [Songs]()
        songs.append(contentsOf: [Songs(songName: "Star Boy", songImage: "song1", artistName: "The Weeknd", isliked: false),
                                  Songs(songName: "Die For You", songImage: "song2", artistName: "The Weeknd & Ariana Grande", isliked: false),
                                  Songs(songName: "Creepin'", songImage: "song3", artistName: "The Weeknd & 21 Savage", isliked: false),
                                  Songs(songName: "Yours Truly", songImage: "song4", artistName: "Ariana Grande", isliked: false),
                                  Songs(songName: "Sweetener", songImage: "song5", artistName: "Ariana Grande", isliked: false),
                                  Songs(songName: "The Hills", songImage: "song6", artistName: "The Weeknd", isliked: false),
                                  Songs(songName: "Call Out My Name", songImage: "song7", artistName: "The Weeknd", isliked: false),
                                  Songs(songName: "Ticking Away", songImage: "song8", artistName: "VALORANT, Grabbitz, bbno$", isliked: false),
                                  Songs(songName: "Sunflower-Spider-Man", songImage: "song9", artistName: "Post Malone, Swae Lee", isliked: false),
                                  Songs(songName: "STAY", songImage: "song10", artistName: "The Kid LAROI, Justin Bieber", isliked: false),
                                  Songs(songName: "Star Boy", songImage: "song1", artistName: "The Weeknd", isliked: false),
                                  Songs(songName: "Die For You", songImage: "song2", artistName: "The Weeknd & Ariana Grande", isliked: false),
                                  Songs(songName: "Creepin'", songImage: "song3", artistName: "The Weeknd & 21 Savage", isliked: false),
                                  Songs(songName: "Yours Truly", songImage: "song4", artistName: "Ariana Grande", isliked: false),
                                  Songs(songName: "Sweetener", songImage: "song5", artistName: "Ariana Grande", isliked: false),
                                  Songs(songName: "The Hills", songImage: "song6", artistName: "The Weeknd", isliked: false),
                                  Songs(songName: "Call Out My Name", songImage: "song7", artistName: "The Weeknd", isliked: false),
                                  Songs(songName: "Ticking Away", songImage: "song8", artistName: "VALORANT, Grabbitz, bbno$", isliked: false),
                                  Songs(songName: "Sunflower-Spider-Man", songImage: "song9", artistName: "Post Malone, Swae Lee", isliked: false),
                                  Songs(songName: "STAY", songImage: "song10", artistName: "The Kid LAROI, Justin Bieber", isliked: false)])
        return songs
    }
}
