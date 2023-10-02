//
//  TabSlideBarView.swift
//  FruitDiary
//
//  Created by Waleerat Gottlieb on 2022-05-19.
//

import SwiftUI

struct TabSlideBarView: View {
    @State var title: String
    @Binding var isActive: Bool
    
    var body: some View {
        VStack{
            Text(title)
                .modifier(TabSelecterModifier(isActive: isActive))
        }
        .frame(width: kScreen.width * 0.5)
        .background(kConfig.color.backgroundRevert.opacity(isActive ? 1 : 0))
        .clipShape(Capsule())
    }
}
