//
//  GetData.swift
//  JSONRemoteParsing
//
//  Created by Muhammad Faisal Imran Khan on 2/2/19.
//  Copyright © 2019 MI Apps. All rights reserved.
//

import UIKit
import Alamofire


class GetData: NSObject {
    var dbData: [NSDictionary]?
    let myUrl = "http://restaurantsbooker.de/sqlToJson.php" as String
    
    enum JSONError : String, Error{
        case NoData = "Error: No Data"
        case ConversionFailed = "Error: conversion from JSON Failed"
        
    }
    
    
    func jsonParser(){
        
       
        guard let endpoint = URL(string: "http://restaurantsbooker.de/sqlToJson.php" ) else {
            print("Error creating connection")
            return
        }
        AF.request(endpoint, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { (response:DataResponse<Any>) in
            
            switch(response.result) {
            case .success(_):
                if let data = response.result.value as? [NSDictionary] {
                    print(data)
                    self.dbData = data
                    
                    
                    
                    
                }
                break
                
            case .failure(_):
                print(response.result.error)
                break
                
            }
        }
        
        
    }
}
