//
//  GeometryPreferenceKeyBootCamp.swift
//  SwiftUIThinking-Bootcamp
//
//  Created by Tarun on 25/04/23.
//

import SwiftUI

struct GeometryPreferenceKeyBootCamp: View {
    @State private var rectSize: CGSize = .zero
    
    var body: some View {
        VStack {
            Spacer()
            
            Text("Hello, World!")
                .frame(width: rectSize.width, height: rectSize.height)
                .background(.blue)
            
            Spacer()
            
            HStack {
                Rectangle()
                
                GeometryReader { geo in
                    Rectangle()
                        .updateRectangleGeoSize(geo.size)
                }
                
                Rectangle()
            }
            .frame(height: 55)
        }
        .onPreferenceChange(RectangleGeometrySizePreferenceKey.self) { value in
            self.rectSize = value
        }
    }
}

struct RectangleGeometrySizePreferenceKey: PreferenceKey {
    static var defaultValue: CGSize = .zero
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
        value = nextValue()
    }
}

extension View {
    func updateRectangleGeoSize(_ size: CGSize) -> some View {
        preference(key: RectangleGeometrySizePreferenceKey.self, value: size)
    }
}

struct GeometryPreferenceKeyBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        GeometryPreferenceKeyBootCamp()
    }
}
