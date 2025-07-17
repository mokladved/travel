//
//  PopularViewController.swift
//  Travel
//
//  Created by Youngjun Kim on 7/16/25.
//

import UIKit

final class PopularViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private let cityInfo = CityInfo().city

    @IBOutlet var popularTableView: UITableView!
    
    @IBOutlet var segmentControl: UISegmentedControl!
    
    @IBOutlet var searchTextField: UITextField!
    @IBOutlet var searchImageButton: UIButton!
    
    @IBOutlet var textFieldView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
        setNavTitle()
        setSegmentControlUI()
        setSearchImageButtonUI()
        setSearchTextFieldUI()
        setTextFieldViewUI()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cityInfo.count
    }
    
    private func setTableView() {
        popularTableView.dataSource = self
        popularTableView.delegate = self
        
        let xib = UINib(nibName: "PopularTableViewCell", bundle: nil)
        popularTableView.register(xib, forCellReuseIdentifier: "PopularTableViewCell")
        popularTableView.rowHeight = UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PopularTableViewCell", for: indexPath) as! PopularTableViewCell
        
        let row = cityInfo[indexPath.row]
        cell.configureData(from: row)
        
        return cell
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
    
    
    private func setNavTitle() {
        navigationItem.title = "인기 도시"
    }
    
    private func setSearchImageButtonUI() {
        searchImageButton.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
    }
    
    private func setSearchTextFieldUI() {
        searchTextField.borderStyle = .none
    }
    
    private func setTextFieldViewUI() {
        textFieldView.layer.borderWidth = 1
        textFieldView.layer.cornerRadius = 5
        textFieldView.clipsToBounds = true
        textFieldView.layer.borderColor = UIColor.lightGray.cgColor
        textFieldView.tintColor = .gray
    }
}
