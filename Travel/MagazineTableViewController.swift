//
//  MagazineTableViewController.swift
//  Travel
//
//  Created by Youngjun Kim on 7/13/25.
//

import UIKit
import Kingfisher

final class MagazineTableViewController: UITableViewController {
    
    let magazineInfo = MagazineInfo()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return magazineInfo.magazine.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "travelCell", for: indexPath) as! MagazineTableViewCell
        
        let rawUrl = magazineInfo.magazine[indexPath.row].photoImage
        let imageUrl = URL(string: rawUrl)
        cell.photoImageView.kf.setImage(with: imageUrl)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 350
    }
    
}

