//
//  SportsCollectionViewCell.swift
//  SportOn
//
//  Created by Marwan Elbahnasawy on 02/05/2023.
//

import UIKit

class SportsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var oldConstraintTitleTop: NSLayoutConstraint!
    
    func configure(sportItem: SportItem) {
        
        imgView.image = UIImage(named: sportItem.image.rawValue)
        titleLabel.text = sportItem.title
        
        if UIDevice.current.userInterfaceIdiom == .pad{
            
            titleLabel.font = UIFont.systemFont(ofSize: 50)
            
            titleLabel.removeConstraint(oldConstraintTitleTop)
            
            let newTopConstraint = NSLayoutConstraint(
                item: titleLabel,
                attribute: .top,
                relatedBy: .equal,
                toItem: imgView,
                attribute: .bottom,
                multiplier: 0.8,
                constant: 0
            )
            
            contentView.addConstraint(newTopConstraint)
            
        }  
        
    }
    
}


