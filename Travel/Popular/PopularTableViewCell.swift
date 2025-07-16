//
//  PopularTableViewCell.swift
//  Travel
//
//  Created by Youngjun Kim on 7/16/25.
//

import UIKit
import Kingfisher

final class PopularTableViewCell: UITableViewCell {
    
    @IBOutlet var imageWrappedView: UIView!
    @IBOutlet var cityLabel: UILabel!
    @IBOutlet var explainLabel: UILabel!
    @IBOutlet var cityImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setCellUI()
    }
    
    func setCellUI() {
        setImageWrappedViewUI()
        setCityLabelUI()
        setExplainLabelUI()
    }
    
    func setImageWrappedViewUI() {
        imageWrappedView.layer.cornerRadius = 20
        imageWrappedView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMaxYCorner]
        imageWrappedView.clipsToBounds = true
        imageWrappedView.backgroundColor = .red
    }
    
    func setCityLabelUI() {
        cityLabel.font = .systemFont(ofSize: 22, weight: .bold)
        cityLabel.textColor = .white
        cityLabel.textAlignment = .right
    }
    
    func setExplainLabelUI() {
        explainLabel.backgroundColor = .black.withAlphaComponent(0.3)
        explainLabel.font = .systemFont(ofSize: 15)
        explainLabel.textColor = .white
    }
    
    func configureData(from data: City) {
        let url = URL(string: data.cityImage)
        cityImageView.kf.setImage(
            with: url,
            placeholder: nil,
            options: [
                .processor(DownsamplingImageProcessor(size: cityImageView.bounds.size)),
                .scaleFactor(UIScreen.main.scale),
                .cacheOriginalImage
            ]
        )
        
        cityLabel.text = "\(data.cityName) | \(data.cityEnglishName)"
        explainLabel.text = data.cityExplain
    }
    
}
