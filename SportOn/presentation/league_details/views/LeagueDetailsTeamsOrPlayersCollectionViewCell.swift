//
//  LeagueDetailsTeamsCollectionViewCell.swift
//  SportOn
//
//  Created by Marwan Elbahnasawy on 03/05/2023.
//

import UIKit

class LeagueDetailsTeamsOrPlayersCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imgViewTeams: UIImageView!
    
    func configureCellTeam(current: AllTeamsItem, sportSelected: String){
        imgViewTeams.kf.setImage(with: URL(string: current.team_logo ?? "")) { result in
            if case .failure = result {
                if sportSelected == "basketball"{
                    self.imgViewTeams.image = UIImage(named: "imageplaceholderteambasketball")
                } else{
                    self.imgViewTeams.image = UIImage(named: "imageplaceholderteamfootball")
                }
                
            }
        }
    }
    
    func configureCellPlayer(current: AllPlayersItem, sportSelected: String){
        imgViewTeams.kf.setImage(with: URL(string: current.player_image ?? "")) { result in
            if case .failure = result {
                self.imgViewTeams.image = UIImage(named: "imageplaceholderplayer")
            }
        }
    }
}
