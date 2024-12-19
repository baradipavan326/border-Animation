//
//  BorderAnimationExtension.swift
//  borderAnimation
//
//  Created by Baradi Pavan on 08/12/24.
//

import SwiftUI

struct AnimatedBorderModifier: ViewModifier {
    @State private var gradientRotationAngle: Double = 0.0

    var borderColor: Color
    var stops: [Gradient.Stop]
    var lineWidth: CGFloat
    var cornerRadius: CGFloat
    var animationDuration: Double

    func body(content: Content) -> some View {
        content
        /// Solid border
            .overlay {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .strokeBorder(borderColor, lineWidth: lineWidth / 2)
            }
        /// Blur border
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .strokeBorder(
                        AngularGradient(
                            stops: stops,
                            center: .center,
                            startAngle: .degrees(gradientRotationAngle),
                            endAngle: .degrees(gradientRotationAngle + 360)
                        ),
                        lineWidth: lineWidth
                    )
                    .blur(radius: lineWidth / 2) // Softens the edges for a glowing effect
            )
        /// Animation
            .onAppear {
                withAnimation(
                    Animation.linear(duration: animationDuration)
                        .repeatForever(autoreverses: false)
                ) {
                    gradientRotationAngle = 360
                }
            }
    }
}

extension View {
    func animatedBorder(
        borderColor: Color = .purple,
        colors: [Gradient.Stop] = [
            .init(color: .white, location: 0),
            .init(color: .pink, location: 0.1),
            .init(color: .pink, location: 0.2),
            .init(color: .white, location: 0.3)
        ],
        lineWidth: CGFloat = 3,
        cornerRadius: CGFloat = 12,
        animationDuration: Double = 3
    ) -> some View {
        self.modifier(
            AnimatedBorderModifier(
                borderColor: borderColor,
                stops: colors,
                lineWidth: lineWidth,
                cornerRadius: cornerRadius,
                animationDuration: animationDuration
            )
        )
    }
}
