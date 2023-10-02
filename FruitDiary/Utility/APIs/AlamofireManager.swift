//
//  AlamofireManager.swift
//  SvenskaLexikon
//
//  Created by Waleerat Gottlieb on 2022-04-30.
//

import Alamofire
import Combine
//import CombineCocoa
import Foundation

// MARK: - SessionManager
class AlamofireManager: Alamofire.Session {
    
    static let sharedManager: AlamofireManager = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 30
        configuration.timeoutIntervalForResource = 30

        configuration.requestCachePolicy = .useProtocolCachePolicy
        return AlamofireManager(configuration: configuration)
    }()
}
