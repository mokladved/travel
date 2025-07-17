//
//  NewPopularViewController.swift
//  Travel
//
//  Created by Youngjun Kim on 7/17/25.
//

import UIKit

class NewPopularViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    private let cityInfo = CityInfo().city

    @IBOutlet var popularCollectionView: UICollectionView!
    @IBOutlet var searchButton: UIButton!
    @IBOutlet var searchTextField: UITextField!
    @IBOutlet var segmentControl: UISegmentedControl!
    @IBOutlet var searchView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        setUI()
    }
    
    func setUI() {
        setSearchButtonUI()
        setSearchViewUI()
        setSearchTextFieldUI()
        setSearchViewUI()
        setSegmentControlUI()
    }
    
    func registerCell() {
        let xib = UINib(nibName: "NewPopularCollectionViewCell", bundle: nil)
        popularCollectionView.register(xib, forCellWithReuseIdentifier: "NewPopularCollectionViewCell")
        popularCollectionView.delegate = self
        popularCollectionView.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = popularCollectionView.dequeueReusableCell(withReuseIdentifier: "NewPopularCollectionViewCell", for: indexPath) as! NewPopularCollectionViewCell
        let cityInfo = cityInfo[indexPath.item]
        cell.configureData(from: cityInfo)
        return cell
    }
    
    private func setSearchButtonUI() {
        searchButton.setTitle("", for: .normal)
        searchButton.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        searchButton.tintColor = .gray
    }
    
    private func setSearchViewUI() {
        searchView.layer.borderWidth = 1
        searchView.layer.cornerRadius = 5
        searchView.clipsToBounds = true
        searchView.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    private func setSearchTextFieldUI() {
        searchTextField.borderStyle = .none
    }
    
    private func setSegmentControlUI() {
        segmentControl.setTitle("모두", forSegmentAt: 0)
        segmentControl.setTitle("국네", forSegmentAt: 1)
        segmentControl.setTitle("해외", forSegmentAt: 2)
        
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 13, weight: .bold),
        ]
        segmentControl.setTitleTextAttributes(attributes, for: .selected)
        
    }
}
