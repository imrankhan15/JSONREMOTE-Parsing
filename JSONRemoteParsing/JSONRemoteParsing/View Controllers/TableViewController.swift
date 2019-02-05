//
//  TableViewController.swift
//  JSONRemoteParsing
//
//  Created by Muhammad Faisal Imran Khan on 2/2/19.
//  Copyright © 2019 MI Apps. All rights reserved.
//

import UIKit
import Alamofire

class TableViewController: UITableViewController {

    var data_found = 0;
  //  var timer : Timer!
   // let getData = GetData()
     var dbData: [NSDictionary]?
    @IBOutlet var myTable : UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //self.timer = Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(self.refreshTable), userInfo: nil, repeats: true)
        
        DispatchQueue.global(qos: .background).async {
         //   print("This is run on the background queue")
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
                        DispatchQueue.main.async {
                            self.data_found = 1
                            self.tableView.reloadData()
                        }
                    //    self.data_found = 1
                      //  self.tableView.reloadData()
                        
                        
                    }
                    break
                    
                case .failure(_):
                    print(response.result.error)
                    break
                    
                }
            
        }
       // getData.jsonParser()
    }
 }
    
  /*  @objc func refreshTable(){
        if(getData.dbData)! != nil
        {
            
            self.timer.invalidate()
        }
    }
   */
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
         return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if data_found == 0 {
            return 0
        }
        else {
            return (dbData?.count)!
        }
    }

 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as? MyDataTableViewCell ?? MyDataTableViewCell(style: .default, reuseIdentifier: "myCell")
        

        // Configure the cell...
        let row = indexPath.row
        
        let rowData = (dbData?[row])! as NSDictionary
        cell.myLogo.image = UIImage(named: "butterfly.png")
        cell.myName.text = rowData["Name"] as? String
        cell.myEmail.text = rowData["Email"] as? String
        

        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let split = self.splitViewController{
            let controllers = split.viewControllers
            let detailsViewController = controllers[controllers.count - 1] as? DetailsViewController
            detailsViewController?.updatePerson(getData: dbData!, select: indexPath.row)
        }
    }

    

}
