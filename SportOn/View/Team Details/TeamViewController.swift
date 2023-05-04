//
//  TeamViewController.swift
//  SportOn
//
//  Created by Marwan Elbahnasawy on 04/05/2023.
//

import UIKit

class TeamViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var team : ResultTeamDetailsItem?
    
    var teamPlayers : [Player]?

    @IBOutlet weak var teamName: UILabel!
    
    @IBOutlet weak var teamImgView: UIImageView!
    
    @IBOutlet weak var coachNameLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        teamPlayers = team?.players
        
        teamName.text = team?.team_name
        
        teamImgView.kf.setImage(with: URL(string: team?.team_logo ?? ""))
        
        coachNameLabel.text = "Coach: \(team?.coaches![0].coach_name)"
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teamPlayers!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellTeamPlayers") as! TeamPlayerTableViewCell
        
        let currentPlayer = teamPlayers![indexPath.row]
        
        cell.imgViewPlayer.kf.setImage(with: URL(string: currentPlayer.player_image ?? ""))
        
        cell.playerNameLabel.text = currentPlayer.player_name
        
        cell.playerType.text = currentPlayer.player_type
        
        cell.playerNumberLabel.text = "Player No. \(currentPlayer.player_number)"
        
        cell.playerMatchesCountLabel.text = "Matches Count: \(currentPlayer.player_match_played)"
        
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.height * 0.3
    }


}
