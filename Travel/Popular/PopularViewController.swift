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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
        setNavTitle()
        
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
    
    func setNavTitle() {
        navigationItem.title = "인기 도시"
    }
}
