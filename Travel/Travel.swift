//
//  Travel.swift
//  Travel
//
//  Created by Youngjun Kim on 7/14/25.
//

import Foundation

struct Travel {
    let title: String
    let description: String?
    let travelImage: String?
    let grade: Double?
    let save: Int?
    let like: Bool?
    let ad: Bool
    
    init(title: String, description: String?, travel_image: String?, grade: Double?, save: Int?, like: Bool?, ad: Bool) {
        self.title = title
        self.description = description
        self.travelImage = travel_image
        self.grade = grade
        self.save = save
        self.like = like
        self.ad = ad
    }
    
}
