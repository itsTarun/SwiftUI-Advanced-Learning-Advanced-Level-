//
//  CustomShapesBootCamp.swift
//  SwiftUIThinking-Bootcamp
//
//  Created by Tarun on 24/04/23.
//

import SwiftUI

struct CustomShapesBootCamp: View {
    var body: some View {
        ZStack {
            
            VStack(spacing: 20) {
                
                Image("image")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 200, height: 200)
                    .clipShape(
                        Triangle()
                        // .rotation(Angle(degrees: 180))
                    )
                
                TrapeZoid()
                    .frame(width: 200, height: 100)
                
                Diamond()
                    .frame(width: 200, height: 200)
                
                Triangle()
                    .stroke(style: StrokeStyle(lineWidth: 5, lineCap: .round, dash: [10]))
                    .foregroundColor(.blue)
                    .frame(width: 100, height: 100)
            }
        }
    }
}

struct CustomShapesBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        CustomShapesBootCamp()
    }
}

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        }
    }
}

struct Diamond: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            let horizontalOffSet: CGFloat = rect.width * 0.2
            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX - horizontalOffSet, y: rect.midY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX + horizontalOffSet, y: rect.midY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        }
    }
}

struct TrapeZoid: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            let horizontalOffSet: CGFloat = rect.width * 0.2
            path.move(to: CGPoint(x: rect.minX + horizontalOffSet, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX - horizontalOffSet, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX + horizontalOffSet, y: rect.minY))
        }
    }
}
