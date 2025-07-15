//
//  TravelTableViewCell.swift
//  Travel
//
//  Created by Youngjun Kim on 7/14/25.
//

import UIKit

final class TravelTableViewCell: UITableViewCell {
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var descriptionLabel: UILabel!
    
    @IBOutlet private var gradeLabel: UILabel!
    @IBOutlet private var saveCountLabel: UILabel!
    
    @IBOutlet private var photoImageView: UIImageView!
    @IBOutlet var likeButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setCellUI(from data: Travel) {
        setTitleLabelUI(from: data)
        setDescriptionLabelUI(from: data)
        setGradeLabelUI(from: data)
        setSaveCountLabelUI(from: data)
        setImageViewUI(from: data)
    }
    
    private func setTitleLabelUI(from data: Travel) {
        titleLabel.font = .systemFont(ofSize: 15, weight: .bold)
        titleLabel.text = data.title
    }
    
    private func setDescriptionLabelUI(from data: Travel) {
        descriptionLabel.font = .systemFont(ofSize: 15)
        descriptionLabel.numberOfLines = 0
        descriptionLabel.text = data.description
    }
    
    private func setGradeLabelUI(from data: Travel) {
        guard let grade = data.grade else {
            return
        }
        gradeLabel.attributedText = convertNumberToStar(from: grade)
    }
    
    private func setSaveCountLabelUI(from data: Travel) {
        guard let count = data.save else {
            return
        }
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        let formattedCount = formatter.string(from: NSNumber(value: count))
        guard let formattedCount = formattedCount else {
            return
        }
        saveCountLabel.text = "·  저장 \(formattedCount)"
        saveCountLabel.textColor = .lightGray
        saveCountLabel.font = .systemFont(ofSize: 13)
    }
    
    private func setImageViewUI(from data: Travel) {
        guard let imageUrl = data.travelImage,
              let isLike = data.like else {
            return
        }
        let url = URL(string: imageUrl)
        photoImageView.kf.setImage(with: url)
        
        let heartImageName = isLike ? "heart.fill" : "heart"
        likeButton.setTitle("", for: .normal)
        likeButton.setImage(UIImage(systemName: heartImageName), for: .normal)
        likeButton.tintColor = isLike ? .red : .white
    }
    
    private func convertNumberToStar(from grade: Double) -> NSAttributedString {
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
