//
//  LoginService.swift
//  MyApplication
//
//  Created by Rodner Raymundo on 4/12/16.
//  Copyright © 2016 Rodner Raymundo. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class LoginService: NSObject {
    
    func authenticate(username: String, password: String, completionHandler: (NSDictionary?) -> ()){
        let json = ["username": username, "password": password] as Dictionary<String, String>
        let headers = ["Content-Type": "Application/json"]
        print(json)
        
        Alamofire.request(.POST, "http://localhost:8080/api/authenticate", parameters: json, headers: headers, encoding: .JSON).responseJSON{
            response in
            if response.result.value != nil {
                completionHandler(response.result.value as? NSDictionary)
            } else if response.result.error?.localizedDescription != nil {
                completionHandler(["error": (response.result.error?.localizedDescription)!])
            }
        }
    }
    
}