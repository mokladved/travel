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
        setCellUI()
    }
    
    func setCellUI() {
        setTitleLabelUI()
        setDescriptionLabelUI()
        setSaveCountLabelUI()
        setImageViewUI()
    }
    
    private func setTitleLabelUI() {
        titleLabel.font = .systemFont(ofSize: 15, weight: .bold)
    }
    
    private func setDescriptionLabelUI() {
        descriptionLabel.font = .systemFont(ofSize: 15)
        descriptionLabel.numberOfLines = 0
    }
    
    private func formatNumber(from count: Int) -> String? {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        let formattedCount = formatter.string(from: NSNumber(value: count))
        
        return formattedCount
    }
    
    private func setSaveCountLabelUI() {
        saveCountLabel.textColor = .lightGray
        saveCountLabel.font = .systemFont(ofSize: 13)
    }
    
    private func setImageViewUI() {
        likeButton.setTitle("", for: .normal)
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
    
    
    func configureData(from data: Travel) {
        titleLabel.text = data.title
        
        guard let grade = data.grade,
              let count = data.save,
              let imageUrl = data.travelImage,
              let isLike = data.like else {
            return
        }
        gradeLabel.attributedText = convertNumberToStar(from: grade)
        descriptionLabel.text = data.description
        
        guard let formattedCount = formatNumber(from: count) else {
            return
        }
        saveCountLabel.text = "· 저장 \(formattedCount))"
        
        let url = URL(string: imageUrl)
        photoImageView.kf.setImage(with: url)
        let heartImageName = isLike ? "heart.fill" : "heart"
        likeButton.setImage(UIImage(systemName: heartImageName), for: .normal)
        likeButton.tintColor = isLike ? .red : .white
    }
}
