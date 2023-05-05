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
    
    @IBOutlet weak var addToFavOutlet: UIButton!
    
    let db = DatabaseManager.shared
    var context: NSManagedObjectContext!
    
    var player: ResultPlayerDetailsTennisItem?
    var playerImageData : Data?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        context = appDelegate.persistentContainer.viewContext
        
        playerNameLabel.text = player?.player_name
        playerNumberLabel.text = player?.player_number
        playerAgeLabel.text = player?.player_age
        teamNameLabel.text = player?.team_name
        
        playerImgView.kf.setImage(with: URL(string: player?.player_image ?? ""))
        
        if let imageData = playerImgView.image!.pngData() {
            playerImageData = imageData
        }
    }
    

    @IBAction func addToFav(_ sender: Any) {
        db.insert(context: context, item: PlayerItemDB(player_key: player?.player_key, player_name: player?.team_name, player_image: playerImageData))
    }
    

}
