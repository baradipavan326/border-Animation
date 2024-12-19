//
//  SampleAnimation.swift
//  borderAnimation
//
//  Created by Baradi Pavan on 14/12/24.
//
import SwiftUI

struct SampleAnimation: View {
    @State private var gradientRotationAngle: Double = 0.0
    var body: some View {
        RoundedRectangle(cornerRadius: 12, style: .circular)
            .strokeBorder(Color.yellow, lineWidth: 2)
            .overlay {
                RoundedRectangle(cornerRadius: 12)
                    .strokeBorder(
                        AngularGradient(
                            gradient: Gradient(stops: [
                                .init(color: .white, location: 0),
                                .init(color: .orange, location: 0.1),
                                .init(color: .orange, location: 0.3),
                                .init(color: .white, location: 0.4)
                            ]),
                            center: .center,
                            startAngle: .degrees(gradientRotationAngle),
                            endAngle: .degrees(gradientRotationAngle + 360)
                        ),
                        lineWidth: 2
                    )
                    .blur(radius: 2)

            }
            .onAppear {
                withAnimation(Animation.linear(duration: 3).repeatForever(autoreverses: false)) {
                    gradientRotationAngle = 360
                }
            }
            .frame(width: 250, height: 250)
    }
}

#Preview(body: {
    SampleAnimation()
})

