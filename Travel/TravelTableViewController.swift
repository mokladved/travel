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
        tableView.rowHeight = UITableView.automaticDimension
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TravelTableViewCell", for: indexPath) as! TravelTableViewCell
        
        let data = travelInfo[indexPath.row]
        
        if let title = data.title,
           let desc = data.description,
           let grade = data.grade,
           let saveCount = data.save,
           let imageUrl = data.travelImage,
           let ad = data.ad,
           let like = data.like {
            cell.titleLabel.text = title
            cell.descriptionLabel.text = desc
            cell.gradeLabel.text = "\(grade)"
            cell.saveCountLabel.text = "\(saveCount)"
            
            let url = URL(string: imageUrl)
            cell.photoImageView.kf.setImage(with: url)
            
            let heartImage = like ? "star.fill" : "star"
            cell.likeButton.setImage(UIImage(systemName: heartImage), for: .normal)
            cell.likeButton.setTitle("", for: .normal)
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}
