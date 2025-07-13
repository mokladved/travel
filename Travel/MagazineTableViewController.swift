//
//  MagazineTableViewController.swift
//  Travel
//
//  Created by Youngjun Kim on 7/13/25.
//

import UIKit
import Kingfisher

final class MagazineTableViewController: UITableViewController {
    
    private let magazineInfo = MagazineInfo()
    
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
        
        let rawDate = magazineInfo.magazine[indexPath.row].date
        let date = formatDate(rawDate, style: "yy년 MM월 dd일")
        cell.dateLabel.text = date
        
        let rawTitle = magazineInfo.magazine[indexPath.row].title
        cell.titleLabel.text = rawTitle
        
        let rawSubtitle = magazineInfo.magazine[indexPath.row].subtitle
        cell.subtitleLabel.text = rawSubtitle
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 350
    }
    
    private func formatDate(_ date: String, style: String) -> String? {
        let formatter = DateFormatter()
        guard let date = formatter.date(from: date) else {
            return nil
        }
        formatter.dateFormat = style
        
        return formatter.string(from: date)
    }
    
    
    
    
}

