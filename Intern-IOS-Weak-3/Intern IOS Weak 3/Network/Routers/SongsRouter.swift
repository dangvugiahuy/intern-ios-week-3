//
//  SongsRouter.swift
//  Dang Vu Gia Huy
//
//  Created by huy.dang on 9/4/24.
//

import Foundation

enum SongsRouter: RequestProtocol {
    case getSongs(String, String, String)
    
    var path: String {
        switch self {
        case .getSongs(let mediatype, let type, let feed):
            return "/vn/\(mediatype)/\(feed)/50/\(type).json"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getSongs(_, _, _):
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
