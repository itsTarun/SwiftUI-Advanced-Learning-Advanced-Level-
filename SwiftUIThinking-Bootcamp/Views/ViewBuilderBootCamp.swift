//
//  ViewBuilder.swift
//  SwiftUIThinking-Bootcamp
//
//  Created by Tarun on 25/04/23.
//

import SwiftUI

struct HeaderViewRegular: View {
    let title: String
    let description: String?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.largeTitle)
                .fontWeight(.semibold)
            
            if let description = description {
                Text(description)
                    .font(.callout)
            }
            
            RoundedRectangle(cornerRadius: 5)
                .frame(height: 2)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
    }
}
// MARK: - Generic Header View
struct HeaderViewGeneric<Content: View>: View {
    let title: String
    let content: Content
    
    init(title: String, @ViewBuilder _ content: () -> Content) {
        self.title = title
        self.content = content()
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.largeTitle)
                .fontWeight(.semibold)
            
            content
            
            RoundedRectangle(cornerRadius: 5)
                .frame(height: 2)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
    }
}

struct CustomHStack<Content: View>: View {
    let content: Content
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    var body: some View {
        HStack {
            content
        }
    }
}

struct ViewBuilderBootCamp: View {
    var body: some View {
        VStack {
            HeaderViewRegular(title: "Title", description: nil)
            HeaderViewRegular(title: "Another Title", description: "with description")
            
            HeaderViewGeneric(title: "Generic Title") {
                Text("with generic description")
            }
             
            HeaderViewGeneric(title: "Generic Title #2") {
                HStack {
                    Text("with generic description + image")
                    Image(systemName: "bolt.fill")
                }
            }
            Spacer()
        }
    }
}

struct ViewBuilder_Previews: PreviewProvider {
    static var previews: some View {
        ViewBuilderBootCamp()
    }
}
