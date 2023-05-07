//
//  PlayerViewController.swift
//  SportOn
//
//  Created by Marwan Elbahnasawy on 04/05/2023.
//

import UIKit
import CoreData


class PlayerViewController: UIViewController {
    
    @IBOutlet weak var playerNameLabel: UILabel!
    @IBOutlet weak var playerImgView: UIImageView!
    @IBOutlet weak var playerNumberLabel: UILabel!
    @IBOutlet weak var teamNameLabel: UILabel!
    @IBOutlet weak var playerAgeLabel: UILabel!
    
    @IBOutlet weak var starPlayer: UIButton!
    @IBOutlet weak var addToFavOutlet: UIButton!
    
    let db = DatabaseManager.shared
    
    var player: ResultPlayerDetailsTennisItem?
    var playerImageData : Data?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        playerNameLabel.text = player?.player_name
        playerNumberLabel.text = player?.player_number
        playerAgeLabel.text = player?.player_age
        teamNameLabel.text = player?.team_name
                
        playerImgView.kf.setImage(with: URL(string: player?.player_image ?? "")) { result in
            if case .failure = result {
                self.playerImgView.image = UIImage(named: "imageplaceholderplayer")
            }
        }
        
        if let imageData = playerImgView.image!.pngData() {
            playerImageData = imageData
        } else{
            playerImageData = UIImage(named: "imageplaceholdergeneral")?.pngData()
        }
        
        if UIDevice.current.userInterfaceIdiom == .pad{
            playerNameLabel.font = UIFont.systemFont(ofSize: 40)
            playerAgeLabel.font = UIFont.systemFont(ofSize: 35)
            teamNameLabel.font = UIFont.systemFont(ofSize: 35)
            playerNumberLabel.font = UIFont.systemFont(ofSize: 35)
        }
        
    }
    

    @IBAction func addToFav(_ sender: Any) {
        
        if db.checkIfItemExists(teamOrPlayerKey: 2, key: (player?.player_key)!) {
            let alertController = UIAlertController(title: "Delete Player", message: "Are you sure you want to delete this player?", preferredStyle: .alert)
            
            let deleteAction = UIAlertAction(title: "Delete", style: .destructive, handler: { _ in
                self.db.delete(teamOrPlayer: 2, teamOrPlayerKey: (self.player?.player_key)!)
                self.starPlayer.setImage(UIImage(named: "emptystar"), for: .normal)
            })
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
            
            alertController.addAction(deleteAction)
            alertController.addAction(cancelAction)
            
            present(alertController, animated: true)
        } else{
            db.insert(item: PlayerItemDB(player_key: player?.player_key, player_name: player?.team_name, player_image: playerImageData, player_image_string: player?.player_image ?? ""))
            
            starPlayer.setImage(UIImage(named: "goldenstar"), for: .normal)
        }
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if db.checkIfItemExists(teamOrPlayerKey: 2, key: (player?.player_key)!){
            starPlayer.setImage(UIImage(named: "goldenstar"), for: .normal)
        } else{
            starPlayer.setImage(UIImage(named: "emptystar"), for: .normal)
        }
    }
    

}
