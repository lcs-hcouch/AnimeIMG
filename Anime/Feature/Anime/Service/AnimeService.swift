//
//  QuotesService.swift
//  Quotes
//
//  Created by Hayden Couch on 2021-10-14.
//

import Foundation

protocol AnimeService {
    func fetchRandomAnime() async throws -> [Anime]
}



final class AnimeServiceImpl: AnimeService {
     struct Response: Decodable {
        let success: Bool
        let data: [Anime]
    }
    
    func fetchRandomAnime() async throws -> [Anime] {
        
        let url = URL(string: APIConstants.baseUrl)!
        
        let (data,response) = try await URLSession.shared.data(from: url)
        let result = try JSONDecoder().decode(Response.self, from: data)
    
        print(result.data)
        return result.data
    }
    
}
    
