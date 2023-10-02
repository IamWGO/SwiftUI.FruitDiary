//
//  iconButtonView.swift
//  FruitDiary
//
//  Created by Waleerat Gottlieb on 2022-05-19.
//

import SwiftUI

struct IconButtonView: View {
    @Binding var isActive: Bool
    var imageAsset:String?
    var systemName:String?
    @State var width: CGFloat = 16
    @State var height: CGFloat = 16
    @State var foreground = kConfig.color.foreground
    @State var buttonBackground:Color = kConfig.color.buttonBackground
    
    var action: () -> Void
    var body: some View {
        Button(action: action , label: {
            if let imageAsset = imageAsset {
                Image(imageAsset)
                    .resizable()
                    .scaledToFit()
                    .frame(width: width, height: height)
                    .opacity(isActive ? 1 : 0.5)
                    .foregroundColor(foreground)
            }
            
            if let systemName = systemName {
                Image(systemName: systemName)
                    .resizable()
                    .renderingMode(.template)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: width, height: height)
                    .padding(.vertical,7)
                    .padding(.horizontal,20)
                    .opacity(isActive ? 1 : 0.5)
                    .foregroundColor(foreground)
            }
        })
        .background(buttonBackground)
        .clipShape(Capsule())
        .disabled(!isActive)
    }
}
