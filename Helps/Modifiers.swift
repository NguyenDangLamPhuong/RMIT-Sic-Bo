//
//  Modifiers.swift
//  RMIT Sic Bo
//
//  Created by Mac on 24/08/2022.
//

import SwiftUI

struct scoreStyle: ViewModifier{
    func body(content: Content) -> some View {
        content
            .foregroundColor(.black)
            //.bold()
            .font(.system(size: 18,weight: .bold, design: .rounded))
            .padding(.all, 10)
            .background(Color.white.opacity(0.5))
            .cornerRadius(20)
    }
}

struct diceImageModifier: ViewModifier{
    func body(content: Content) -> some View {
        content
            .background(Color.white)
            .opacity(0.5)
            .cornerRadius(20)
    }
}
struct ShadowModifier: ViewModifier{
    func body(content: Content) -> some View {
        content
            .shadow(color:Color("ColorBlackTransparent"), radius: 7)
    }
}
struct BetCapsuleModifier: ViewModifier{
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .font(.system(size: 25, weight: .heavy, design: .rounded))
            .padding(.vertical, 6)
            .padding(.horizontal, 15)
            .modifier(ShadowModifier())
            .background(Capsule().fill(
                LinearGradient(gradient: Gradient(colors: [Color.red,Color.blue]), startPoint: .top, endPoint: .bottom)
            ))
    }
}

struct ChipModifier: ViewModifier{
    func body(content: Content) -> some View {
        content
            .scaledToFit()
            .frame(height: 70)
            .modifier(ShadowModifier())
    }
}

