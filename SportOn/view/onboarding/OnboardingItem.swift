//
//  OnboardingItem.swift
//  SportOn
//
//  Created by Marwan Elbahnasawy on 06/05/2023.
//

import UIKit

struct OnboardingItem {
    let title : String
    let description : String
    let image : UIImage
    
    init(title: String, description: String, image: UIImage) {
        self.title = title
        self.description = description
        self.image = image
    }
}
