//
//  SongsService.swift
//  Dang Vu Gia Huy
//
//  Created by huy.dang on 8/30/24.
//

import Foundation

class SongsService {
    
    init() {}
    
    func getSongs(from request: NetWorkRequest, completion: @escaping (Result<[SongsObject], Error>)-> Void) {
        DispatchQueue.main.async {
            BaseService.shared.fetchData(from: request) { [self] result in
                switch result {
                case .success(let model):
                    completion(.success(parseData(data: model)))
                case .failure(_):
                    return
                }
            }
        }
    }
    
    private func parseData(data: Data) -> [SongsObject] {
        do {
            let songs = try JSONDecoder().decode(SongsRespone.self, from: data)
            return songs.feed.results!
        } catch {
            return []
        }
    }
}
