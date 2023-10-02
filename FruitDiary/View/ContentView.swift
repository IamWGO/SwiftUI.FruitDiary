//
//  ContentView.swift
//  DailyEatenFruit
//
//  Created by Waleerat Gottlieb on 2022-05-19.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.openURL) var openURL
    @EnvironmentObject var weekCalendarVM: WeekCalendarViewModel
    @StateObject var dailyFruitVM = DailyFruitViewModel()
    
    var body: some View {
        VStack{
            HStack{
                
                Text("Daily Fruit")
                    .modifier(TextTitleModifier(isBold: true))
                
                Spacer(minLength: 0)
                
                Button(action: {
                    openURL(URL(string: "https://iamwgo.com/waleerat-cv/")!)
                }, label: {
                    Image(systemName: "info.circle")
                        .resizable()
                        .renderingMode(.template)
                        .frame(width: 20, height: 20)
                        .foregroundColor(kConfig.color.foreground)
                })
            }
            .padding()
            
            DashboardView()
                .environmentObject(weekCalendarVM)
                .environmentObject(dailyFruitVM)
                
            Spacer()
        }
        
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
