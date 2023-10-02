//
//  DashboardView.swift
//  FruitDiary
//
//  Created by Waleerat Gottlieb on 2022-05-19.
//

import SwiftUI

struct DashboardView: View {
    @EnvironmentObject var weekCalendarVM: WeekCalendarViewModel
    @EnvironmentObject var dailyFruitVM: DailyFruitViewModel 
    
    @State var index = 0
    
    var body: some View {
        
        VStack {
            // Note: - Slide Menu
            HStack(spacing: 0){
                TabSlideBarView(title: "My Daily", isActive: .constant(self.index == 0))
                    .onTapGesture {
                        withAnimation(.default){
                            self.index = 0
                        }
                    }
                TabSlideBarView(title: "About", isActive: .constant(self.index == 1))
                    .onTapGesture {
                        withAnimation(.default){
                            self.index = 1
                        }
                    }
                
            }//:HStack
            
            .background(Color.black.opacity(0.03))
            .padding(.bottom,10)
            .clipShape(Capsule())
            
            // Note: - Body View
            // MARK: - Preview Selection
            TabView(selection: self.$index){
                ScrollView(.vertical, showsIndicators: false) {
                    ScrollView(.vertical, showsIndicators: false) {
                        WeeklyCalendarView()
                           .environmentObject(weekCalendarVM)
                           .environmentObject(dailyFruitVM)
                        
                       
                        DailyFruitView()
                            .environmentObject(weekCalendarVM)
                            .environmentObject(dailyFruitVM)
                        
                    }
                }.tag(0)
                
                ScrollView(.vertical, showsIndicators: false) {
                    AboutView()
                }.tag(1)
            }//:TabView
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            
            Spacer(minLength: 0)
            
        }//: VStack
    }
}

