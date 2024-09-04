//
//  Router.swift
//  Dang Vu Gia Huy
//
//  Created by huy.dang on 9/4/24.
//

import Foundation

enum HTTPMethod {
    case GET
    case POST
    case PUT
    case DELETE
    
    var value: String {
        switch self {
        case .GET:
            return "GET"
        case .POST:
            return "POST"
        case .PUT:
            return "PUT"
        case .DELETE:
            return "DELETE"
        }
    }
}

protocol RequestProtocol {
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: [String: String]? { get }
    var param: [String: String]? { get }
    var body: [String: String]? { get }
}
