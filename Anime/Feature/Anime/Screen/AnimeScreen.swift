//
//  QuotesScreen.swift
//  Quotes
//
//  Created by Hayden Couch on 2021-10-14.
//

import SwiftUI

struct AnimeScreen: View {
    
    @StateObject private var vm = AnimeViewModelImpl(
        service: AnimeServiceImpl()
    )
    
    
    var body: some View {
        VStack {
            List{
                ForEach(vm.anime) { item in
                    AnimeView(item: item)
                }
            }
        }
        .task {
            await vm.getRandomAnime()
            print(vm.anime)
        }
    }
    
}

struct AnimeScreen_Previews: PreviewProvider {
    static var previews: some View {
        AnimeScreen()
    }
}
