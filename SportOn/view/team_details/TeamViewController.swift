//
//  TeamViewController.swift
//  SportOn
//
//  Created by Marwan Elbahnasawy on 04/05/2023.
//

import UIKit
import CoreData

class TeamViewController: MyBaseViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var teamName: UILabel!
    
    @IBOutlet weak var teamImgView: UIImageView!
    
    @IBOutlet weak var coachNameLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var addToFavOutlet: UIButton!
    
    @IBOutlet weak var starTeam: UIButton!
    
    var team : ResultTeamDetailsItem?
    var sportSelected : String?
    var teamLogoData : Data?
    
    var teamPlayers: [Player]?
    
    let db = DatabaseManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        teamPlayers = team?.players
        
        teamName.text = team?.team_name
                
        teamImgView.kf.setImage(with: URL(string: team?.team_logo ?? "")) { result in
            if case .failure = result {
                if self.sportSelected == "football"{
                    self.teamImgView.image = UIImage(named: "imageplaceholderteamfootball")
                } else if self.sportSelected == "basketball"{
                    self.teamImgView.image = UIImage(named: "imageplaceholderteambasketball")
                } else{
                    self.teamImgView.image = UIImage(named: "imageplaceholdergeneral")
                }
                
            }
        }
        
        if let team = team, let coaches = team.coaches {
            coachNameLabel.text = "Coach: \(coaches[0].coach_name!)"
        } else{
            coachNameLabel.isHidden = true
        }
        
        if let imageData = teamImgView.image?.pngData() {
            teamLogoData = imageData
        } else{
            
            if self.sportSelected == "football"{
                teamLogoData = UIImage(named: "imageplaceholderteamfootball")?.pngData()
            } else if self.sportSelected == "basketball" {
                teamLogoData = UIImage(named: "imageplaceholderteambasketball")?.pngData()
            } else{
                teamLogoData = UIImage(named: "imageplaceholdergeneral")?.pngData()
            }
        }
        
        if UIDevice.current.userInterfaceIdiom == .pad{
            teamName.font = UIFont.systemFont(ofSize: 40)
            coachNameLabel.font = UIFont.systemFont(ofSize: 35)
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if teamPlayers != nil {
            return teamPlayers!.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellTeamPlayers") as! TeamPlayerTableViewCell
        
        let currentPlayer = teamPlayers![indexPath.row]
        
        cell.imgViewPlayer.kf.setImage(with: URL(string: currentPlayer.player_image ?? "")) { result in
            if case .failure = result {
                if self.sportSelected == "football"{
                    cell.imgViewPlayer.image = UIImage(named: "imageplaceholderfootballplayer")
                } else if self.sportSelected == "basketball"{
                    cell.imgViewPlayer.image = UIImage(named: "imageplaceholderbasketballplayer")
                } else{
                    cell.imgViewPlayer.image = UIImage(named: "imageplaceholderplayer")
                }
            }
        }
        
        cell.playerNameLabel.text = currentPlayer.player_name
        
        cell.playerType.text = currentPlayer.player_type
        
        if let _ = currentPlayer.player_number{
            cell.playerNumberLabel.text = "Player No. \(currentPlayer.player_number!)"
            
        } else{
            cell.playerNumberLabel.isHidden = true
            
        }
        
        if let _ = currentPlayer.player_match_played{
            cell.playerMatchesCountLabel.text = "Matches Count: \(currentPlayer.player_match_played!)"
            
        } else{
            cell.playerMatchesCountLabel.isHidden = true
            
        }
         
        if UIDevice.current.userInterfaceIdiom == .pad{
            cell.playerNameLabel.font = UIFont.systemFont(ofSize: 30)
            cell.playerNumberLabel.font = UIFont.systemFont(ofSize: 30)
            cell.playerMatchesCountLabel.font = UIFont.systemFont(ofSize: 30)
            cell.playerType.font = UIFont.systemFont(ofSize: 30)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.height * 0.3
    }
    
    @IBAction func addToFav(_ sender: Any) {
        
        if db.checkIfItemExists(teamOrPlayerKey: 1, key: (team?.team_key)!) {
            let alertController = UIAlertController(title: "Delete Team", message: "Are you sure you want to delete this team?", preferredStyle: .alert)

            let deleteAction = UIAlertAction(title: "Delete", style: .destructive, handler: { _ in
                self.db.delete(teamOrPlayer: 1, teamOrPlayerKey: (self.team?.team_key)!)
                self.starTeam.setImage(UIImage(named: "emptystar"), for: .normal)
            })

            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)

            alertController.addAction(deleteAction)
            alertController.addAction(cancelAction)

            present(alertController, animated: true)
        } else{
            db.insert(item: TeamItemDB(team_name: team?.team_name ?? "", team_logo: teamLogoData, team_logo_string: team?.team_logo ?? "", team_key: team?.team_key, sportSelected: sportSelected))
            
                starTeam.setImage(UIImage(named: "goldenstar"), for: .normal)
        }
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if db.checkIfItemExists(teamOrPlayerKey: 1, key: (team?.team_key)!){
            starTeam.setImage(UIImage(named: "goldenstar"), for: .normal)
        } else{
            starTeam.setImage(UIImage(named: "emptystar"), for: .normal)
        }
    }
    
}
