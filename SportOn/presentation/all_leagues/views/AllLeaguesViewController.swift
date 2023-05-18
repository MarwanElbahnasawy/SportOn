//
//  LeaguesViewController.swift
//  SportOn
//
//  Created by Marwan Elbahnasawy on 02/05/2023.
//

import UIKit
import Kingfisher
import Lottie

class AllLeaguesViewController: MyBaseViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate, AllLeaguesViewProtocol {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var lottieView: LottieAnimationView!
    
    private lazy var presenter: AllLeaguesPresenterProtocol = {
        return AllLeaguesPresenter(view: self, networkService: NetworkService.self, networkConnectivityObserver: MyBaseViewController.self)
    }()
    
    var sportSelected: String?

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
        
        presenter.fetchLeagues(sportName: sportSelected ?? "football")
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getNumberOfFilteredLeagueItems()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "LeaguesCell") as! LeaguesTableViewCell
        
        let currentLeauge = presenter.getFilteredLeagueItem(at: indexPath.row)
        
        cell.configure(currentLeauge: currentLeauge)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        if !presenter.checkisNetworkAvailable(){
            let alertController = UIAlertController(title: "Connectivity Issue", message: "Please connect to the internet.", preferredStyle: .alert)
            
            let cancelAction = UIAlertAction(title: "OK", style: .cancel)
            alertController.addAction(cancelAction)

            present(alertController, animated: true)
        } else{
            let leagueDetailsViewController = self.storyboard?.instantiateViewController(withIdentifier: "LeagueDetailsViewController") as! LeagueDetailsViewController
            leagueDetailsViewController.sportSelected = self.sportSelected
            leagueDetailsViewController.leagueIDSelected = presenter.getFilteredLeagueItem(at: indexPath.row).league_key
            
            navigationController?.pushViewController(leagueDetailsViewController, animated: true)
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.height * 0.17
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        presenter.handleSearch(searchText: searchText)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = nil
        presenter.handleSearcbBarCancelButtonClicked()
        searchBar.resignFirstResponder()
    }
    
    func enableLottie(){
        DispatchQueue.main.async {
            self.lottieView.backgroundColor = UIColor(named: "myBackgroundColor")
            self.lottieView.isHidden = false
            self.view.bringSubviewToFront(self.lottieView)
            self.lottieView.contentMode = .scaleAspectFit
            self.lottieView.loopMode = .loop
            self.lottieView.animationSpeed = 1
            self.lottieView.play()
        }
    }
    
    func disableLottie(){
        DispatchQueue.main.async {
            self.lottieView.isHidden = true
            self.lottieView.stop()
        }
    }
    
    func addSubview(text: String){
        DispatchQueue.main.async {
            self.view.addSubview(LabelGenerator.generateLabel(text: text, frame: self.lottieView.frame))
        }
    }
    
    func reloadTableView(){
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
}
