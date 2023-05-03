//
//  LeaguesViewController.swift
//  SportOn
//
//  Created by Marwan Elbahnasawy on 02/05/2023.
//

import UIKit
import Kingfisher

class LeaguesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var league: String?
    
    private var footballLeagues : [FootballLeaguesItem] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Leagues"
        
        NetworkService.fetchResult(league: league ?? "football") { [weak self] res in
            
            guard let res = res, let result = res.result else {return}
            
            self?.footballLeagues = result
            
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
            
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return footballLeagues.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "LeaguesCell") as! LeaguesTableViewCell
        
        let currentLeauge = footballLeagues[indexPath.row]
        
        cell.leagueLabel.text = currentLeauge.league_name
        
        if league == "football"{
            cell.imgView.kf.setImage(with: URL(string: currentLeauge.league_logo ?? ""))
        } else{
            
            
            cell.imgView.isHidden = true
            
            cell.leagueLabel.translatesAutoresizingMaskIntoConstraints = false
            cell.leagueLabel.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor, constant: 30).isActive = true


        }
        
        

        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.height * 0.15
    }
    
    
    


}
