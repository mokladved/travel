//
//  PopularTableViewCell.swift
//  Travel
//
//  Created by Youngjun Kim on 7/16/25.
//

import UIKit

final class PopularTableViewCell: UITableViewCell {
    
    @IBOutlet var imageWrappedView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setImageView()
    }
    
    func setImageView() {
        imageWrappedView.layer.cornerRadius = 20
        imageWrappedView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMaxYCorner]
        imageWrappedView.clipsToBounds = true
    }

    
}
