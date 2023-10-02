//
//  DailyEatenFruitApp.swift
//  DailyEatenFruit
//
//  Created by Waleerat Gottlieb on 2022-05-19.
//


import SwiftUI

@main
struct DailyEatenFruitApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var weekCalendarVM = WeekCalendarViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(weekCalendarVM)
        }
    }
}



class AppDelegate: NSObject, UIApplicationDelegate {
 
   // Note: - Force protrait orientation
   var deviceOrientation = UIInterfaceOrientationMask.portrait
    
   func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
       return deviceOrientation
   }
    
}



