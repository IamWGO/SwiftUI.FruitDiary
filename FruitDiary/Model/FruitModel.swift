//
//  DailyFruitModel.swift
//  FruitDiary
//
//  Created by Waleerat Gottlieb on 2022-05-19.
//
/*
  Model for fruit view
  Struct MapView use for UI
 */

import Foundation 

// Note: - From API
struct FruitModel {
    
    struct Bundle: Codable, Hashable {
        var fruitId: Int
        var fruitType: String
        var amount: Int
    }
    
    struct Request: Encodable {
        var request: String
    }
    
    struct Response: Codable, Hashable {
        var id: Int
        var type: String
        var vitamins: Int
        var image: String
    }
    
    struct MapView: Identifiable, Codable, Hashable{
        var id: Int
        var type: String
        var vitamins: Int
        var amount: Int
        var image: String
    }
}
