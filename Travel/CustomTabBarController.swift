//
//  CustomTabBarController.swift
//  Travel
//
//  Created by Youngjun Kim on 7/14/25.
//

import UIKit

final class CustomTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    private func setUI() {
        let appearance = UITabBarAppearance()
        
        appearance.stackedLayoutAppearance.normal.iconColor = .black
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.black]
        
        tabBar.standardAppearance = appearance
        tabBar.scrollEdgeAppearance = appearance
    }
}
