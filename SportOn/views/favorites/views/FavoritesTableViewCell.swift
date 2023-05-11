//
//  FavoritesTableViewCell.swift
//  SportOn
//
//  Created by Marwan Elbahnasawy on 05/05/2023.
//

import UIKit

class FavoritesTableViewCell: UITableViewCell {

    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var teamOrPlayerNameLabel: UILabel!
    
    @IBOutlet weak var oldConstraintViewBottom: NSLayoutConstraint!
    
    @IBOutlet weak var oldConstraintViewTop: NSLayoutConstraint!
    
    @IBOutlet weak var viewInsideCell: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func configureTeam(currentTeam: TeamItemDB){
        selectionStyle = .none
        
        contentView.layer.cornerRadius = 50
        contentView.layer.masksToBounds = true
        
        teamOrPlayerNameLabel.text = currentTeam.team_name
        
        if UIDevice.current.userInterfaceIdiom == .pad{
            teamOrPlayerNameLabel.font = UIFont.systemFont(ofSize: 40)
            oldConstraintViewBottom.constant = 20
            oldConstraintViewTop.constant = 20
            contentView.layer.cornerRadius = 75
            contentView.layer.masksToBounds = true
        }
        if UIScreen.main.traitCollection.userInterfaceStyle == .dark {
            viewInsideCell.backgroundColor = .darkGray

            } else {
                viewInsideCell.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)

            }
    }
    
    func configurePlayer(currentPlayer: PlayerItemDB){
        selectionStyle = .none
        
        contentView.layer.cornerRadius = 50
        contentView.layer.masksToBounds = true
        
        teamOrPlayerNameLabel.text = currentPlayer.player_name
        
        if UIDevice.current.userInterfaceIdiom == .pad{
            teamOrPlayerNameLabel.font = UIFont.systemFont(ofSize: 40)
            oldConstraintViewBottom.constant = 20
            oldConstraintViewTop.constant = 20
            contentView.layer.cornerRadius = 75
            contentView.layer.masksToBounds = true
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
