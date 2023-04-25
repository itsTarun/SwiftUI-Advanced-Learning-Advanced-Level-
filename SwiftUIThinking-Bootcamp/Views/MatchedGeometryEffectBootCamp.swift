//
//  MatchedGeometryEffectBootCamp.swift
//  SwiftUIThinking-Bootcamp
//
//  Created by Tarun on 24/04/23.
//

import SwiftUI

struct MatchedGeometryEffectBootCamp: View {
    @State private var isClicked = false
    @Namespace private var nameSpace
    var body: some View {
        VStack {
            if !isClicked {
                Circle()
                    .matchedGeometryEffect(id: "rectangle", in: nameSpace)
                    .frame(width: 100, height: 100)
            }
                
            Spacer()
            
            if isClicked {
                RoundedRectangle(cornerRadius: 25)
                    .matchedGeometryEffect(id: "rectangle", in: nameSpace)
                    .frame(width: 200, height: 200)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.red)
        .onTapGesture {
            withAnimation(.easeInOut) {
                isClicked.toggle()
            }
        }
    }
}

struct MatchedGeometryEffectBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        MatchedGeometryEffectExample2()
    }
}

struct MatchedGeometryEffectExample2: View {
    let categories: [String] = ["Home", "Popular", "Saved"]
    @State private var selectedString = "Home"
    @Namespace private var namespace2
    
    var body: some View {
        HStack {
            ForEach(categories, id: \.self) { category in
                ZStack(alignment: .bottom) {
                    if selectedString == category {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.red)
                            .matchedGeometryEffect(id: "category_background", in: namespace2)
                            .frame(width: 35, height: 2)
                            .offset(y: 10)
                    }
                    
                    Text(category)
                        .foregroundColor(selectedString == category ? .red : .primary)
                }
                .frame(maxWidth:.infinity)
                .frame(height: 55)
                .onTapGesture {
                    withAnimation(.spring()) {
                        selectedString = category
                    }
                }
            }
        }
        .padding()
    }
}
