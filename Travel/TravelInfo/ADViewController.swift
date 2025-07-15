//
//  ADViewController.swift
//  Travel
//
//  Created by Youngjun Kim on 7/16/25.
//

import UIKit

class ADViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setNavbarUI()
    }
    
    private func setNavbarUI() {
        navigationItem.title = "광고 화면"
        navigationItem.leftBarButtonItem?.image = UIImage(systemName: "xmark")
        navigationItem.leftBarButtonItem?.title = ""
    }

    @IBAction func exitButtonTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
}
