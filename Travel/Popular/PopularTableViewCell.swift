//
//  PopularTableViewCell.swift
//  Travel
//
//  Created by Youngjun Kim on 7/16/25.
//

import UIKit

final class PopularTableViewCell: UITableViewCell {
    
    @IBOutlet var imageWrappedView: UIView!
    @IBOutlet var cityLabel: UILabel!
    @IBOutlet var explainLabel: UILabel!
    @IBOutlet var cityimage: UIImageView!
    
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
        cityLabel.font = .systemFont(ofSize: 20, weight: .bold)
        cityLabel.textColor = .black
        cityLabel.text = "가나다라마바사아"
        cityLabel.textAlignment = .right
    }
    
    func setExplainLabelUI() {
        explainLabel.backgroundColor = .black.withAlphaComponent(0.3)
        explainLabel.font = .systemFont(ofSize: 15)
        explainLabel.textColor = .white
    }
    
}
