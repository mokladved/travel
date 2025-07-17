//
//  NewPopularCollectionViewCell.swift
//  Travel
//
//  Created by Youngjun Kim on 7/17/25.
//

import UIKit
import Kingfisher

class NewPopularCollectionViewCell: UICollectionViewCell {
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var cityNameLabel: UILabel!
    @IBOutlet var explainLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
     

    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setImageView()
    }
    
    private func setImageView() {
        imageView.layer.cornerRadius = imageView.frame.width / 2
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
    }
    
    private func setUI() {
        setImageView()
    }
    
    func configureData(from data: City) {
        let imageUrl = data.cityImage
        let url = URL(string: imageUrl)
        imageView.kf.setImage(
            with: url,
            placeholder: nil,
            options: [
                .processor(DownsamplingImageProcessor(size: imageView.bounds.size)),
                .scaleFactor(UIScreen.main.scale),
                .cacheOriginalImage
            ]
        )
        cityNameLabel.text = "\(data.cityName) | \(data.cityEnglishName)"
        explainLabel.text = data.cityExplain
    }
    
    
    
    
    
    

    
    
    
}
