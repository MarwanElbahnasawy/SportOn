//
//  FavoritesViewController.swift
//  SportOn
//
//  Created by Marwan Elbahnasawy on 02/05/2023.
//

import UIKit
import CoreData

class FavoritesViewController: MyBaseViewController, UITableViewDelegate, UITableViewDataSource, FavoritesViewProtocol  {
    
    @IBOutlet weak var tableView: UITableView!
    
    private lazy var presenter : FavoritesPresenterProtocol = {
        return FavoritesPreesenter(view: self, networkService: NetworkService.self, networkConnectivityObserver: MyBaseViewController.self, db: db)
    }()
    
    let db = DatabaseManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.topItem?.title = "Favorites"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 25)]
        
        if UIDevice.current.userInterfaceIdiom == .pad{
            navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 44)]
        }
        
        tableView.reloadData()
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section{
        case 0:
            return presenter.getTeamsCount()
        default:
            return presenter.getPlayersCount()
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section{
        case 0:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellFavoritesID") as! FavoritesTableViewCell
            
            let currentTeam = presenter.getTeam(at: indexPath.row)
            
            cell.configureTeam(currentTeam: currentTeam)
            
            if let imageData = currentTeam.team_logo {
                let image = UIImage(data: imageData)
                cell.imgView.image = image
            }
            
            
            
            return cell
            
        default:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellFavoritesID") as! FavoritesTableViewCell
            
            let currentPlayer = presenter.getPlayer(at: indexPath.row)
            
            cell.configurePlayer(currentPlayer: currentPlayer)
            
            if let imageData = currentPlayer.player_image {
                let image = UIImage(data: imageData)
                cell.imgView.image = image
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
                let currentTeam = presenter.getTeam(at: indexPath.row)
                
                let teamViewController = self.storyboard?.instantiateViewController(withIdentifier: "TeamViewController") as! TeamDetailsViewController
                
                teamViewController.sportSelected = currentTeam.sportSelected!
                teamViewController.teamId = String(currentTeam.team_key!)
                
                DispatchQueue.main.async {
                    self.navigationController?.pushViewController(teamViewController, animated: true)
                    
                }
                
            default:
                let currentPlayer = presenter.getPlayer(at: indexPath.row)
                
                let playerViewController = self.storyboard?.instantiateViewController(withIdentifier: "PlayerViewController") as! PlayerDetailsViewController
                
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
                    let currentTeam = self.presenter.getTeam(at: indexPath.row)
                    
                    self.presenter.deleteTeam(teamKey: currentTeam.team_key!) {
                        InsertDeleteSnackBar.make(in: self.view, message: "Deleted Successfully.", duration: .custom(1)).show()
                        print("deleteeddededededded")
                    }
                })
                
            default:
                
                alertController = UIAlertController(title: "Delete Player", message: "Are you sure you want to delete this player?", preferredStyle: .alert)
                
                deleteAction = UIAlertAction(title: "Delete", style: .destructive, handler: { _ in
                    let currentPlayer = self.presenter.getPlayer(at: indexPath.row)
                    
                    self.presenter.deletePlayer(playerKey: currentPlayer.player_key!) {
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
        presenter.reloadDataAtViewWillAppear()
    }
    
    func reloadTableView() {
        DispatchQueue.main.async{
            self.tableView.reloadData()
        }
        
    }
    
}
