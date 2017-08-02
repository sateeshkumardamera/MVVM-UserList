//
//  APIWrapper.swift
//  UserList
//
//  Created by user128664 on 8/1/17.
//  Copyright © 2017 Sateesh. All rights reserved.
//

import Foundation

import UIKit
import Alamofire

class APIWrapper: NSObject {
    
    func getResponseFromServer(_ url: String, completion:@escaping (_ success: Bool, _ output: Any) -> Void) {
        
        let HEADERS = ["Accept": "application/json", "Content-Type": "application/json"]
        Alamofire.request(URL(string: url)!, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: HEADERS)
            .validate()
            .responseJSON { (response) in
                switch response.result {
                case .success(_):
                    completion(true, response.result.value!)
                    break
                case .failure( _):
                    completion(false, "")
                    break
                }
        }
    }
    
}
