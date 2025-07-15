//
//  ADTableViewCell.swift
//  Travel
//
//  Created by Youngjun Kim on 7/15/25.
//

import UIKit

class ADTableViewCell: UITableViewCell {

    @IBOutlet var adLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setCellUI(from data: Travel) {
        adLabel.textAlignment = .center
        adLabel.numberOfLines = 2
        adLabel.font = .systemFont(ofSize: 15, weight: .bold)
        adLabel.text = data.title
    }
    
}
