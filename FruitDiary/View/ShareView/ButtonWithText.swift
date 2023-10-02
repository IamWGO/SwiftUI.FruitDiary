//
//  ButtonWithText.swift
//  iBookAdmin
//
//  Created by Waleerat Gottlieb on 2022-05-13.
//
import SwiftUI

struct ButtonWithText: View {
    var label:String
    
    @Binding var isActive:Bool
    @State var foreground = kConfig.color.foreground
    @State var background:Color = kConfig.color.buttonBackground
    @State var padding:CGFloat = 10
    
    var action: () -> Void
    var body: some View {
        Button(action: action , label: {
            Text(label)
                .font(.body)
                .fontWeight(.semibold)
                .foregroundColor(isActive ? foreground : .white)
                .padding(.vertical,7)
                .padding(.horizontal)
                .background(isActive ? background : Color.gray.opacity(0.5))
                .clipShape(Capsule())
        })
        .disabled(!isActive)
    }
}
 
