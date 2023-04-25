//
//  ViewModifierBootCamp.swift
//  SwiftUIThinking-Bootcamp
//
//  Created by Tarun on 24/04/23.
//

import SwiftUI

struct DefaultButtonViewModifier: ViewModifier {
    let backgroundColor: Color
    
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(backgroundColor)
            .cornerRadius(10)
            .shadow(radius: 10)
    }
}

extension View {
    func withDefaultButtonFormatting(backgroundColor: Color = .red) -> some View {
        modifier(DefaultButtonViewModifier(backgroundColor: backgroundColor))
    }
}

struct ViewModifierBootCamp: View {
    var body: some View {
        VStack(spacing: 10) {
            Text("Hello, World!")
                .font(.title3)
                .withDefaultButtonFormatting(backgroundColor: .blue)
            
            Text("Hello, World! #2")
                .font(.title2)
                .withDefaultButtonFormatting()
            
            Text("Hello, World! #3")
                .font(.title)
                .withDefaultButtonFormatting(backgroundColor: .orange)
        }
        .padding()
        
        
    }
}

struct ViewModifierBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        ViewModifierBootCamp()
    }
}
