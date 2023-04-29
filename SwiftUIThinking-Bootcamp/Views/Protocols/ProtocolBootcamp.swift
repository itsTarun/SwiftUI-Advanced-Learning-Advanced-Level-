//
//  ProtocolBootcamp.swift
//  SwiftUIThinking-Bootcamp
//
//  Created by Tarun on 27/04/23.
//

import SwiftUI

struct DefaultColorTheme: ColorThemeProtocol {
    let primary: Color = .blue
    let secondary: Color = .white
    let tertiary: Color = .gray
}

struct AlternativeColorTheme: ColorThemeProtocol {
    let primary: Color = .red
    let secondary: Color = .white
    let tertiary: Color = .green
}
// Protocol: - set of rules or requirements that any struct or class need to have
protocol ColorThemeProtocol {
    var primary: Color { get }
    var secondary: Color { get }
    var tertiary: Color { get }
}

protocol ButtonTextProtocol {
    var buttonText: String { get }
    func buttonPressed()
}

class DefaultDataSource: ButtonTextProtocol {
    var buttonText: String = "Protocols are awesome!"
    func buttonPressed() {
        print("buttonPressed")
    }
}

struct ProtocolBootcamp: View {
    let colorTheme: ColorThemeProtocol
    let datasource: ButtonTextProtocol
    
    var body: some View {
        ZStack {
            colorTheme.tertiary
                .ignoresSafeArea()
            
            Text(datasource.buttonText)
                .font(.headline)
                .foregroundColor(colorTheme.secondary)
                .padding()
                .background(colorTheme.primary)
                .cornerRadius(10)
                .onTapGesture {
                    datasource.buttonPressed()
                }
        }
    }
}

struct ProtocolBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ProtocolBootcamp(colorTheme: AlternativeColorTheme(), datasource: DefaultDataSource())
    }
}
