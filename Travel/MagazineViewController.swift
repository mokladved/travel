//
//  MagazineViewController.swift
//  Travel
//
//  Created by Youngjun Kim on 7/12/25.
//

import UIKit

final class MagazineViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    private func setUI() {
        setTitle()
    }
    
    private func setTitle() {
        navigationItem.title = "SESAC TRAVEL"
    }
    
}
