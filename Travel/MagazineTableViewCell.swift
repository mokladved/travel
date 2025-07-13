//
//  MagazineTableViewCell.swift
//  Travel
//
//  Created by Youngjun Kim on 7/13/25.
//

import UIKit

final class MagazineTableViewCell: UITableViewCell {
    @IBOutlet var cellView: UIView!
    @IBOutlet var photoImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subtitleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    override func awakeFromNib() {
        setUI()
    }
    
    private func setUI() {
        setCellUI()
        setPhotoImageViewUI()
        setTitleLabellUI()
        setSubtitleLabellUI()
        setDateLabelUI()
    }
    
    private func setCellUI() {
        selectionStyle = .none
    }
    
    private func setTitleLabellUI() {
        titleLabel.numberOfLines = 0
        titleLabel.font = .systemFont(ofSize: 18, weight: .heavy)
    }
    
    private func setSubtitleLabellUI() {
        subtitleLabel.font = .systemFont(ofSize: 13)
        subtitleLabel.textColor =  .lightGray
    }
    
    private func setPhotoImageViewUI() {
        photoImageView.layer.cornerRadius = 10
        photoImageView.clipsToBounds = true

    }
    
    private func setDateLabelUI() {
        dateLabel.textColor = .lightGray
        dateLabel.font = .systemFont(ofSize: 13)
    }
}
