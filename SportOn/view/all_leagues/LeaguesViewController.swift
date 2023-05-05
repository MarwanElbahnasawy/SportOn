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
    
    var sportSelected: String?
    
    private var leagues : [ResultLeaguesItem] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Leagues"
        
        NetworkService.fetchLeagues(sportName: sportSelected!) { [weak self] res in
                        
            guard let res = res, let result = res.result else {return}
            
            self?.leagues = result
            
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
            
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return leagues.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "LeaguesCell") as! LeaguesTableViewCell
        
        let currentLeauge = leagues[indexPath.row]
        
        cell.leagueLabel.text = currentLeauge.league_name
        
        cell.imgView.kf.setImage(with: URL(string: currentLeauge.league_logo ?? ""))
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let leagueDetailsViewController = self.storyboard?.instantiateViewController(withIdentifier: "LeagueDetailsViewController") as! LeagueDetailsViewController
        leagueDetailsViewController.sportSelected = self.sportSelected
        leagueDetailsViewController.leagueIDSelected = leagues[indexPath.row].league_key
        
        navigationController?.pushViewController(leagueDetailsViewController, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.height * 0.15
    }
    
    
    


}
