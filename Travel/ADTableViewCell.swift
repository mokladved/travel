//
//  ADTableViewCell.swift
//  Travel
//
//  Created by Youngjun Kim on 7/15/25.
//

import UIKit

class ADTableViewCell: UITableViewCell {
    
    let adColors: [UIColor] = [.adPink, .adGreen]
    
    @IBOutlet var adButton: UIButton!
    
    @IBOutlet var descLabel: UILabel!
    
    @IBOutlet var adLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setCellUI(from data: Travel) {
        let backgroundColor = adColors[adColors.count % 2]
        
        adButton.setTitle("", for: .normal)
        adButton.backgroundColor = backgroundColor
        adButton.layer.cornerRadius = 5
        adButton.clipsToBounds = true
        
        descLabel.textAlignment = .center
        descLabel.numberOfLines = 0
        descLabel.font = .systemFont(ofSize: 15, weight: .bold)
        descLabel.text = data.title
        
        adLabel.text = "AD"
        adLabel.font = .systemFont(ofSize: 12, weight: .semibold)
        adLabel.layer.borderWidth = 1
        adLabel.clipsToBounds = true
        adLabel.layer.cornerRadius = 3
    }
    
    
}
