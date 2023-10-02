//
//  FruitEatenForm.swift
//  FruitDiary
//
//  Created by Waleerat Gottlieb on 2022-05-19.
//

import SwiftUI
import Kingfisher

struct FruitEatenFormView: View {
    @EnvironmentObject var weekCalendarVM: WeekCalendarViewModel
    @EnvironmentObject var dailyFruitVM: DailyFruitViewModel
    
    @Binding var isEatenFruitFrom: Bool
    @State var fruitSelectedName: String = " "
    @State var fruitId: Int = 0
    @State var nrOfFruit: Int = 1
    
    var body: some View {
        
        VStack{
            Spacer()
            ScrollView(.horizontal, showsIndicators: false) {
                HStack{
                    ForEach(dailyFruitVM.fruitItems, id: \.self){ fruitItem in
                        VStack(spacing: 10){
                            if let  imageUrl = URL(string: kConfig.apiRoot + fruitItem.image) {
                                KFImage(imageUrl)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: kScreen.width * 0.2, height: kScreen.width * 0.2)
                            }
                            
                            VStack(alignment: .leading, spacing: 10) {
                                /*
                                Text(fruitItem.type)
                                    .modifier(TextTitleModifier(foregroundColor: .white, isBold: true))*/
                                VStack(spacing: 5){
                                    Text("vitamins")
                                        .modifier(TextDescriptionModifier(foregroundColor: .white))
                                    Text(String(fruitItem.vitamins))
                                        .modifier(TextTitleModifier(foregroundColor: .white, isBold: true))
                                     
                                }
                                
                            }
                        }
                        .padding()
                        .frame(width: kScreen.width * 0.4)
                        .background(kConfig.color.backgroundRevert)
                        .cornerRadius(20)
                        // shadow....
                        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
                        .onTapGesture {
                            self.fruitSelectedName = fruitItem.type
                            self.fruitId = fruitItem.id
                            self.getCurrentSeleted(fruitId: fruitItem.id, selecteditem: fruitItem)
                             
                        }
                    }
                }
                
                .padding(.horizontal)
            }
            .padding(.vertical, 10)
            Spacer()
            
            Text((nrOfFruit == 0 && fruitId != 0)
                 ? kConfig.message.howMany.replacingOccurrences(of: "#fruit#", with: fruitSelectedName)
                    : fruitId != 0
                 ? kConfig.message.howToSave
                    : kConfig.message.whatYouEat)
                        .modifier(TextDescriptionModifier())
            
            HStack {
                
                Text(fruitSelectedName)
                    .modifier(TextHeaderModifier(isBold: true))
                    
                Spacer() //nrOfFruit > 0 &&
                ButtonWithText(label: kConfig.message.saveButton, isActive: .constant(fruitId != 0)) {
                    let entryId = dailyFruitVM.getEntryIdByDate(selectedDate: weekCalendarVM.selectedDate)
                    dailyFruitVM.updateEntry(entryId: entryId, fruitId: fruitId, nrOfFruit: nrOfFruit)
                    dailyFruitVM.updateDailyEaten(selectedDate: weekCalendarVM.selectedDate)
                    
                    isEatenFruitFrom = false
                    
                }
            }.padding(.horizontal)
            
            HStack {
                IconButtonView(isActive: .constant(nrOfFruit > 0),
                               systemName: "minus",
                               foreground: kConfig.color.foregroundRevert,
                               buttonBackground: kConfig.color.backgroundRevert
                ) {
                    nrOfFruit -= 1
                }
                
                Spacer()
                
                Text(String(nrOfFruit))
                    .modifier(TextHeaderModifier(isBold: true))
                    .padding(.vertical)
                
                Spacer()
                
                IconButtonView(isActive: .constant(fruitId != 0),
                               systemName: "plus",
                               foreground: kConfig.color.foregroundRevert,
                               buttonBackground: kConfig.color.backgroundRevert
                ) {
                    nrOfFruit += 1
                }
                
            }
            .padding(.horizontal)
            

        }
        .onAppear{
            if dailyFruitVM.fruitId != 0 {
                getCurrentSeleted(fruitId: dailyFruitVM.fruitId)
            }
        }
    }
    
    func getCurrentSeleted(fruitId: Int, selecteditem: FruitModel.Response? = nil){
        let selectedItem = dailyFruitVM.getFruitEatenRow(fruitId: fruitId)
        if let selectedItem = selectedItem {
            dailyFruitVM.fruitId = selectedItem.id
            fruitSelectedName = selectedItem.type
            dailyFruitVM.fruitId = selectedItem.amount
            
            self.fruitSelectedName = selectedItem.type
            self.fruitId = selectedItem.id
            self.nrOfFruit = selectedItem.amount
             
        } else {
            if let seleted = selectedItem {
                self.fruitSelectedName = seleted.type
                self.fruitId = seleted.id
                self.nrOfFruit = seleted.amount
            } else {
                nrOfFruit = 1
            }
        }
    }
}
