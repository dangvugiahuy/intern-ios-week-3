//
//  HttpRequest.swift
//  Dang Vu Gia Huy
//
//  Created by huy.dang on 9/4/24.
//

import Foundation

class HttpRequest {
    static var shared = HttpRequest()
    
    func request(_ urlConverted: RequestProtocol, completion: ((Data?, APIError?) -> Void)?) {
        let baseURL = URL(string: NetworkConstants.domain)!
        var request = URLRequest(url: baseURL.appending(path: urlConverted.path))
        request.httpMethod = urlConverted.method.value
        
        if let headers = urlConverted.headers {
            headers.keys.forEach { key in
                if let value = headers[key] {
                    request.addValue(urlConverted.headers![key]!, forHTTPHeaderField: key)
                }
            }
        }
        
        if let body = urlConverted.body, let paramData = try? JSONSerialization.data(withJSONObject: body) {
            request.httpBody = paramData
        }
        
        URLSession.shared.dataTask(with: request) { data, respone, error in
            if let error = error {
                completion?(nil, APIError.error(error.localizedDescription))
                return
            }
            
            guard let data = data else {
                completion?(nil, APIError.successWithEmptyData)
                return
            }
            completion?(data, nil)
        }
        .resume()
    }
}

enum APIError: Error {
    case error(String)
    case successWithEmptyData
    
    var localizedDescription: String {
        switch self {
        case .error(let string):
            return string
        case .successWithEmptyData:
            return "Get respone success but haven't data inside"
        }
    }
}
