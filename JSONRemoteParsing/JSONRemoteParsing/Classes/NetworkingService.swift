//
//  NetworkingService.swift
//  JSONRemoteParsing
//
//  Created by Muhammad Faisal Imran Khan on 5/2/19.
//  Copyright © 2019 MI Apps. All rights reserved.
//

import Foundation
import Alamofire

typealias JSON = [String: Any]

class NetworkingService{
    static let shared = NetworkingService()
    private init(){}
    var dbData: [NSDictionary]?
    
    enum JSONError : String, Error{
        case NoData = "Error: No Data"
        case ConversionFailed = "Error: conversion from JSON Failed"
        
    }
    
    func getPeople(success successBlock: @escaping (GetPeopleResponse) -> Void) {
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
