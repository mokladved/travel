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
    lazy var copiedTravelInfo = travelInfo
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let xib = UINib(nibName: "TravelTableViewCell", bundle: nil)
        tableView.register(xib, forCellReuseIdentifier: "TravelTableViewCell")
        
        
        let adXib = UINib(nibName: "ADTableViewCell", bundle: nil)
        tableView.register(adXib, forCellReuseIdentifier: "ADTableViewCell")
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 200
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return copiedTravelInfo.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let data = copiedTravelInfo[indexPath.row]
        
        if data.ad {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ADTableViewCell", for: indexPath) as! ADTableViewCell
            cell.setCellUI(from: data)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TravelTableViewCell", for: indexPath) as! TravelTableViewCell
            cell.setCellUI(from: data)
            cell.likeButton.tag = indexPath.row
            cell.likeButton.addTarget(self, action: #selector(likeButtonTapped), for: .touchUpInside)

            return cell
        }
        
        
    }
        
    @objc func likeButtonTapped(_ sender: UIButton) {
        let index = sender.tag
        guard let status = copiedTravelInfo[index].like else {
            return
            
        }
        copiedTravelInfo[index].like = !status
        let indexPathToReload = IndexPath(row: index, section: 0)
        tableView.reloadRows(at: [indexPathToReload], with: .fade)
    }
}
