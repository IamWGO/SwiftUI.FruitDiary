//
//  WeekDaysModel.swift
//  DailyEatenFruit
//
//  Created by Waleerat Gottlieb on 2022-05-19.
//
/*
  Model for weekly calendar
 */
import Foundation

struct WeekDaysModel: Identifiable {
    var id: String
    var day: String
    var date: String
    var selectedDate: String
    var isCurrentDay: Bool
}
