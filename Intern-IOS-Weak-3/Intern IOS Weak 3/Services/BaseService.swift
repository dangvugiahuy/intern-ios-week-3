//
//  BaseService.swift
//  Dang Vu Gia Huy
//
//  Created by huy.dang on 8/30/24.
//

import Foundation

public struct NetWorkRequest {
    let domain: String = "https://rss.applemarketingtools.com/api/v2"
    let path: String
    let value: String
}

class BaseService {
    static let shared = BaseService()
    
    public func fetchData(from request: NetWorkRequest, completion: @escaping (Result<Data, Error>) -> Void) {
        guard let url = URL(string: "\(request.domain)/\(request.path)/\(request.value).json") else {return}
        let urlRequest = URLRequest(url: url)
        URLSession.shared.dataTask(with: urlRequest) { data, _ , error in
            guard let data = data, error == nil else {
                if let error {
                    completion(.failure(error))
                }
                return
            }
            completion(.success(data))
        }
        .resume()
    }
}
