//
//  Topics.swift
//  Dang Vu Gia Huy
//
//  Created by huy.dang on 8/30/24.
//

import Foundation

class Topics {
    let name: String
    let value: String
    var isChoose: Bool
    
    init(name: String, value: String, isChoose: Bool) {
        self.name = name
        self.value = value
        self.isChoose = isChoose
    }
    
    static func getAllTopics() -> [Topics] {
        var topics = [Topics]()
        topics.append(contentsOf: [Topics(name: "Top 10", value: "10", isChoose: false),
                                   Topics(name: "Top 25", value: "25", isChoose: false),
                                   Topics(name: "Top 50", value: "50", isChoose: false),
                                   Topics(name: "Podcasts", value: "podcasts", isChoose: false)])
        return topics
    }
}
