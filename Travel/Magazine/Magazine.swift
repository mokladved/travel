//
//  Magazine.swift
//  Travel
//
//  Created by Youngjun Kim on 7/13/25.
//

import Foundation

struct Magazine {
    let title: String
    let subtitle: String
    let photoImage: String
    let date: String
    let link: String
    
    init(title: String, subtitle: String, photo_image: String, date: String, link: String) {
        self.title = title
        self.subtitle = subtitle
        self.photoImage = photo_image
        self.date = date
        self.link = link
    }
}
