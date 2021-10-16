//
//  AnimeViewModel.swift
//  Quotes
//
//  Created by Hayden Couch on 2021-10-14.
//

import Foundation

protocol AnimeViewModel: ObservableObject {
    func getRandomAnime() async
}

@MainActor
final class AnimeViewModelImpl: AnimeViewModel {
    
    @Published private(set) var anime: [Anime] = []
    
    private let service: AnimeService
    
    init(service: AnimeService) {
        self.service = service
    }
    
    func getRandomAnime() async {
        do {
            print("Loading data")
            self.anime = try await service.fetchRandomAnime()
        } catch {
            print(error)
        }
    }
}
