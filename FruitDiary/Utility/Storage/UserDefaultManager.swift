//
//  UserDefaultManager.swift
//  FruitDiary
//
//  Created by Waleerat Gottlieb on 2022-05-20.
//

import Foundation

struct StorageKeyManager {
    
    let userDefaults = UserDefaults.standard
    
    func set(_ forKey: String, data: Any) {
        userDefaults.set(data, forKey: forKey)
        userDefaults.synchronize()
    }
    
    func get(_ forKey: String) -> Any? {
        if let locallyData = userDefaults.object(forKey: forKey) {
           return locallyData
        } else {
            return nil
        }
    }
    
    func remove(_ forKey: String) -> Bool {
        if let _ = userDefaults.object(forKey: forKey) {
            userDefaults.removeObject(forKey: forKey)
            userDefaults.synchronize()
            return true
        } else {
            return false
        }
    }
    
    func isExist(_ forKey: String) -> Bool {
        if let _ = userDefaults.object(forKey: forKey) {
            return true
        } else {
            return false
        }
    }
}

