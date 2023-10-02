//
//  WeekCalendarView.swift
//  DailyEatenFruit
//
//  Created by Waleerat Gottlieb on 2022-05-19.
//

import SwiftUI

struct WeeklyCalendarView: View {
    @EnvironmentObject var weekCalendarVM: WeekCalendarViewModel
    @EnvironmentObject var dailyFruitVM: DailyFruitViewModel
    
    var body: some View {
        
        VStack {
            WeeklyCalendaerHeaderView().environmentObject(weekCalendarVM)
            HStack(spacing: 0){
                
                ForEach(weekCalendarVM.eatenInWeekDays){ item in
                    
                    VStack(spacing: 12){
                        
                        Text(item.day)
                            .font(.body)
                            .fontWeight(.bold)
                            .foregroundColor(item.selectedDate == weekCalendarVM.selectedDate
                                             ? kConfig.color.foregroundRevert.opacity(0.8)
                                             : kConfig.color.foreground)
                        
                        Text(item.date)
                            .font(.body)
                            .foregroundColor(item.selectedDate == weekCalendarVM.selectedDate
                                             ? kConfig.color.foregroundRevert
                                             : kConfig.color.foreground)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical)
                    .background(kConfig.color.currentDateBackground.opacity(item.selectedDate == weekCalendarVM.selectedDate
                                                                            ? 1
                                                                            :item.isCurrentDay ? 0.2 : 0))
                    .clipShape(Capsule())
                    .onTapGesture {
                        withAnimation{
                            weekCalendarVM.selectedDate = item.selectedDate
                            dailyFruitVM.updateDailyEaten(selectedDate: weekCalendarVM.selectedDate)
                        }
                    }
                }
            }
        }//:VStack
    }
}
