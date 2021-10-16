//
//  Quote.swift
//  Quotes
//
//  Created by Hayden Couch on 2021-10-06.
//

import Foundation

struct Anime: Identifiable, Decodable {
    let anime_id: Int
    let anime_name: String
    let anime_img: String
    var id: String {anime_name}
}

extension Anime {
    
    static let dummyData: [Anime] = [
        Anime(anime_id: 1, anime_name: "Character 1", anime_img: "Random Q1"),
    ]
}
