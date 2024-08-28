//
//  Feed.swift
//  Dang Vu Gia Huy
//
//  Created by huy.dang on 8/28/24.
//

import Foundation

struct Feed: Codable, Hashable, Identifiable {
    let id: String
    let results: [SongsObject]?
}
