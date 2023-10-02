//
//  iconButtonModifier.swift
//  DailyEatenFruit
//
//  Created by Waleerat Gottlieb on 2022-05-19.
//

import SwiftUI

struct TextHeaderModifier: ViewModifier {
    @State var foregroundColor:Color = kConfig.color.foreground
    @State var isBold:Bool = false
    func body(content: Content) -> some View {
    content
        .font(.system(size: isIpad() ? 40 : 25 ,weight: isBold ? .bold : .regular, design: .rounded))
        .lineLimit(nil)
        .multilineTextAlignment(.leading)
        .foregroundColor(foregroundColor)
    }
}

struct TextTitleModifier: ViewModifier {
    @State var foregroundColor:Color = kConfig.color.foreground
    @State var isBold:Bool = false
    func body(content: Content) -> some View {
    content
        .font(.system(size: isIpad() ? 25 : 18 ,weight: isBold ? .bold : .regular, design: .rounded))
        .lineLimit(nil)
        .multilineTextAlignment(.leading)
        .foregroundColor(foregroundColor)
    }
}

struct TextDescriptionModifier: ViewModifier {
    @State var foregroundColor:Color = kConfig.color.foreground
    @State var isBold:Bool = false
    func body(content: Content) -> some View {
    content
        .font(.system(size: isIpad() ? 17 : 15 ,weight: isBold ? .bold : .regular, design: .rounded))
        .lineLimit(nil)
        .multilineTextAlignment(.leading)
        .foregroundColor(foregroundColor)
    }
}

struct ArrowModifier: ViewModifier {
    @State var foregroundColor:Color = kConfig.color.foreground
    @State var buttonBackground:Color = kConfig.color.buttonBackground
    
    func body(content: Content) -> some View {
        content
            .foregroundColor(foregroundColor)
            .background(buttonBackground)
            .clipShape(Capsule())
    }
}

struct TabSelecterModifier : ViewModifier {
    var isActive:Bool = false
    func body(content: Content) -> some View {
        content
            .multilineTextAlignment(.center)
            .foregroundColor(isActive ? .white : kConfig.color.foreground.opacity(0.7))
            .font(.system(size: isIpad() ? 25 : 16 ,weight: .regular, design: .rounded))
            .padding(.vertical,10)
            .padding(.horizontal,10)
        
    }
}
