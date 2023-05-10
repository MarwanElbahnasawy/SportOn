//
//  TeamViewController.swift
//  SportOn
//
//  Created by Marwan Elbahnasawy on 04/05/2023.
//

import UIKit
import CoreData
import Lottie

class TeamDetailsViewController: MyBaseViewController, UITableViewDelegate, UITableViewDataSource, TeamDetailsViewProtocol {
   
    @IBOutlet weak var teamName: UILabel!
    
    @IBOutlet weak var teamImgView: UIImageView!
    
    @IBOutlet weak var coachNameLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var addToFavOutlet: UIButton!
    
    @IBOutlet weak var starTeam: UIButton!
    
    @IBOutlet weak var lottieView: LottieAnimationView!
    
    private lazy var presenter : TeamDetailsPresenterProtocol = {
        return TeamDetailsPresenter(view: self, networkService: NetworkService.self, networkConnectivityObserver: MyBaseViewController.self, sportSelected: sportSelected!, db: db)
    }()
    
    
    var sportSelected : String?
    var teamId: String?
    var teamLogoData : Data?
    
    let db = DatabaseManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        enableLottie()
        
        presenter.fetchData(sportSelected: sportSelected!, teamId: teamId!)
        
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getNumberOfPlayersInTeam()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellTeamPlayers") as! TeamPlayerTableViewCell
        
        let currentPlayer = presenter.getTeamPlayer(at: indexPath.row)
        
        guard let currentPlayer = currentPlayer else {return UITableViewCell()}
        
        cell.configure(currentPlayer: currentPlayer, sportSelected: sportSelected!)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.size.height * 0.26
    }
    
    @IBAction func addToFav(_ sender: Any) {
        
        if presenter.checkIfTeamExists(){
            let alertController = UIAlertController(title: "Delete Team", message: "Are you sure you want to delete this team?", preferredStyle: .alert)

            let deleteAction = UIAlertAction(title: "Delete", style: .destructive, handler: { _ in
                self.presenter.deleteTeam {
                    InsertDeleteSnackBar.make(in: self.view, message: "Deleted Successfully.", duration: .custom(1)).show()
                }
                self.starTeam.setImage(UIImage(named: "emptystar"), for: .normal)
            })

            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)

            alertController.addAction(deleteAction)
            alertController.addAction(cancelAction)

            present(alertController, animated: true)
        } else{
            let team = presenter.getTeam()
            let teamItemDB = TeamItemDB(team_name: team?.team_name ?? "", team_logo: teamLogoData, team_logo_string: team?.team_logo ?? "", team_key: team?.team_key, sportSelected: sportSelected)
            presenter.insertTeam(teamItemDB: teamItemDB) {
                InsertDeleteSnackBar.make(in: self.view, message: "Inserted Successfully.", duration: .custom(1)).show()
            }
                starTeam.setImage(UIImage(named: "goldenstar"), for: .normal)
        }
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if db.checkIfTeamExists(teamKey: Int(teamId!)!){
            starTeam.setImage(UIImage(named: "goldenstar"), for: .normal)
        } else{
            starTeam.setImage(UIImage(named: "emptystar"), for: .normal)
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
    
    func reloadTableView(){
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    
    func updateView(team: TeamDetailsItem?) {
        
        guard let team = team else { return }
        
        DispatchQueue.main.async {
            
            self.teamName.text = team.team_name
                    
            self.teamImgView.kf.setImage(with: URL(string: team.team_logo ?? "")) { result in
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
            
            if let coaches = team.coaches {
                self.coachNameLabel.text = "Coach: \(coaches[0].coach_name!)"
            } else{
                self.coachNameLabel.isHidden = true
            }
            
            if let imageData = self.teamImgView.image?.pngData() {
                self.teamLogoData = imageData
            } else{
                
                if self.sportSelected == "football"{
                    self.teamLogoData = UIImage(named: "imageplaceholderteamfootball")?.pngData()
                } else if self.sportSelected == "basketball" {
                    self.teamLogoData = UIImage(named: "imageplaceholderteambasketball")?.pngData()
                } else{
                    self.teamLogoData = UIImage(named: "imageplaceholdergeneral")?.pngData()
                }
            }
            
            if UIDevice.current.userInterfaceIdiom == .pad{
                self.teamName.font = UIFont.systemFont(ofSize: 60)
                self.coachNameLabel.font = UIFont.systemFont(ofSize: 45)
            }
            
            
        }
    }
}
