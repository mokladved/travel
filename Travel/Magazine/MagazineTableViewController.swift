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
        setUI()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return magazineInfo.magazine.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "travelCell", for: indexPath) as! MagazineTableViewCell
        
        let data = magazineInfo.magazine
        
        let rawUrl = data[indexPath.row].photoImage
        let imageUrl = URL(string: rawUrl)
        cell.photoImageView.kf.setImage(with: imageUrl)
        
        let rawDate = data[indexPath.row].date
        let date = formatDate(rawDate, style: "yy년 MM월 dd일")
        cell.dateLabel.text = date
        
        let rawTitle = data[indexPath.row].title
        cell.titleLabel.text = rawTitle
        
        let rawSubtitle = data[indexPath.row].subtitle
        cell.subtitleLabel.text = rawSubtitle
        
        return cell
    }
    
    private func formatDate(_ date: String, style: String) -> String? {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyMMdd"

        guard let date = formatter.date(from: date) else {
            return nil
        }

        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = style
        
        return outputFormatter.string(from: date)
    }
    
    private func setUI() {
        setTableViewUI()
        setNavBarTitle()
    }
    
    private func setTableViewUI() {
        tableView.rowHeight = 480
        tableView.separatorStyle = .none
    }
    
    private func setNavBarTitle() {
        navigationItem.title = "SESAC TRAVEL"
    }
}

