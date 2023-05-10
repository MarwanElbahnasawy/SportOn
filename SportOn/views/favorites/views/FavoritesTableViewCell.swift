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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func configureTeam(currentTeam: TeamItemDB){
        selectionStyle = .none
        
        teamOrPlayerNameLabel.text = currentTeam.team_name
        
        if UIDevice.current.userInterfaceIdiom == .pad{
            teamOrPlayerNameLabel.font = UIFont.systemFont(ofSize: 40)
        }
    }
    
    func configurePlayer(currentPlayer: PlayerItemDB){
        selectionStyle = .none
        
        teamOrPlayerNameLabel.text = currentPlayer.player_name
        
        if UIDevice.current.userInterfaceIdiom == .pad{
            teamOrPlayerNameLabel.font = UIFont.systemFont(ofSize: 40)
        }
        
    }

}
