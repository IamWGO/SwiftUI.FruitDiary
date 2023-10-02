//
//  JsonService.swift
//  FruitDiary
//
//  Created by Waleerat Gottlieb on 2022-05-21.
//

import Foundation

class JSonService<T: Codable> {
    let storageKeyManager = StorageKeyManager()
    
    func encodeSingle(structData: T, forKey: String) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(structData) {
            storageKeyManager.set(forKey, data: encoded)
        }
        
    }
    
    func decodeSingle(forKey: String) -> T? {
        if let jsonData = storageKeyManager.get(forKey) as? Data {
            let decoder = JSONDecoder()
            do {
                let data = try decoder.decode(T.self, from: jsonData)
                return data
            } catch DecodingError.keyNotFound(let key, let context) {
                Swift.print("could not find key \(key) in JSON: \(context.debugDescription)")
            } catch DecodingError.valueNotFound(let type, let context) {
                Swift.print("could not find type \(type) in JSON: \(context.debugDescription)")
            } catch DecodingError.typeMismatch(let type, let context) {
                Swift.print("type mismatch for type \(type) in JSON: \(context.debugDescription)")
            } catch DecodingError.dataCorrupted(let context) {
                Swift.print("data found to be corrupted in JSON: \(context.debugDescription)")
            } catch let error as NSError {
                NSLog("Error in read(from:ofType:) domain= \(error.domain), description= \(error.localizedDescription)")
            }
        }
        return nil
    }
    
    func encodeArray(structData: [T], forKey: String) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(structData) {
            storageKeyManager.set(forKey, data: encoded)
        }
    }
    
    func decodeArray(forKey: String) -> [T]? {
        if let jsonData = storageKeyManager.get(forKey) as? Data { 
            
            let decoder = JSONDecoder()
            do {
                let data = try decoder.decode([T].self, from: jsonData)
                return data
            } catch DecodingError.keyNotFound(let key, let context) {
                Swift.print("could not find key \(key) in JSON: \(context.debugDescription)")
            } catch DecodingError.valueNotFound(let type, let context) {
                Swift.print("could not find type \(type) in JSON: \(context.debugDescription)")
            } catch DecodingError.typeMismatch(let type, let context) {
                Swift.print("type mismatch for type \(type) in JSON: \(context.debugDescription)")
            } catch DecodingError.dataCorrupted(let context) {
                Swift.print("data found to be corrupted in JSON: \(context.debugDescription)")
            } catch let error as NSError {
                NSLog("Error in read(from:ofType:) domain= \(error.domain), description= \(error.localizedDescription)")
            }
        }
        
        return nil
    }
}
