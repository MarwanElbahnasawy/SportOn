//
//  LeagueDetailsUpcomingCollectionViewCell.swift
//  SportOn
//
//  Created by Marwan Elbahnasawy on 03/05/2023.
//

import UIKit

class LeagueDetailsUpcomingCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imgViewHome: UIImageView!
    @IBOutlet weak var imgViewAway: UIImageView!
    @IBOutlet weak var homeLabel: UILabel!
    @IBOutlet weak var awayLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    func configureCellUpcoming(current: UpcomingMatchesForFootballBasketballCricketItem, sportSelected: String){
        
        homeLabel.text = current.event_home_team
        awayLabel.text = current.event_away_team
        dateLabel.text = current.event_date
        timeLabel.text = current.event_time
        
        imgViewHome.kf.setImage(with: URL(string: current.home_team_logo ?? "")) { result in
            if case .failure = result {
                if sportSelected == "football"{
                    self.imgViewHome.image = UIImage(named: "imageplaceholderteamfootball")
                } else if sportSelected == "basketball" {
                    self.imgViewHome.image = UIImage(named: "imageplaceholderteambasketball")
                } else{
                    self.imgViewHome.image = UIImage(named: "imageplaceholderteam")
                }
                
            }
        }
        
        
        imgViewAway.kf.setImage(with: URL(string: current.away_team_logo ?? "")) { result in
            if case .failure = result {
                if sportSelected == "football"{
                    self.imgViewAway.image = UIImage(named: "imageplaceholderteamfootball")
                } else if sportSelected == "basketball" {
                    self.imgViewAway.image = UIImage(named: "imageplaceholderteambasketball")
                } else{
                    self.imgViewAway.image = UIImage(named: "imageplaceholderteam")
                }
                
            }
        }
        
        if UIDevice.current.userInterfaceIdiom == .pad{
            homeLabel.font = UIFont.systemFont(ofSize: 30)
            awayLabel.font = UIFont.systemFont(ofSize: 30)
            dateLabel.font = UIFont.systemFont(ofSize: 30)
            timeLabel.font = UIFont.systemFont(ofSize: 30)
        }
    }
    
    func configureCellUpcomingTennis(current: UpcomingMatchesForTennisItem, sportSelected: String){
        
        homeLabel.text = current.event_first_player
        awayLabel.text = current.event_second_player
        dateLabel.text = current.event_date
        timeLabel.text = current.event_time
        
        imgViewHome.kf.setImage(with: URL(string: current.event_first_player_logo ?? "")) { result in
            if case .failure = result {
                self.imgViewHome.image = UIImage(named: "imageplaceholderplayer")
            }
        }
        
        imgViewAway.kf.setImage(with: URL(string: current.event_second_player_logo ?? "")) { result in
            if case .failure = result {
                self.imgViewAway.image = UIImage(named: "imageplaceholderplayer")
            }
        }
        
        if UIDevice.current.userInterfaceIdiom == .pad{
            homeLabel.font = UIFont.systemFont(ofSize: 30)
            awayLabel.font = UIFont.systemFont(ofSize: 30)
            dateLabel.font = UIFont.systemFont(ofSize: 30)
            timeLabel.font = UIFont.systemFont(ofSize: 30)
        }
    }
    
    
}
