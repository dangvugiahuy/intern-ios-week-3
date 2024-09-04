//
//  SongsRouter.swift
//  Dang Vu Gia Huy
//
//  Created by huy.dang on 9/4/24.
//

import Foundation

enum SongsRouter: RequestProtocol {
    case getSongs(Int)
    
    var path: String {
        switch self {
        case .getSongs(let quantity):
            return "/vn/music/most-played/\(quantity)/songs.json"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getSongs(_):
            return .GET
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    var param: [String : String]? {
        return nil
    }
    
    var body: [String : String]? {
        return nil
    }
}
