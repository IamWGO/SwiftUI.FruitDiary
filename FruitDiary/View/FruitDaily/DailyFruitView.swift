//
//  DailyFruitView.swift
//  FruitDiary
//
//  Created by Waleerat Gottlieb on 2022-05-19.
//

import SwiftUI

struct DailyFruitView: View {
    @EnvironmentObject var weekCalendarVM: WeekCalendarViewModel
    @EnvironmentObject var dailyFruitVM: DailyFruitViewModel
    
    @State var isEatenFruitFrom:Bool = false
    
    @State var isAddEntry:Bool = false
    @State var dailyEatenList: [FruitModel.MapView] = []
    @State var showDeleteEntryAlert: Bool = false
     
    var body: some View {
        VStack{
            HStack{
                Spacer()
                // Note: - Add fruit and remove entry button
                if let _ = dailyFruitVM.getDailyItem(selectedDate: weekCalendarVM.selectedDate) {
                    IconButtonView(isActive: .constant(true),
                                   systemName: "plus",
                                   width: 20,
                                   height: 20,
                                   foreground: kConfig.color.foreground,
                                   buttonBackground: kConfig.color.buttonBackground
                    ) {
                        isEatenFruitFrom = true
                    }.halfSheet(showSheet: $isEatenFruitFrom) {
                        FruitEatenFormView(isEatenFruitFrom: $isEatenFruitFrom)
                            .environmentObject(weekCalendarVM)
                            .environmentObject(dailyFruitVM)
                    } onEnd: {
                        dailyFruitVM.updateDailyEaten(selectedDate: weekCalendarVM.selectedDate)
                    }
                    
                    if (dailyFruitVM.entryItems.count > 0) {
                        IconButtonView(isActive: .constant(true),
                                       systemName: "xmark.bin",
                                       width: 17,
                                       height: 20,
                                       foreground: kConfig.color.foreground,
                                       buttonBackground: kConfig.color.buttonBackground
                        ) {
                            showDeleteEntryAlert = true
                            isEatenFruitFrom = false
                        }
                        .confirmationDialog(
                            kConfig.message.deleteButton,
                            isPresented: $showDeleteEntryAlert
                        ) {
                            Button {
                                let entryId = dailyFruitVM.getEntryIdByDate(selectedDate: weekCalendarVM.selectedDate)
                                 dailyFruitVM.removeEntryById(entryId: entryId)
                            } label: {
                                Text(kConfig.message.deleteButton)
                            }
                        }
                    }
                       
                } else {
                    // Note: - Add entry button
                    if weekCalendarVM.currentDate >= weekCalendarVM.selectedDate {
                        HStack {
                            ButtonWithText(label: kConfig.message.addNewEntry, isActive: .constant(true)) {
                                dailyFruitVM.addEntry(dateStr: weekCalendarVM.selectedDate)
                            }
                        }
                    }
                }
            }
            .padding(.horizontal)
            
            // Note: - Fruit eaten list
            FruitEatenListView(isEatenFruitFrom: $isEatenFruitFrom)
            
        }
    }
}
