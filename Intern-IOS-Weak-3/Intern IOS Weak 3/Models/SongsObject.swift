//
//  SongsObject.swift
//  Dang Vu Gia Huy
//
//  Created by huy.dang on 8/27/24.
//

import Foundation

struct SongsObject: Codable, Hashable, Identifiable {
    let artistName: String
    let id: String
    let name: String
    let artworkUrl100: String
}
