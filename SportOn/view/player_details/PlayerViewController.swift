//
//  PlayerViewController.swift
//  SportOn
//
//  Created by Marwan Elbahnasawy on 04/05/2023.
//

import UIKit
import CoreData
import Lottie

class PlayerViewController: MyBaseViewController {
    
    @IBOutlet weak var playerNameLabel: UILabel!
    @IBOutlet weak var playerImgView: UIImageView!
    @IBOutlet weak var playerNumberLabel: UILabel!
    @IBOutlet weak var teamNameLabel: UILabel!
    @IBOutlet weak var playerAgeLabel: UILabel!
    
    @IBOutlet weak var starPlayer: UIButton!
    @IBOutlet weak var addToFavOutlet: UIButton!
    
    @IBOutlet weak var lottieView: LottieAnimationView!
    
    let db = DatabaseManager.shared
    
    var sportSelected : String?
    var playerId: String?
    
    var player: ResultPlayerDetailsTennisItem?
    var playerImageData : Data?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        enableLottie()
        
        NetworkService.fetchPlayer(sportName: sportSelected!, playerId: playerId!) { res in
            
            guard let res = res, let result = res.result else {return}
            
            self.player = result[0]
            
            DispatchQueue.main.async {

                self.playerNameLabel.text = self.player?.player_name
                self.playerNumberLabel.text = self.player?.player_number
                self.playerAgeLabel.text = self.player?.player_age
                self.teamNameLabel.text = self.player?.team_name
                        
                self.playerImgView.kf.setImage(with: URL(string: self.player?.player_image ?? "")) { result in
                    if case .failure = result {
                        self.playerImgView.image = UIImage(named: "imageplaceholderplayer")
                    }
                }
                
                if let imageData = self.playerImgView.image!.pngData() {
                    self.playerImageData = imageData
                } else{
                    self.playerImageData = UIImage(named: "imageplaceholdergeneral")?.pngData()
                }
                
                if UIDevice.current.userInterfaceIdiom == .pad{
                    self.playerNameLabel.font = UIFont.systemFont(ofSize: 40)
                    self.playerAgeLabel.font = UIFont.systemFont(ofSize: 35)
                    self.teamNameLabel.font = UIFont.systemFont(ofSize: 35)
                    self.playerNumberLabel.font = UIFont.systemFont(ofSize: 35)
                }
                
            }
        }

        self.disableLottie()
        
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
    
    func enableLottie(){
        lottieView.isHidden = false
        self.view.bringSubviewToFront(lottieView)
        lottieView.contentMode = .scaleAspectFit
        lottieView.loopMode = .loop
        lottieView.animationSpeed = 1
        lottieView.play()
    }
    
    func disableLottie(){
        lottieView.isHidden = true
        lottieView.stop()
    }
    
}
