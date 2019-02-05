//
//  DetailsViewController.swift
//  JSONRemoteParsing
//
//  Created by Muhammad Faisal Imran Khan on 2/2/19.
//  Copyright © 2019 MI Apps. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet var lblName : UILabel!
    @IBOutlet var lblAddress: UILabel!
    @IBOutlet var lblEmail: UILabel!
    @IBOutlet var lblSalary: UILabel!
    @IBOutlet var lblId: UILabel!
    
    func updatePerson(getData : [NSDictionary], select : Int){
        
        let rowData = (getData[select]) as NSDictionary
        
        self.lblName.text = rowData["Name"] as? String
        self.lblAddress.text = rowData["Address"] as? String
        self.lblEmail.text = rowData["Email"] as? String
        self.lblSalary.text = rowData["Salary"] as? String
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

    
}
