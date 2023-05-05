//
//  TeamViewController.swift
//  SportOn
//
//  Created by Marwan Elbahnasawy on 04/05/2023.
//

import UIKit
import CoreData

class TeamViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var teamName: UILabel!
    
    @IBOutlet weak var teamImgView: UIImageView!
    
    @IBOutlet weak var coachNameLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var addToFavOutlet: UIButton!
    
    var team : ResultTeamDetailsItem?
    var sportSelected : String?
    var teamLogoData : Data?
    
    var teamPlayers: [Player]?
    
    let db = DatabaseManager.shared
    var context: NSManagedObjectContext!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        context = appDelegate.persistentContainer.viewContext
        
        teamPlayers = team?.players
        
        teamName.text = team?.team_name
        
        teamImgView.kf.setImage(with: URL(string: team?.team_logo ?? ""))
        
        if let team = team, let coaches = team.coaches {
            coachNameLabel.text = "Coach: \(coaches[0].coach_name!)"
        } else{
            coachNameLabel.isHidden = true
        }
        
        if let imageData = teamImgView.image!.pngData() {
            teamLogoData = imageData
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
        
        cell.imgViewPlayer.kf.setImage(with: URL(string: currentPlayer.player_image ?? ""))
        
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
        
        
        
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.height * 0.3
    }
    
    @IBAction func addToFav(_ sender: Any) {
        db.insert(context: context, item: TeamItemDB(team_name: team?.team_name ?? "", team_logo: teamLogoData, team_logo_string: team?.team_logo, team_key: team?.team_key ?? 0, sportSelected: sportSelected))
    }
    
}
