//
//  SongsService.swift
//  Dang Vu Gia Huy
//
//  Created by huy.dang on 8/30/24.
//

import Foundation

class SongsService {
    
    init() {}
    
    func getSongs(mediatype: String, type: String, feed: String, completion: @escaping (Result<[SongsObject], Error>)-> Void) {
        DispatchQueue.main.async {
            HttpRequest.shared.request(SongsRouter.getSongs(mediatype, type, feed)) { [self] data, error in
                if error != nil {
                    print(error!)
                    completion(.failure(error!))
                } else {
                    completion(.success(parseData(data: data!)))
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
