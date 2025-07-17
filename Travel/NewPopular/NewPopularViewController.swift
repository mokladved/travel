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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
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
    
    
    
}
