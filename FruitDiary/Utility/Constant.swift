//
//  Constant.swift
//  DailyEatenFruit
//
//  Created by Waleerat Gottlieb on 2022-05-19.
//

import SwiftUI

public let kScreen = UIScreen.main.bounds
var randomColors = ["blue","green","orange", "purple","red","darkpurple"]

struct kConfig {
    static let apiRoot: String = "https://fruitdiary.test.themobilelife.com/"
    
    struct color {
        static let backgroundHex: String = "#E8F9FD"
        static let foregroundHex: String = "#000000"
       
        static let background: Color = Color("background")
        static let foreground: Color = Color("foreground")
        static let backgroundRevert: Color = Color("foreground")
        static let foregroundRevert: Color = Color("background")
        static let currentDateBackground =  Color.yellow
        static let buttonBackground = Color.yellow
        static let buttonForeground = Color("background")
    }
    
    struct message {
        static let saveButton: String = "Save"
        static let deleteButton: String = "Delete"
        static let confrimDelete: String = "Are you sure?"
        static let howToSave: String = "Save data tap \"Save\" button."
        static let whatYouEat: String = "What did you eat?"
        static let howMany: String = "How many did #fruit# you eat?"
        static let addNewEntry: String = "New entry"
    }
    
    struct error {
        static let errorRequest: String = "Something went wrong"
        static let errorDefault: String = "Something went wrong"
    }
}
 
