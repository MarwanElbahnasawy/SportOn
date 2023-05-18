//
//  LeaguesTableViewCell.swift
//  SportOn
//
//  Created by Marwan Elbahnasawy on 02/05/2023.
//

import UIKit

class LeaguesTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var leagueLabel: UILabel!
    
    @IBOutlet weak var oldConstraintLabelLeft: NSLayoutConstraint!
    
    @IBOutlet weak var oldConstraintViewBottom: NSLayoutConstraint!
    
    @IBOutlet weak var oldConstraintViewTop: NSLayoutConstraint!
    
    @IBOutlet weak var viewInsideCell: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imgView.layer.cornerRadius = imgView.bounds.size.width / 2
        imgView.layer.masksToBounds = true
    }
    
    func configure(currentLeauge: AllLeaguesItem){
        selectionStyle = .none
        
        contentView.layer.cornerRadius = 50
        contentView.layer.masksToBounds = true
        
        leagueLabel.text = currentLeauge.league_name
        
        imgView.kf.setImage(with: URL(string: currentLeauge.league_logo ?? "")) { result in
            if case .failure = result {
                self.imgView.image = UIImage(named: "leagueplaceholder")
            }
        }
        
        if UIDevice.current.userInterfaceIdiom == .pad{
            
            contentView.layer.cornerRadius = 75
            contentView.layer.masksToBounds = true
            
            leagueLabel.font = UIFont.systemFont(ofSize: 35)
            
            oldConstraintLabelLeft.constant = 50
            oldConstraintViewBottom.constant = 20
            oldConstraintViewTop.constant = 20
            
        }
        
        if UIScreen.main.traitCollection.userInterfaceStyle == .dark {
            viewInsideCell.backgroundColor = .darkGray

            } else {
                viewInsideCell.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)

            }
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
            
        super.traitCollectionDidChange(previousTraitCollection)

                if self.traitCollection.userInterfaceStyle == .dark {

                    viewInsideCell.backgroundColor = .darkGray
                } else {

                    viewInsideCell.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
                }
    }
    
}
