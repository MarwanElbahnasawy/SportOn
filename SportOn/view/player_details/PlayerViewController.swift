//
//  PlayerViewController.swift
//  SportOn
//
//  Created by Marwan Elbahnasawy on 04/05/2023.
//

import UIKit

class PlayerViewController: UIViewController {
    
    @IBOutlet weak var playerNameLabel: UILabel!
    @IBOutlet weak var playerImgView: UIImageView!
    @IBOutlet weak var playerNumberLabel: UILabel!
    @IBOutlet weak var teamNameLabel: UILabel!
    @IBOutlet weak var playerAgeLabel: UILabel!
    
    var player: ResultPlayerDetailsTennisItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        playerNameLabel.text = player?.player_name
        playerNumberLabel.text = player?.player_number
        playerAgeLabel.text = player?.player_age
        teamNameLabel.text = player?.team_name
        
        playerImgView.kf.setImage(with: URL(string: player?.player_image ?? ""))
    }
    



}
