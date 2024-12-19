//
//  BorderAnimation.swift
//  borderAnimation
//
//  Created by Baradi Pavan on 08/12/24.
//
import SwiftUI

struct BorderAnimation: View {
    var body: some View {
        VStack{
            Text("Welcome to border animation")
            Text("Welcome to border animation")
            Text("Welcome to border animation")
            Text("Welcome to border animation")
            Text("Welcome to border animation")
            Text("Welcome to border animation")
        }
        .padding()
        .animatedBorder()
    }
}

#Preview {
    BorderAnimation()
}
