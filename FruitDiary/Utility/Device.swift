//
//  Device.swift
//  DailyEatenFruit
//
//  Created by Waleerat Gottlieb on 2022-05-19.
//

import SwiftUI

// MARK: - Devices
enum Device{
   case iPhone
   case iPad
   case macOS
}
 

// getting device Type....
func getDevice()->Device{
    #if os(iOS)
    
    // Since There is No Direct For Getting iPad OS...
    // Alternative Way...
    if UIDevice.current.model.contains("iPad"){
        return .iPad
    }
    else{
        return .iPhone
    }
    #else
    return .macOS
    #endif
}
 
// Safe Area Bottom..
func getBottomSafeArea()->CGFloat{
    #if os(iOS)
    return UIApplication.shared.windows.first?.safeAreaInsets.bottom ?? 10
    #else
    return 10
    #endif
}

func getTopSafeArea()->CGFloat{
    #if os(iOS)
    return UIApplication.shared.windows.first?.safeAreaInsets.top ?? 10
    #else
    return 10
    #endif
}

func isIpadAndMacOS() -> Bool {
    return  getDevice() == .iPad || getDevice() == .macOS ? true : false
}

func isIpadAndIphone() -> Bool {
    return  getDevice() == .iPad || getDevice() == .iPhone ? true : false
}

func isIpad() -> Bool {
    return  getDevice() == .iPad ? true : false
}

func isIphone() -> Bool {
    return  getDevice() == .iPhone ? true : false
}
 
func getColumn() -> [GridItem] {
    if isIpad() {
        return [
                GridItem(.flexible()),
                GridItem(.flexible()),
            ]
    } else {
        return [GridItem(.flexible())]
    }
}
