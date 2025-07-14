//
//  TravelTableViewCell.swift
//  Travel
//
//  Created by Youngjun Kim on 7/14/25.
//

import UIKit

class TravelTableViewCell: UITableViewCell {
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    @IBOutlet var gradeLabel: UILabel!
    @IBOutlet var saveCountLabel: UILabel!
    
    @IBOutlet var photoImageView: UIImageView!
    @IBOutlet var likeButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }
    
    func setUI() {
        setTitleLabelUI()
        setDescriptionLabelUI()
    }
    
    func setTitleLabelUI() {
        titleLabel.font = .systemFont(ofSize: 15, weight: .bold)
    }
    
    func setDescriptionLabelUI() {
        descriptionLabel.font = .systemFont(ofSize: 15)
        descriptionLabel.numberOfLines = 0
    }
}
