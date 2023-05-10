//
//  PlayerViewController.swift
//  SportOn
//
//  Created by Marwan Elbahnasawy on 04/05/2023.
//

import UIKit
import CoreData
import Lottie
import Toast_Swift

class PlayerDetailsViewController: MyBaseViewController, PlayerDetailsViewProtocol {
    
    @IBOutlet weak var playerNameLabel: UILabel!
    @IBOutlet weak var playerImgView: UIImageView!
    @IBOutlet weak var playerNumberLabel: UILabel!
    @IBOutlet weak var teamNameLabel: UILabel!
    @IBOutlet weak var playerAgeLabel: UILabel!
    
    @IBOutlet weak var starPlayer: UIButton!
    @IBOutlet weak var addToFavOutlet: UIButton!
    
    @IBOutlet weak var lottieView: LottieAnimationView!
    
    private lazy var presenter : PlayerDetailsPresenterProtocol = {
        return PlayerDetailsPresenter(view: self, networkService: NetworkService.self, networkConnectivityObserver: MyBaseViewController.self, sportSelected: sportSelected!, db: db)
    }()
    
    let db = DatabaseManager.shared
    
    var sportSelected : String?
    var playerId: String?
    
    
    var playerImageData : Data?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        enableLottie()
        
        presenter.fetchData(sportSelected: sportSelected!, playerId: playerId!)

        self.disableLottie()
        
    }
    

    @IBAction func addToFav(_ sender: Any) {
        
        if presenter.checkIfPlayerExists() {
            let alertController = UIAlertController(title: "Delete Player", message: "Are you sure you want to delete this player?", preferredStyle: .alert)
            
            let deleteAction = UIAlertAction(title: "Delete", style: .destructive, handler: { _ in
                
                self.presenter.deletePlayer {
                    InsertDeleteSnackBar.make(in: self.view, message: "Deleted Successfully.", duration: .custom(1)).show()
                }
            
                self.starPlayer.setImage(UIImage(named: "emptystar"), for: .normal)
            })
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
            
            alertController.addAction(deleteAction)
            alertController.addAction(cancelAction)
            
            present(alertController, animated: true)
        } else{
            let player = presenter.getPlayer()
            let playerItemDB = PlayerItemDB(player_key: player?.player_key, player_name: player?.team_name, player_image: playerImageData, player_image_string: player?.player_image ?? "")
            presenter.insertPlayer(playerItemDB: playerItemDB) {
                InsertDeleteSnackBar.make(in: self.view, message: "Inserted Successfully.", duration: .custom(1)).show()
            }
            
            starPlayer.setImage(UIImage(named: "goldenstar"), for: .normal)
        }
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if presenter.checkIfPlayerExists(){
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
        DispatchQueue.main.async {
            self.lottieView.isHidden = true
            self.lottieView.stop()
        }
    }

    func updateView(player: PlayerDetailsItem?) {
        DispatchQueue.main.async {

            self.playerNameLabel.text = player?.player_name
            self.playerNumberLabel.text = player?.player_number
            self.playerAgeLabel.text = player?.player_age
            self.teamNameLabel.text = player?.team_name
                    
            self.playerImgView.kf.setImage(with: URL(string: player?.player_image ?? "")) { result in
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
    
}
