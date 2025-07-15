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
    
    func setGradeLabelUI(from grade: Double) {
        gradeLabel.attributedText = convertNumberToStar(from: grade)
    }
    
    func convertNumberToStar(from grade: Double) -> NSAttributedString {
        let roundedGrade = Int(round(grade))
        
        let filledStar = String(repeating: "★", count: roundedGrade)
        let unfilledStar = String(repeating: "★", count: 5 - roundedGrade)
        
        let filledStarAttribute: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor.yellow]
        let unfilledStarAttribute: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor.lightGray]
        
        let attributedFilledStar = NSAttributedString(string: filledStar, attributes: filledStarAttribute)
        let attributedUnfilledStar = NSAttributedString(string: unfilledStar, attributes: unfilledStarAttribute)
        
        let concatenateString = NSMutableAttributedString()
        concatenateString.append(attributedFilledStar)
        concatenateString.append(attributedUnfilledStar)
        
        return concatenateString
    }
}
