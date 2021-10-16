//
//  QuoteView.swift
//  Quotes
//
//  Created by Hayden Couch on 2021-10-14.
//

import SwiftUI

struct QuoteView: View {
    
    let item: Quote
    
    var body: some View {
        
        VStack(alignment: .leading,
               spacing: 8) {
            HStack {
                Image(systemName: "tv")
                    .font(.system(size: 12, weight: .black))
                Text(item.anime_name)
            }
            
            Text(makeAttributedString(title:"Anime", label: item.anime_name))
            AsyncImage(url: URL(string: item.anime_img)) { image in
                image.resizable()
            } placeholder: {
                Color.red
            }
            .frame(width: 128, height: 128)
            .clipShape(RoundedRectangle(cornerRadius: 25))
                .lineLimit(2)
        }
               .padding()
               .foregroundColor(.black)
    }
    
    private func makeAttributedString(title: String, label: String) -> AttributedString
    {
        
        var string = AttributedString("\(title): \(label)")
        string.foregroundColor = .black
        string.font = .system(size: 16, weight: .bold)
        
        if let range = string.range(of: label) {
            string[range].foregroundColor = .black.opacity(0.8)
            string[range].font = .system(size: 16, weight: .regular)
        }
        return string
    }
}

struct QuoteView_Previews: PreviewProvider {
    static var previews: some View {
        QuoteView(item: Quote.dummyData.first!)
    }
}
