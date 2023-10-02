//
//  WeekCalendarViewModel.swift
//  DailyEatenFruit
//
//  Created by Waleerat Gottlieb on 2022-05-19.
//

import Foundation

class WeekCalendarViewModel: ObservableObject {
    
    @Published var currentDate: String = Date().toString(format: "yyyy-MM-dd")
    @Published var selectedDate: String = Date().toString(format: "yyyy-MM-dd")
    @Published var dateOfSelectedWeek: Date = Date()
    @Published var eatenInWeekDays : [WeekDaysModel] = []
    
    init(){
        getWeekDays()
    }
    
    func previousWeekRange() {
        eatenInWeekDays = []
        dateOfSelectedWeek = dateOfSelectedWeek.weekPrevious()
        selectedDate = dateOfSelectedWeek.toString(format: "yyyy-MM-dd")
        getWeekDays()
    }
    
    func currentWeekRange() {
        eatenInWeekDays = []
        dateOfSelectedWeek = Date()
        getWeekDays()
    }
    
    func nextWeekRange(){
        eatenInWeekDays = []
        dateOfSelectedWeek = dateOfSelectedWeek.weekNext()
        selectedDate = dateOfSelectedWeek.toString(format: "yyyy-MM-dd")
        getWeekDays()
    }
    
    func getMonth() -> String {
        return dateOfSelectedWeek.toString(format: "LLLL yyyy")
    }
  
    
    func getWeekDays(){
        
        let startDate = self.dateOfSelectedWeek.firstDateOfWeek()
        let nuberOfWeek = self.dateOfSelectedWeek.numberOfWeek() - 2
        
        for index in 0..<7 {
            let dateItem = startDate.dateCalculate(numberOfDays: index)
            
            let indexDateFormat = dateItem.toString(format: "yyyy-MM-dd")
            
            self.eatenInWeekDays.append(
                WeekDaysModel(id: UUID().uuidString,
                              day: dateItem.toString(format: "EEE"),
                              date: dateItem.toString(format: "dd"),
                              selectedDate: indexDateFormat,
                              isCurrentDay: nuberOfWeek == index ? true : false)
            )
            
        }
    }
}
