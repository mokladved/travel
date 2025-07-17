//
//  TravelTableViewController.swift
//  Travel
//
//  Created by Youngjun Kim on 7/14/25.
//

import UIKit
import Kingfisher

final class TravelTableViewController: UITableViewController {
    
    private let travelInfo = TravelInfo().travel
    private var copiedTravelInfo: [Travel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        copiedTravelInfo = travelInfo
        let xib = UINib(nibName: "TravelTableViewCell", bundle: nil)
        tableView.register(xib, forCellReuseIdentifier: "TravelTableViewCell")
        
        
        let adXib = UINib(nibName: "ADTableViewCell", bundle: nil)
        tableView.register(adXib, forCellReuseIdentifier: "ADTableViewCell")
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 200
        
        setNavBarTitle()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return copiedTravelInfo.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let data = copiedTravelInfo[indexPath.row]
        if data.ad {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ADTableViewCell", for: indexPath) as! ADTableViewCell
            cell.setCellUI(from: data)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TravelTableViewCell", for: indexPath) as! TravelTableViewCell
            
            cell.configureData(from: data)
            cell.likeButton.tag = indexPath.row
            cell.likeButton.addTarget(self, action: #selector(likeButtonTapped), for: .touchUpInside)
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = travelInfo[indexPath.row]
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        if data.ad {
            let viewController = storyboard.instantiateViewController(withIdentifier: "ADViewController") as! ADViewController
            viewController.message = data.title
            
            let nav = UINavigationController(rootViewController: viewController)
            nav.modalPresentationStyle = .fullScreen
            present(nav, animated: true)
            
        }  else {
            let viewController =      storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
            
            viewController.spotTitle = data.title
            viewController.desc = data.description
            viewController.imageUrl = data.travelImage
            
            navigationController?.pushViewController(viewController, animated: true)
        }
        
    }
    
    @objc func likeButtonTapped(_ sender: UIButton) {
        let index = sender.tag
        guard let status = copiedTravelInfo[index].like else {
            return
            
        }
        copiedTravelInfo[index].like = !status
        let indexPathToReload = IndexPath(row: index, section: 0)
        tableView.reloadRows(at: [indexPathToReload], with: .fade)
    }
    
    private func setNavBarTitle() {
        navigationItem.title = "도시 상세 정보"
        navigationItem.backButtonTitle = ""
    }
}
