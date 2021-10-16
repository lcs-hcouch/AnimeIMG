//
//  QuotesService.swift
//  Quotes
//
//  Created by Hayden Couch on 2021-10-14.
//

import Foundation

protocol QuotesService {
    func fetchRandomQuotes() async throws -> [Quote]
}



final class QuotesServiceImpl: QuotesService {
     struct Response: Decodable {
        let success: Bool
        let data: [Quote]
    }
    
    func fetchRandomQuotes() async throws -> [Quote] {
        
        let url = URL(string: APIConstants.baseUrl)!
        
        let (data,response) = try await URLSession.shared.data(from: url)
        let result = try JSONDecoder().decode(Response.self, from: data)
    
        print(result.data)
        return result.data
    }
    
}
    
