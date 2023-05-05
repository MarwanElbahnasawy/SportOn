//
//  FavoritesViewController.swift
//  SportOn
//
//  Created by Marwan Elbahnasawy on 02/05/2023.
//

import UIKit
import CoreData

class FavoritesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, DeletedTeamFromDatabaseConfirmation, DeletedPlayerFromDatabaseConfirmation  {
    
    @IBOutlet weak var tableView: UITableView!
    
    var context: NSManagedObjectContext!
    var teamObjects : [NSManagedObject]!
    var playerObjects : [NSManagedObject]!
    
    let db = DatabaseManager.shared
    
    var arrayTeams = [TeamItemDB]()
    var arrayPlayers = [PlayerItemDB]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        context = appDelegate.persistentContainer.viewContext
        
        let teamsArrayDB = (db.getAll(teamsOrPlayers: 1, context: context)).map{ $0 as! TeamItemDB}
        let playersArrayDB = (db.getAll(teamsOrPlayers: 2, context: context)).map{ $0 as! PlayerItemDB}
        
        arrayTeams = teamsArrayDB
        arrayPlayers = playersArrayDB
        
        tableView.reloadData()
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section{
        case 0:
            return arrayTeams.count
        default:
            return arrayPlayers.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section{
        case 0:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellFavoritesID") as! FavoritesTableViewCell
            
            let currentTeam = arrayTeams[indexPath.row]
            
            cell.teamOrPlayerNameLabel.text = currentTeam.team_name
            
            if let imageData = currentTeam.team_logo {
                let image = UIImage(data: imageData)
                cell.imgView.image = image
            }
            
            return cell
            
        default:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellFavoritesID") as! FavoritesTableViewCell
            
            let currentPlayer = arrayPlayers[indexPath.row]
            
            cell.teamOrPlayerNameLabel.text = currentPlayer.player_name
            
            if let imageData = currentPlayer.player_image {
                let image = UIImage(data: imageData)
                cell.imgView.image = image
            }
            
            return cell
            
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.section {
        case 0:
            let currentTeam = self.arrayTeams[indexPath.row]
            
            let teamViewController = self.storyboard?.instantiateViewController(withIdentifier: "TeamViewController") as! TeamViewController
            
            NetworkService.fetchTeam(sportName: currentTeam.sportSelected!, teamId: String(currentTeam.team_key!)) { res in
                guard let res = res, let result = res.result else {return}

                teamViewController.team = result[0]

                DispatchQueue.main.async {
                    self.present(teamViewController, animated: true)

                }
                
            }
        default:
            let currentPlayer = self.arrayPlayers[indexPath.row]
            
            let playerViewController = self.storyboard?.instantiateViewController(withIdentifier: "PlayerViewController") as! PlayerViewController
            
            NetworkService.fetchPlayer(sportName: "tennis", playerId: String(currentPlayer.player_key!)) { res in
                
                    guard let res = res, let result = res.result else {return}
                    
                playerViewController.player = result[0]
                    
                    DispatchQueue.main.async {
                        self.present(playerViewController, animated: true)
                    }
            }
        }
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            var alertController: UIAlertController
            var deleteAction: UIAlertAction
                        
                switch indexPath.section {
                case 0:
                    
                    alertController = UIAlertController(title: "Delete Team", message: "Are you sure you want to delete this team?", preferredStyle: .alert)
                    
                    deleteAction = UIAlertAction(title: "Delete", style: .destructive, handler: { _ in
                        let currentTeam = self.arrayTeams[indexPath.row]
                        self.db.delegateDeletedTeamConfirmation = self
                        self.db.delete(teamOrPlayer: 1, context: self.context, teamOrPlayerKey: currentTeam.team_key!)
                    })
                    
                    
                    
                default:
                    
                    alertController = UIAlertController(title: "Delete Player", message: "Are you sure you want to delete this player?", preferredStyle: .alert)
                    
                    deleteAction = UIAlertAction(title: "Delete", style: .destructive, handler: { _ in
                    let currentPlayer = self.arrayPlayers[indexPath.row]
                    self.db.delegateDeletedPlayerConfirmation = self
                    self.db.delete(teamOrPlayer: 2, context: self.context, teamOrPlayerKey: currentPlayer.player_key!)
                    })
                
            }
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
            
            alertController.addAction(deleteAction)
            alertController.addAction(cancelAction)
            
            present(alertController, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.height * 0.18
    }
    
    
    
    func deletedTeamSuccessfully() {
        arrayTeams.removeAll()
        arrayTeams = db.getAll(teamsOrPlayers: 1, context: context).map {$0 as! TeamItemDB}
        tableView.reloadData()
    }
    
    func deletedPlayerSuccessfully() {
        arrayPlayers.removeAll()
        arrayPlayers = db.getAll(teamsOrPlayers: 2, context: context).map {$0 as! PlayerItemDB}
        tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        arrayTeams.removeAll()
        arrayTeams = db.getAll(teamsOrPlayers: 1, context: context).map {$0 as! TeamItemDB}
        arrayPlayers.removeAll()
        arrayPlayers = db.getAll(teamsOrPlayers: 2, context: context).map {$0 as! PlayerItemDB}
        tableView.reloadData()
    }
    
}
