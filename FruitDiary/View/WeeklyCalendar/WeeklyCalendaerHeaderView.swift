//
//  WeeklyCalendaerHeader.swift
//  DailyEatenFruit
//
//  Created by Waleerat Gottlieb on 2022-05-19.
//

import SwiftUI

struct WeeklyCalendaerHeaderView: View {
    @EnvironmentObject var weekCalendarVM: WeekCalendarViewModel
    @EnvironmentObject var dailyFruitVM: DailyFruitViewModel
    
    var body: some View {
        HStack(alignment: .center) {
            
            IconButtonView(isActive: .constant(true), systemName: "arrow.left",foreground: kConfig.color.foreground) {
                weekCalendarVM.previousWeekRange()
                dailyFruitVM.updateDailyEaten(selectedDate: "")
            }
            .modifier(ArrowModifier())
            
            Spacer()
            
            Button(action: {
                weekCalendarVM.currentWeekRange()
            }, label: {
                Text(weekCalendarVM.getMonth())
                    .modifier(TextTitleModifier(isBold: true))
                    .padding(.vertical)
            })
            
            Spacer()
            
            IconButtonView(isActive: .constant(true), systemName: "arrow.right",foreground: kConfig.color.foreground) {
                weekCalendarVM.nextWeekRange()
                dailyFruitVM.updateDailyEaten(selectedDate: "")
            }
            .modifier(ArrowModifier())
           
        }
        .padding(.horizontal)
    }
}

