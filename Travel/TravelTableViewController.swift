//
//  TravelTableViewController.swift
//  Travel
//
//  Created by Youngjun Kim on 7/14/25.
//

import UIKit
import Kingfisher

class TravelTableViewController: UITableViewController {

    let travelInfo = TravelInfo().travel
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let xib = UINib(nibName: "TravelTableViewCell", bundle: nil)
        tableView.register(xib, forCellReuseIdentifier: "TravelTableViewCell")
        
        
        let adXib = UINib(nibName: "ADTableViewCell", bundle: nil)
        tableView.register(adXib, forCellReuseIdentifier: "ADTableViewCell")
        
        tableView.rowHeight = UITableView.automaticDimension
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let data = travelInfo[indexPath.row]
        
        if data.ad {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ADTableViewCell", for: indexPath) as! ADTableViewCell
            cell.setCellUI(from: data)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TravelTableViewCell", for: indexPath) as! TravelTableViewCell
            cell.setCellUI(from: data)
            return cell
        }
    }
}
