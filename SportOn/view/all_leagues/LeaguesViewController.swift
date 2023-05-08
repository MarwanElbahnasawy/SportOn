//
//  LeaguesViewController.swift
//  SportOn
//
//  Created by Marwan Elbahnasawy on 02/05/2023.
//

import UIKit
import Kingfisher
import Lottie

class LeaguesViewController: MyBaseViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var lottieView: LottieAnimationView!
    
    
    var sportSelected: String?
    
    private var leagues : [ResultLeaguesItem] = []
    private var filteredLeagues : [ResultLeaguesItem] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        searchBar.showsCancelButton = true
        
        enableLottie()

        title = "Leagues"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 25)]
        
        if UIDevice.current.userInterfaceIdiom == .pad{
            navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 44)]
        }
        
        NetworkService.fetchLeagues(sportName: sportSelected!) { [weak self] res in
                        
            guard let res = res, let result = res.result else {
                DispatchQueue.main.async {
                    self?.disableLottie()
                    self?.view.addSubview(LabelGenerator.generateLabel(text: "No Leagues Available.", frame: (self?.lottieView.frame)!))
                }
                return
                
            }
            
            self?.leagues = result
            self?.filteredLeagues = result
            
            DispatchQueue.main.async {
                self?.tableView.reloadData()
                self?.disableLottie()
            }
            
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredLeagues.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "LeaguesCell") as! LeaguesTableViewCell
        
        let currentLeauge = filteredLeagues[indexPath.row]
        
        cell.leagueLabel.text = currentLeauge.league_name
        
        cell.imgView.kf.setImage(with: URL(string: currentLeauge.league_logo ?? "")) { result in
            if case .failure = result {
                cell.imgView.image = UIImage(named: "imageplaceholdergeneral")
            }
        }
        
        if UIDevice.current.userInterfaceIdiom == .pad{
        
            cell.leagueLabel.font = UIFont.systemFont(ofSize: 35)
            
            cell.oldConstraintLabelLeft.constant = 50
            
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if !MyBaseViewController.isNetworkAvailable{
            let alertController = UIAlertController(title: "Connectivity Issue", message: "Please connect to the internet.", preferredStyle: .alert)
            
            let cancelAction = UIAlertAction(title: "OK", style: .cancel)
            alertController.addAction(cancelAction)

            present(alertController, animated: true)
        } else{
            let leagueDetailsViewController = self.storyboard?.instantiateViewController(withIdentifier: "LeagueDetailsViewController") as! LeagueDetailsViewController
            leagueDetailsViewController.sportSelected = self.sportSelected
            leagueDetailsViewController.leagueIDSelected = filteredLeagues[indexPath.row].league_key
            
            navigationController?.pushViewController(leagueDetailsViewController, animated: true)
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.height * 0.15
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            filteredLeagues = leagues
            
        } else{
            filteredLeagues = leagues.filter {
                if let currentLeagueName = $0.league_name {
                    return currentLeagueName.lowercased().contains(searchText.lowercased())
                } else{
                    return false
                }
            }
            
        }
        tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = nil
        filteredLeagues = leagues
        tableView.reloadData()
        searchBar.resignFirstResponder()
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
