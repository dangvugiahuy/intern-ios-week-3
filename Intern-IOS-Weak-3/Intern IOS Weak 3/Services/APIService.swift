//
//  APIService.swift
//  Dang Vu Gia Huy
//
//  Created by huy.dang on 8/27/24.
//

import Foundation

final class APIService {
    init() {}
    
    func getSongs(completion: @escaping (Result<[SongsObject], Error>) -> Void) {
        guard let url = URL(string: "https://rss.applemarketingtools.com/api/v2/vn/music/most-played/50/songs.json") else {return}
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) {data, _, error in
            guard let data = data, error == nil else {
                if let error {
                    completion(.failure(error))
                }
                return
            }
            do {
                let respone = try JSONDecoder().decode(SongsRespone.self, from: data)
                if let results = respone.feed.results {
                    completion(.success(results))
                }
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
