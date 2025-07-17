//
//  PopularVCConstant.swift
//  Travel
//
//  Created by Youngjun Kim on 7/18/25.
//

import UIKit

struct NewPopularVCConstant {
    static let spacing: CGFloat = 16
    static let columns: CGFloat = 2
    static func cellWidth() -> CGFloat {
        let deviceWidth = UIScreen.main.bounds.width
        return (deviceWidth - spacing * (columns + 1)) / columns
    }
}
