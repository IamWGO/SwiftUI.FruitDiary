//
//  URLUtility.swift
//  SvenskaLexikon
//
//  Created by Waleerat Gottlieb on 2022-04-30.
//

import Alamofire
import Foundation

struct ApiModel{
    var url : RequestPath
    var method: HTTPMethod = .get
    var encoding: URLEncoding = .httpBody
    var header: HTTPHeaders = [:]
}

enum RequestPath: URLConvertible {
    
    var url: String {
        return kConfig.apiRoot
    }
    
    case fruitList
    case entriesList
    case addEntries
    case updateEntries(entryId: Int, fruitId: Int, nrOfFruit: Int)
    case removeEntriesList
    case removeEntriesById(entryId: Int)
    
    var path: String {
        switch self {
        case .fruitList:
            return "api/fruit"
            
        case .entriesList, .addEntries, .removeEntriesList:
            return "api/entries"
            
        case .updateEntries(let entryId,let fruitId, let nrOfFruit):
            return "api/entry/\(entryId)/fruit/\(fruitId)?amount=\(nrOfFruit)"
       
        case .removeEntriesById(let entryId):
            return "api/entry/\(entryId)"
        }
    }
    
    func asURL() throws -> URL {
        let requestURL = url + path
        
        let encodedLink = requestURL.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)
        let encodedURL = NSURL(string: encodedLink!)! as URL
        print("\n\(encodedURL)\n")
        return encodedURL
    }
}


/*
  The available fruits are located at:
  GET ​https://fruitdiary.test.themobilelife.com/api/fruit
  The current entries are located at:
  GET ​https://fruitdiary.test.themobilelife.com/api/entries
  To remove all current entries:
  DELETE ​https://fruitdiary.test.themobilelife.com/api/entries
  Remove a specific entry:
  DELETE ​https://fruitdiary.test.themobilelife.com/api/entry/{entryId}
  - Parameter entryId: The id of an existing entry to remove.
  Add an entry:
  Content-Type: application/json
  POST ​https://fruitdiary.test.themobilelife.com/api/entries
  - JSON Request Body:
  {
  "date": "2018-01-16"
  }

  Set/edit a fruit:
  Content-Type: application/json
  POST ​https://fruitdiary.test.themobilelife.com/api/entry/{entryId}/fruit/{fruitId}?amount={nrOfFruit}
  */
