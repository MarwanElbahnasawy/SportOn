//
//  SportItem.swift
//  SportOn
//
//  Created by Marwan Elbahnasawy on 02/05/2023.
//

import Foundation

struct SportItem{
    let title: String
    let image: SportImage
    
    init(title: String, image: SportImage) {
        self.title = title
        self.image = image
    }
}
