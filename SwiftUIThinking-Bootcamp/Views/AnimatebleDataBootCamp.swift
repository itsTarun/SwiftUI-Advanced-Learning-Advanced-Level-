//
//  AnimatebleDataBootCamp.swift
//  SwiftUIThinking-Bootcamp
//
//  Created by Tarun on 25/04/23.
//

import SwiftUI

struct AnimatebleDataBootCamp: View {
    @State private var animate = false
    
    var body: some View {
        ZStack {
            
            VStack(spacing: 20) {
                
                RoundedRectangle(cornerRadius: animate ? 60 : 0)
                    .frame(width: 200, height: 200)
                
                RectangleWithSingleCornerAnimation(cornerRadius: animate ? 60 : 0)
                    .frame(width: 200, height: 200)
                
                Spacer()
                
                Pacman(offsetAmount: animate ? 20 : 0)
                    .frame(width: 200, height: 200)
            }
            
        }
        .onAppear {
            withAnimation(.easeInOut.repeatForever()) {
                animate.toggle()
            }
        }
    }
}

struct AnimatebleDataBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        AnimatebleDataBootCamp()
    }
}

struct RectangleWithSingleCornerAnimation: Shape {
    var cornerRadius: CGFloat
    
    var animatableData: CGFloat {
        get { cornerRadius }
        set { cornerRadius = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: .zero)
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY - cornerRadius))
            path.addArc(
                center: CGPoint(x: rect.maxX - cornerRadius, y: rect.maxY - cornerRadius),
                radius: cornerRadius,
                startAngle: Angle(degrees: 0),
                endAngle: Angle(degrees: 360),
                clockwise: false
            )
            path.addLine(to: CGPoint(x: rect.maxX - cornerRadius, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        }
    }
}

struct Pacman: Shape {
    var offsetAmount: CGFloat
    var animatableData: CGFloat {
        get { offsetAmount }
        set { offsetAmount = newValue }
    }
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            path.addArc(
                center: CGPoint(x: rect.midX, y: rect.minY),
                radius: rect.height / 2,
                startAngle: Angle(degrees: offsetAmount),
                endAngle: Angle(degrees: 360 - offsetAmount),
                clockwise: false
            )
        }
    }
}
