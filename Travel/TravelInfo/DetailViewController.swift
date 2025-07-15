//
//  DetailViewController.swift
//  Travel
//
//  Created by Youngjun Kim on 7/16/25.
//

import UIKit
import Kingfisher

final class DetailViewController: UIViewController {

    @IBOutlet private var imageWrapperView: UIView!
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var descLabel: UILabel!
    @IBOutlet private var seeMoreButton: UIButton!
    @IBOutlet var imageView: UIImageView!
    
    var spotTitle: String?
    var desc: String?
    var imageUrl: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    private func setUI() {
        setImageView()
        setTitleLabelUI()
        setDesclabelUI()
        setNavbarTitle()
        setSeeMoreButtonUI()
    }
    
    private func setNavbarTitle() {
        navigationItem.title = "관광지 화면"
    }
    
    private func setImageView() {
        imageWrapperView.layer.cornerRadius = 10
        imageWrapperView.clipsToBounds = true
        
        guard let url = imageUrl else {
            return
        }
        let convertedUrl = URL(string: url)
        imageView.kf.setImage(with: convertedUrl)
        
    }
    
    private func setTitleLabelUI() {
        titleLabel.text = spotTitle
        titleLabel.textAlignment = .center
        titleLabel.font = .systemFont(ofSize: 18, weight: .bold)
    }
    
    private func setDesclabelUI() {
        descLabel.text = desc
        descLabel.numberOfLines = 0
        descLabel.font = .systemFont(ofSize: 15, weight: .bold)
        descLabel.textAlignment = .center
    }
    
    
    private func setSeeMoreButtonUI() {
        var configuration = UIButton.Configuration.filled()
        configuration.title = "다른 관광지 보러가기"
        configuration.attributedTitle?.font = .boldSystemFont(ofSize: 15)

        configuration.contentInsets = NSDirectionalEdgeInsets(top: 12, leading: 20, bottom: 12, trailing: 20)
        
        configuration.baseBackgroundColor = .buttonColor
        configuration.baseForegroundColor = .white
        configuration.cornerStyle = .capsule

        seeMoreButton.configuration = configuration
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)

    }
    
}
