//
//  FavoritesViewController.swift
//  SportOn
//
//  Created by Marwan Elbahnasawy on 02/05/2023.
//

import UIKit
import CoreData

class FavoritesViewController: MyBaseViewController, UITableViewDelegate, UITableViewDataSource  {
    
    @IBOutlet weak var tableView: UITableView!
    
    var teamObjects : [NSManagedObject]!
    var playerObjects : [NSManagedObject]!
    
    let db = DatabaseManager.shared
    
    var arrayTeams = [TeamItemDB]()
    var arrayPlayers = [PlayerItemDB]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Favorites"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 25)]
        
        if UIDevice.current.userInterfaceIdiom == .pad{
            navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 44)]
        }
        
        let teamsArrayDB = (db.getAllTeams()).map{ $0 as! TeamItemDB}
        let playersArrayDB = (db.getAllPlayers()).map{ $0 as! PlayerItemDB}
        
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
            
            cell.selectionStyle = .none
            
            let currentTeam = arrayTeams[indexPath.row]
            
            cell.teamOrPlayerNameLabel.text = currentTeam.team_name
            
            if let imageData = currentTeam.team_logo {
                let image = UIImage(data: imageData)
                cell.imgView.image = image
            }
            
            if UIDevice.current.userInterfaceIdiom == .pad{
                cell.teamOrPlayerNameLabel.font = UIFont.systemFont(ofSize: 40)
            }
            
            return cell
            
        default:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellFavoritesID") as! FavoritesTableViewCell
            
            cell.selectionStyle = .none
            
            let currentPlayer = arrayPlayers[indexPath.row]
            
            cell.teamOrPlayerNameLabel.text = currentPlayer.player_name
            
            if let imageData = currentPlayer.player_image {
                let image = UIImage(data: imageData)
                cell.imgView.image = image
            }
            
            if UIDevice.current.userInterfaceIdiom == .pad{
                cell.teamOrPlayerNameLabel.font = UIFont.systemFont(ofSize: 40)
            }
            
            return cell
            
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if !MyBaseViewController.isNetworkAvailable{
            let alertController = UIAlertController(title: "Connectivity Issue", message: "Please connect to the internet.", preferredStyle: .alert)
            
            let cancelAction = UIAlertAction(title: "OK", style: .cancel)
            alertController.addAction(cancelAction)

            present(alertController, animated: true)
        } else{
            switch indexPath.section {
            case 0:
                let currentTeam = self.arrayTeams[indexPath.row]
                
                let teamViewController = self.storyboard?.instantiateViewController(withIdentifier: "TeamViewController") as! TeamViewController
                
                teamViewController.sportSelected = currentTeam.sportSelected!
                teamViewController.teamId = String(currentTeam.team_key!)
                
                DispatchQueue.main.async {
                    self.navigationController?.pushViewController(teamViewController, animated: true)
                    
                }
                
            default:
                let currentPlayer = self.arrayPlayers[indexPath.row]
                
                let playerViewController = self.storyboard?.instantiateViewController(withIdentifier: "PlayerViewController") as! PlayerViewController
                
                playerViewController.sportSelected = "tennis"
                playerViewController.playerId = String(currentPlayer.player_key!)
                
                    DispatchQueue.main.async {
                        self.navigationController?.pushViewController(playerViewController, animated: true)
                        
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
                        self.db.deleteTeam(teamKey: currentTeam.team_key!) {
                            self.arrayTeams.removeAll()
                            self.arrayTeams = self.db.getAllTeams().map {$0 as! TeamItemDB}
                            tableView.reloadData()
                            InsertDeleteSnackBar.make(in: self.view, message: "Deleted Successfully.", duration: .custom(1)).show()
                        }
                    })
                    
                default:
                    
                    alertController = UIAlertController(title: "Delete Player", message: "Are you sure you want to delete this player?", preferredStyle: .alert)
                    
                    deleteAction = UIAlertAction(title: "Delete", style: .destructive, handler: { _ in
                    let currentPlayer = self.arrayPlayers[indexPath.row]
                        self.db.deletePlayer(playerKey: currentPlayer.player_key!) {
                            self.arrayPlayers.removeAll()
                            self.arrayPlayers = self.db.getAllPlayers().map {$0 as! PlayerItemDB}
                            tableView.reloadData()
                            InsertDeleteSnackBar.make(in: self.view, message: "Deleted Successfully.", duration: .custom(1)).show()
                        }
                    })
                
            }
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
            
            alertController.addAction(deleteAction)
            alertController.addAction(cancelAction)
            
            present(alertController, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.size.height * 0.2
    }
    
    override func viewWillAppear(_ animated: Bool) {
        arrayTeams.removeAll()
        arrayTeams = db.getAllTeams().map {$0 as! TeamItemDB}
        arrayPlayers.removeAll()
        arrayPlayers = db.getAllPlayers().map {$0 as! PlayerItemDB}
        tableView.reloadData()
    }
    
}
