//
//  DetailViewController.swift
//  Travel
//
//  Created by Youngjun Kim on 7/16/25.
//

import UIKit

final class DetailViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavbarTitle()
    }
    
    private func setNavbarTitle() {
        navigationItem.title = "관광지 화면"
    }
    

}
