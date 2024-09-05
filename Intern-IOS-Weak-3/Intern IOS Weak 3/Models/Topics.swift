//
//  Topics.swift
//  Dang Vu Gia Huy
//
//  Created by huy.dang on 8/30/24.
//

import Foundation

class Topics {
    let name: String
    let type: String
    let mediatype: String
    let feed: String
    
    init(name: String, type: String, mediatype: String, feed: String) {
        self.name = name
        self.type = type
        self.mediatype = mediatype
        self.feed = feed
    }
    
    static func getAllTopics() -> [Topics] {
        var topics = [Topics]()
        topics.append(contentsOf: [Topics(name: "Songs", type: "songs", mediatype: "music", feed: "most-played"),
                                   Topics(name: "Albums", type: "albums", mediatype: "music", feed: "most-played"),
                                   Topics(name: "Playlists", type: "playlists", mediatype: "music", feed: "most-played"),
                                   Topics(name: "Podcasts", type: "podcasts", mediatype: "podcasts", feed: "top")])
        return topics
    }
}
