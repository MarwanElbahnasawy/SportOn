//
//  TeamPlayerTableViewCell.swift
//  SportOn
//
//  Created by Marwan Elbahnasawy on 04/05/2023.
//

import UIKit

class TeamPlayerTableViewCell: UITableViewCell {

    @IBOutlet weak var playerNameLabel: UILabel!
    @IBOutlet weak var playerType: UILabel!
    @IBOutlet weak var playerNumberLabel: UILabel!
    @IBOutlet weak var playerMatchesCountLabel: UILabel!
    @IBOutlet weak var imgViewPlayer: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(currentPlayer: Player, sportSelected: String){
        imgViewPlayer.kf.setImage(with: URL(string: currentPlayer.player_image ?? "")) { result in
            if case .failure = result {
                if sportSelected == "football"{
                    self.imgViewPlayer.image = UIImage(named: "imageplaceholderfootballplayer")
                } else if sportSelected == "basketball"{
                    self.imgViewPlayer.image = UIImage(named: "imageplaceholderbasketballplayer")
                } else{
                    self.imgViewPlayer.image = UIImage(named: "imageplaceholderplayer")
                }
            }
        }
        
        playerNameLabel.text = currentPlayer.player_name
        
        playerType.text = currentPlayer.player_type
        
        if let _ = currentPlayer.player_number{
            playerNumberLabel.text = "Player No. \(currentPlayer.player_number!)"
            
        } else{
            playerNumberLabel.isHidden = true
            
        }
        
        if let _ = currentPlayer.player_match_played{
            playerMatchesCountLabel.text = "Matches Count: \(currentPlayer.player_match_played!)"
            
        } else{
            playerMatchesCountLabel.isHidden = true
            
        }
         
        if UIDevice.current.userInterfaceIdiom == .pad{
            playerNameLabel.font = UIFont.systemFont(ofSize: 30)
            playerNumberLabel.font = UIFont.systemFont(ofSize: 30)
            playerMatchesCountLabel.font = UIFont.systemFont(ofSize: 30)
            playerType.font = UIFont.systemFont(ofSize: 30)
        }
    }

}

