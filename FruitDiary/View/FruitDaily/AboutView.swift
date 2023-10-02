//
//  AboutView.swift
//  FruitDiary
//
//  Created by Waleerat Gottlieb on 2022-05-19.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("About My fruits daily App")
                .modifier(TextHeaderModifier(isBold: true))
            
            Text("My Fruits Diary is a mobile application where you can store the number of fruits you have eaten each day. The user is able to add date entries and for each date choose the fruits eaten on that specific day.")
            
            VStack(alignment: .leading){
                Text("By Waleerat S. Gottlieb")
                Text("+46 727 379 299")
                Text("waleerat.gottlieb@gmail.com")
            }
            
        }.padding()
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
