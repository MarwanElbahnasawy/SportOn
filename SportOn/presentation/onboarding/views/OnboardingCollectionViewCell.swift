//
//  OnboardingCollectionViewCell.swift
//  SportOn
//
//  Created by Marwan Elbahnasawy on 06/05/2023.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var labelTitle: UILabel!
    
    @IBOutlet weak var labelDesc: UILabel!
    
    @IBOutlet weak var imgView: UIImageView!

    @IBOutlet weak var oldConstraintTopTitle: NSLayoutConstraint!
    
    func configure (onboardingItem: OnboardingItem){
        labelTitle.text = onboardingItem.title
        labelDesc.text = onboardingItem.description
        imgView.image = UIImage(named: onboardingItem.image.rawValue)
        
        labelDesc.textAlignment = .center
        labelDesc.baselineAdjustment = .alignCenters
        
        if UIDevice.current.userInterfaceIdiom == .pad{
            
            labelTitle.font = UIFont.systemFont(ofSize: 50)
            labelDesc.font = UIFont.systemFont(ofSize: 32)
            
            labelTitle.removeConstraint(oldConstraintTopTitle)
            
            let newTopConstraint = NSLayoutConstraint(
                item: labelTitle,
                attribute: .top,
                relatedBy: .equal,
                toItem: imgView,
                attribute: .bottom,
                multiplier: 0.95,
                constant: 0
            )
            
            self.contentView.addConstraint(newTopConstraint)
            
        }
    }
}
