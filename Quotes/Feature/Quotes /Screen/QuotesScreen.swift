//
//  QuotesScreen.swift
//  Quotes
//
//  Created by Hayden Couch on 2021-10-14.
//

import SwiftUI

struct QuotesScreen: View {
    
    @StateObject private var vm = QuotesViewModelImpl(
        service: QuotesServiceImpl()
    )
    
    
    var body: some View {
        VStack {
            List{
                ForEach(vm.quotes) { item in
                    QuoteView(item: item)
                }
            }
        }
        .task {
            await vm.getRandomQuotes()
            print(vm.quotes)
        }
    }
    
}

struct QuotesScreen_Previews: PreviewProvider {
    static var previews: some View {
        QuotesScreen()
    }
}
