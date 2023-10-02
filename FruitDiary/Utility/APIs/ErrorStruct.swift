//
//  ErrorStruct.swift
//  SvenskaLexikon
//
//  Created by Waleerat Gottlieb on 2022-04-30.
//

import Alamofire

struct NetworkError: Error {
    let initialError: AFError
    let backendError: BackendError?
}

struct BackendError: Codable, Error {
    var status: String
    var message: String
}
