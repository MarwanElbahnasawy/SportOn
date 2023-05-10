//
//  OnboardingItem.swift
//  SportOn
//
//  Created by Marwan Elbahnasawy on 06/05/2023.
//

import Foundation

struct OnboardingItem {
    let title : String
    let description : String
    let image : OnboardingImage
    
    init(title: String, description: String, image: OnboardingImage) {
        self.title = title
        self.description = description
        self.image = image
    }
}
