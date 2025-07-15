//
//  ADViewController.swift
//  Travel
//
//  Created by Youngjun Kim on 7/16/25.
//

import UIKit

final class ADViewController: UIViewController {

    var message: String?
    
    @IBOutlet private var messageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavbarUI()
        setMessageUI()
    }
    
    private func setNavbarUI() {
        navigationItem.title = "광고 화면"
        navigationItem.leftBarButtonItem?.image = UIImage(systemName: "xmark")
        navigationItem.leftBarButtonItem?.title = ""
    }
    
    private func setMessageUI() {
        messageLabel.text = message
        messageLabel.textAlignment = .center
        messageLabel.numberOfLines = 0
        messageLabel.font = .systemFont(ofSize: 18, weight: .bold)
    }
    

    @IBAction func exitButtonTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
}
