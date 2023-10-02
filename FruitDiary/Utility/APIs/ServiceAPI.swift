//
//  ServiceAPI.swift
//  SvenskaLexikon
//
//  Created by Waleerat Gottlieb on 2022-04-30.
//

import Alamofire
import Combine
import Foundation

class ServiceAPI<Request: Encodable, Response: Decodable> {
    
    func requestWithNoParameters(apiModel: ApiModel) -> AnyPublisher<DataResponse<Response, NetworkError>, Never>
    {
        
        return AlamofireManager
            .sharedManager
            .request(apiModel.url,
                     method: apiModel.method,
                     encoding: apiModel.encoding,
                     headers: apiModel.header
            )
            .publishDecodable(type: Response.self)
           .map { response in
                response.mapError { error in
                    let backendError = response.data.flatMap { try? JSONDecoder().decode(BackendError.self, from: $0)}
                    return NetworkError(initialError: error, backendError: backendError)
                }
            }
           .receive(on: DispatchQueue.main)
           .eraseToAnyPublisher()
    }
    
    
    func request(parameters: Request, apiModel: ApiModel) -> AnyPublisher<DataResponse<Response, NetworkError>, Never>
    {
        return AlamofireManager
                .sharedManager
                .request(apiModel.url,
                         method: apiModel.method,
                         parameters: parameters,
                         encoder: JSONParameterEncoder.default,
                         headers: apiModel.header
                )
                .publishDecodable(type: Response.self)
            .map { response in
                
                response.mapError { error in
                    let backendError = response.data.flatMap { try? JSONDecoder().decode(BackendError.self, from: $0)}
                    return NetworkError(initialError: error, backendError: backendError)
                }
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}

/*
 AlamofireManager
         .sharedManager.request(apiModel.url,
                                method: apiModel.method,
                                parameters: parameters,
                                encoder: JSONParameterEncoder.default,
                                headers: apiModel.header)
     .responseJSON { response in
         print("request >>  \(response.request)")  // original URL request
         print("response >> \(response.response)") // URL response
         print("data >> \(response.data)")     // server data
         print("result >> \(response.result)")   // result of response serialization
     }
 */
