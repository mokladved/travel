//
//  NewPopularViewController.swift
//  Travel
//
//  Created by Youngjun Kim on 7/17/25.
//

import UIKit

class NewPopularViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    private let cityInfo = CityInfo().city
    private var filteredCityInfo: [City] = []


    @IBOutlet var popularCollectionView: UICollectionView!
    @IBOutlet var searchButton: UIButton!
    @IBOutlet var searchTextField: UITextField!
    @IBOutlet var segmentControl: UISegmentedControl!
    @IBOutlet var searchView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadDefaultData()
        registerCell()
        setUI()
    }
    
    func setUI() {
        setSearchButtonUI()
        setSearchViewUI()
        setSearchTextFieldUI()
        setSearchViewUI()
        setSegmentControlUI()
        setCollectionViewUI()
    }
    
    private func loadDefaultData() {
        filteredCityInfo = cityInfo
    }
    
    func setCollectionViewUI() {
        let layout = UICollectionViewFlowLayout()
        let cellWidth = NewPopularVCConstant.cellWidth()
        let spacing = NewPopularVCConstant.spacing
        layout.itemSize = CGSize(width: cellWidth, height: cellWidth * 1.4)
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        layout.minimumInteritemSpacing = spacing
        layout.minimumLineSpacing = spacing
        layout.scrollDirection = .vertical
        popularCollectionView.collectionViewLayout = layout
    }
    
    func registerCell() {
        let xib = UINib(nibName: "NewPopularCollectionViewCell", bundle: nil)
        popularCollectionView.register(xib, forCellWithReuseIdentifier: "NewPopularCollectionViewCell")
        popularCollectionView.delegate = self
        popularCollectionView.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filteredCityInfo.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = popularCollectionView.dequeueReusableCell(withReuseIdentifier: "NewPopularCollectionViewCell", for: indexPath) as! NewPopularCollectionViewCell
        let cityInfo = filteredCityInfo[indexPath.item]
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
        segmentControl.setTitle("국내", forSegmentAt: 1)
        segmentControl.setTitle("해외", forSegmentAt: 2)
        
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 13, weight: .bold),
        ]
        segmentControl.setTitleTextAttributes(attributes, for: .selected)
    }
    
    
    @IBAction func segmentSelected(_ sender: UISegmentedControl) {
        filterCityInfo()
    }
    
    private func filterCityInfo() {
        let filteredCities = filterBySegment(from: cityInfo)
        let searchedCities = filterByTextField(from: filteredCities)
        filteredCityInfo = searchedCities
        popularCollectionView.reloadData()
    }
    
    private func filterBySegment(from cities: [City]) -> [City] {
        switch segmentControl.selectedSegmentIndex {
        case 1:
            return cities.filter { $0.domesticTravel }
        case 2:
            return cities.filter { !$0.domesticTravel }
        default:
            return cities
        }
    }
    
    private func filterByTextField(from cities: [City]) -> [City] {
        guard let text = searchTextField.text, !text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            return cities
        }
        let lowerCasedText = text.lowercased()
        
        return cities.filter { city in
            return city.cityName.lowercased().contains(lowerCasedText) ||
            city.cityEnglishName.lowercased().contains(lowerCasedText) ||
            city.cityExplain.lowercased().contains(lowerCasedText)
        }
    }
    

    @IBAction func searchDidEndOnExit(_ sender: UITextField) {
        filterCityInfo()
    }
    
    @IBAction func keyboardDismiss(_ sender: UITapGestureRecognizer) {
    }
    
    
}
