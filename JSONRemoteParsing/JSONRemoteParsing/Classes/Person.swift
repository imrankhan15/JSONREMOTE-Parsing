//
//  Person.swift
//  JSONRemoteParsing
//
//  Created by Muhammad Faisal Imran Khan on 5/2/19.
//  Copyright © 2019 MI Apps. All rights reserved.
//

import Foundation

struct Person {
   
    let name:          String
    let address:       String
    let email:         String
    let salary:        String
   
    
    
    init?(json: JSON) {
        guard let name =           json["name"] as? String,
            let address =          json["address"] as? String,
            let email =            json["email"] as? String,
            let salary =           json["salary"] as? String
            
            else {return nil}
        self.name =           name
        self.address =        address
        self.email =          email
        self.salary =         salary
       
        
    }
    
  
}
