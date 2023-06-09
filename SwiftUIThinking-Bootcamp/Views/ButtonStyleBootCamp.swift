//
//  ButtonStyleBootCamp.swift
//  SwiftUIThinking-Bootcamp
//
//  Created by Tarun on 24/04/23.
//

import SwiftUI

struct PressableButtonStyle: ButtonStyle {
    let scaledAmount: CGFloat
    
    init(scaledAmount: CGFloat) {
        self.scaledAmount = scaledAmount
    }
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .opacity(configuration.isPressed ? scaledAmount : 1.0)
        //  .brightness(configuration.isPressed ? 0.05 : 0)
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
    }
}

extension View {
    func withPressableStyle(scaledAmount: CGFloat = 0.9) -> some View {
        buttonStyle(PressableButtonStyle(scaledAmount: scaledAmount))
    }
}

struct ButtonStyleBootCamp: View {
    var body: some View {
        Button {
            print("Yo")
        } label: {
            Text("Click Me")
                .font(.headline)
                .withDefaultButtonFormatting()
        }
        .withPressableStyle(scaledAmount: 0.9)
        .padding(40)
    }
}

struct ButtonStyleBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        ButtonStyleBootCamp()
    }
}
