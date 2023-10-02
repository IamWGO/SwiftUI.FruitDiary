//
//  FruitEatenListView.swift
//  FruitDiary
//
//  Created by Waleerat Gottlieb on 2022-05-20.
//

import SwiftUI
import Kingfisher

struct FruitEatenListView: View {
    @EnvironmentObject var weekCalendarVM: WeekCalendarViewModel
    @EnvironmentObject var dailyFruitVM: DailyFruitViewModel
    
    @Binding var isEatenFruitFrom:Bool
    
    var body: some View {
        // Note: - Fruit List button
        VStack(alignment: .leading, spacing: 10) {
            ForEach(dailyFruitVM.getDailyEaten(selectedDate: weekCalendarVM.selectedDate)){ fruitItem in
                
                ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
                    HStack(spacing: 10){
                        
                        KFImage(URL(string: fruitItem.image)!)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: kScreen.width * 0.3, height: kScreen.width * 0.3)
                        
                        
                        VStack(alignment: .leading, spacing: 5) {
                            Text(fruitItem.type)
                                .modifier(TextTitleModifier(foregroundColor: .white, isBold: true))
                            
                            VStack(alignment: .leading, spacing: 5) {
                                HStack{
                                    Text("Eaten:")
                                        .modifier(TextDescriptionModifier(foregroundColor: .white))
                                    Text(String(fruitItem.amount))
                                        .modifier(TextTitleModifier(foregroundColor: .white, isBold: true))
                                    Text("Item")
                                        .modifier(TextDescriptionModifier(foregroundColor: .white))
                                }
                                
                                HStack{
                                    Text("vitamins:")
                                        .modifier(TextDescriptionModifier(foregroundColor: .white))
                                    Text(String(fruitItem.vitamins))
                                        .modifier(TextTitleModifier(foregroundColor: .white, isBold: true))
                                    Text("per Item")
                                        .modifier(TextDescriptionModifier(foregroundColor: .white))
                                }
                                
                            }
                            Spacer()
                        }
                        Spacer()
                    }
                    .padding()
                }
                .onTapGesture {
                    dailyFruitVM.fruitId = fruitItem.id
                    dailyFruitVM.nrOfFruit = fruitItem.amount
                    isEatenFruitFrom.toggle()
                }
                .frame(width: kScreen.width * 0.9)
                .background(kConfig.color.backgroundRevert)
                .cornerRadius(20)
                // shadow....
                .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
            }
        }
        
        .padding(.horizontal)
    }
}
