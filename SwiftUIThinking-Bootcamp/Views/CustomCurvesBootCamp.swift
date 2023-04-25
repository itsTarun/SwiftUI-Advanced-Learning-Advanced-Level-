//
//  CustomCurvesBootCamp.swift
//  SwiftUIThinking-Bootcamp
//
//  Created by Tarun on 25/04/23.
//

import SwiftUI

struct CustomCurvesBootCamp: View {
    var body: some View {
        
        ZStack(alignment: .topTrailing) {
            
            WaterShape()
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: [Color.red, Color.yellow ]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                
                QuadSample()
                    .stroke(lineWidth: 5)
                    .frame(width: 100, height: 100)
                
                ShapeWithArc()
                    .frame(width: 100, height: 100)
                
                ArcSample()
                //  .stroke(lineWidth: 5)
                    .frame(width: 100, height: 100)
            }
            .foregroundColor(.yellow)
            .padding(40)
        }
    }
}

struct CustomCurvesBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        CustomCurvesBootCamp()
    }
}

struct ArcSample: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.midX, y: rect.midY))
            path.addArc(
                center: CGPoint(x: rect.midX, y: rect.midY),
                radius: rect.height / 2,
                startAngle: Angle(degrees: -20),
                endAngle: Angle(degrees: 20),
                clockwise: true
            )
        }
    }
}

struct ShapeWithArc: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            // top left
            path.move(to: CGPoint(x: rect.minX, y: rect.minY))
            // top right
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
            // mid right
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
            // bottom
            //            path.addLine(to: CGPoint(x: rect.midX, y: rect.maxX))
            path.addArc(
                center: CGPoint(x: rect.midX, y: rect.midY),
                radius: rect.height / 2,
                startAngle: Angle(degrees: 0),
                endAngle: Angle(degrees: 180),
                clockwise: false
            )
            // mid left
            path.addLine(to: CGPoint(x: rect.minX, y: rect.midX))
        }
    }
}

struct QuadSample: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: .zero)
            path.addQuadCurve(
                to: CGPoint(x: rect.maxX, y: rect.maxY),
                control: CGPoint(x: rect.minX, y: rect.maxY)
            )
        }
    }
}

struct WaterShape: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.minX, y: rect.midY))
            path.addQuadCurve(
                to: CGPoint(x: rect.midX, y: rect.midY),
                control: CGPoint(x: rect.width * 0.4, y: rect.height * 0.4)
            )
            path.addQuadCurve(
                to: CGPoint(x: rect.maxX, y: rect.midY),
                control: CGPoint(x: rect.width * 0.6, y: rect.height * 0.6)
            )
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        }
    }
}
