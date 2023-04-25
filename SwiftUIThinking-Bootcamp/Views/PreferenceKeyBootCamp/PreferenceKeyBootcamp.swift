//
//  PreferenceKeyBootcamp.swift
//  SwiftUIThinking-Bootcamp
//
//  Created by Tarun on 25/04/23.
//

import SwiftUI

struct PreferenceKeyBootcamp: View {
    @State private var text = ""
    var body: some View {
        NavigationView {
            VStack {
                SecondaryScreen(title: text)
                    .navigationTitle("Navigation Title")
            }
            .onPreferenceChange(CustomTitlePreferenceKey.self) { value in
                self.text = value
            }
        }
    }
}

struct CustomTitlePreferenceKey: PreferenceKey {
    static var defaultValue: String = ""
    static func reduce(value: inout String, nextValue: () -> String) {
        value = nextValue()
    }
}

extension View {
    func customTitle(_ text: String) -> some View {
        preference(key: CustomTitlePreferenceKey.self, value: text)
    }
}

struct PreferenceKeyBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        PreferenceKeyBootcamp()
    }
}

struct SecondaryScreen: View {
    let title: String
    @State private var newValue: String = ""
    var body: some View {
        Text(title)
            .font(.largeTitle)
            .onAppear(perform: updateView)
            .customTitle(newValue)
    }
    func updateView() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.newValue = "New VALUE FROM DATABASE.."
        }
    }
}
