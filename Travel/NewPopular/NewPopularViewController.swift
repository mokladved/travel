//
//  NewPopularViewController.swift
//  Travel
//
//  Created by Youngjun Kim on 7/17/25.
//

import UIKit

final class NewPopularViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    private let cityInfo = CityInfo().city
    private var filteredCityInfo: [City] = []


    @IBOutlet private var popularCollectionView: UICollectionView!
    @IBOutlet private var searchButton: UIButton!
    @IBOutlet private var searchTextField: UITextField!
    @IBOutlet private var segmentControl: UISegmentedControl!
    @IBOutlet private var searchView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadDefaultData()
        registerCell()
        setUI()
    }
    
    private func setUI() {
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
    
    private func setCollectionViewUI() {
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
    
    private func registerCell() {
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
    
    
    @IBAction private func segmentSelected(_ sender: UISegmentedControl) {
        filterCityInfo()
    }
    
    private func filterCityInfo(isRealTime: Bool = true) {
        let text = validateSearchText(from: searchTextField.text)
        
        if !isRealTime {
            guard text != nil else {
                showAlert(message: "두 글자 이상 입력해주세요.")
                filteredCityInfo = filterBySegment(from: self.cityInfo)
                popularCollectionView.reloadData()
            return
            }
        }
            
        let filteredCities = filterBySegment(from: cityInfo)
        
        if let text = text {
            let searchedCities = filterByTextField(from: filteredCities, with: text)
            filteredCityInfo = searchedCities
        } else {
            filteredCityInfo = filteredCities
        }
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
    
    private func filterByTextField(from cities: [City], with text: String) -> [City] {
        let lowerCasedText = text.lowercased()
        
        return cities.filter { city in
            return city.cityName.lowercased().contains(lowerCasedText) ||
            city.cityEnglishName.lowercased().contains(lowerCasedText) ||
            city.cityExplain.lowercased().contains(lowerCasedText)
        }
    }
    
    private func validateSearchText(from text: String?) -> String? {
        guard let text = text,
              let trimmedText = text.trimmingCharacters(in: .whitespacesAndNewlines) as String?,
              !trimmedText.isEmpty,
              trimmedText.count >= 2 else {
            return nil
        }
        return trimmedText
    }
    
    private func showAlert(message: String) {
        let alert = UIAlertController(
            title: "알림",
            message: message,
            preferredStyle: .alert
        )
    
        let ok = UIAlertAction(title: "확인", style: .default) { _ in
                self.view.endEditing(true)
            }
        alert.addAction(ok)
        
        present(alert, animated: true)
    }
    

    @IBAction private func searchDidEndOnExit(_ sender: UITextField) {
        filterCityInfo(isRealTime: false)
    }
    
    @IBAction private func keyboardDismiss(_ sender: UITapGestureRecognizer) {
    }
    
    
    @IBAction func textFieldEditingChanged(_ sender: UITextField) {
        filterCityInfo()
    }
}
