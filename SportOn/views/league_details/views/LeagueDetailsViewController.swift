//
//  LeagueDetailsViewController.swift
//  SportOn
//
//  Created by Marwan Elbahnasawy on 03/05/2023.
//

import UIKit
import Kingfisher
import CoreData
import Lottie

class LeagueDetailsViewController: MyBaseViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, LeagueDetailsViewProtocol {
    
    private lazy var presenter: LeagueDetailsPresenterProtocol = {
        return LeagueDetailsPresenter(view: self, networkService: NetworkService.self, networkConnectivityObserver: MyBaseViewController.self, sportSelected: sportSelected!)
    }()
  
    @IBOutlet weak var collectionViewUpcoming: UICollectionView!
    @IBOutlet weak var collectionViewLatestResults: UICollectionView!
    @IBOutlet weak var collectionViewTeamsOrPlayers: UICollectionView!
    
    @IBOutlet weak var upcomingEventsLabel: UILabel!
    @IBOutlet weak var latestResultsLabel: UILabel!
    @IBOutlet weak var labelTeamsOrPlayers: UILabel!
    
    @IBOutlet weak var lottieViewUpcoming: LottieAnimationView!
    @IBOutlet weak var lottieViewLatest: LottieAnimationView!
    @IBOutlet weak var lottieViewTeamsPlayers: LottieAnimationView!
    
    var sportSelected: String?
    var leagueIDSelected: Int?
    
    let cellUpcomingId = "cellUpcomingId"
    let cellLatestResultsId = "cellLatestResultsId"
    let cellTeamsId = "cellTeamsId"
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "League Details"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20)]
        
        if UIDevice.current.userInterfaceIdiom == .pad{
            navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 44)]
        }
   
        enableLottie(lottieViewNumber: 1)
        enableLottie(lottieViewNumber: 2)
        enableLottie(lottieViewNumber: 3)
        
        presenter.fetchData(sportSelected: sportSelected!, leagueIDSelected: String(leagueIDSelected!))
        
        if UIDevice.current.userInterfaceIdiom == .pad{
            upcomingEventsLabel.font = UIFont.systemFont(ofSize: 40)
            latestResultsLabel.font = UIFont.systemFont(ofSize: 40)
            labelTeamsOrPlayers.font = UIFont.systemFont(ofSize: 40)
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        // if sportSelected = football/basketball/cricket
        if sportSelected != "tennis"{
            if collectionView == self.collectionViewUpcoming {
                return presenter.getNumberOfUpcomingMatchesForFootballBasketballCricketItem()
            } else if collectionView == self.collectionViewLatestResults {
                return presenter.getNumberOfLiveMatchesForFootballBasketballCricketItem()
            } else if collectionView == self.collectionViewTeamsOrPlayers {
                return presenter.getNumberOfAllTeamsItem()
            }
            // if sportSelected = tennis
        } else{
            if collectionView == self.collectionViewUpcoming {
                return presenter.getNumberOfUpcomingMatchesForTennisItem()
            } else if collectionView == self.collectionViewLatestResults {
                return presenter.getNumberOfLiveMatchesForTennisItem()
            } else if collectionView == self.collectionViewTeamsOrPlayers {
                return presenter.getNumberOfAllPlayersItem()
            }
        }
        
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // if sportSelected = football/basketball/cricket
        if sportSelected != "tennis"{
            if collectionView == self.collectionViewUpcoming {
                
                let cell = collectionViewUpcoming.dequeueReusableCell(withReuseIdentifier: cellUpcomingId, for: indexPath) as! LeagueDetailsUpcomingCollectionViewCell

                let current = presenter.getUpcomingMatchesForFootballBasketballCricketItem(at: indexPath.row)
                
                cell.configureCellUpcoming(current: current, sportSelected: sportSelected!)
                                
                return cell
                
            } else if collectionView == self.collectionViewLatestResults {
                
                let cell = collectionViewLatestResults.dequeueReusableCell(withReuseIdentifier: cellLatestResultsId, for: indexPath) as! LeagueDetailsLatestResultsCollectionViewCell
                
                let current = presenter.getLiveMatchesForFootballBasketballCricketItem(at: indexPath.row)
                
                cell.configureCellLiveResults(current: current, sportSelected: sportSelected!)
                
                return cell
                
            } else if collectionView == self.collectionViewTeamsOrPlayers {
                
                let cell = collectionViewTeamsOrPlayers.dequeueReusableCell(withReuseIdentifier: cellTeamsId, for: indexPath) as! LeagueDetailsTeamsOrPlayersCollectionViewCell
                
                let current = presenter.getAllTeamsItem(at: indexPath.row)
                
                cell.configureCellTeam(current: current, sportSelected: sportSelected!)
                
                return cell
                
            }
            // if sportSelected = tennis
        } else {
            if collectionView == self.collectionViewUpcoming {
                
                let cell = collectionViewUpcoming.dequeueReusableCell(withReuseIdentifier: cellUpcomingId, for: indexPath) as! LeagueDetailsUpcomingCollectionViewCell
                
                let current = presenter.getUpcomingMatchesForTennisItem(at: indexPath.row)
                
                cell.configureCellUpcomingTennis(current: current, sportSelected: sportSelected!)
                
                return cell
                
            } else if collectionView == self.collectionViewLatestResults {
                
                let cell = collectionViewLatestResults.dequeueReusableCell(withReuseIdentifier: cellLatestResultsId, for: indexPath) as! LeagueDetailsLatestResultsCollectionViewCell
                
                let current = presenter.getLiveMatchesForTennisItem(at: indexPath.row)
                
                cell.configureCellLiveResultsTennis(current: current, sportSelected: sportSelected!)
                
                return cell
                
            } else if collectionView == self.collectionViewTeamsOrPlayers {
                
                let cell = collectionViewTeamsOrPlayers.dequeueReusableCell(withReuseIdentifier: cellTeamsId, for: indexPath) as! LeagueDetailsTeamsOrPlayersCollectionViewCell
                
                let current = presenter.getAllPlayersItem(at: indexPath.row)
                
                cell.configureCellPlayer(current: current, sportSelected: sportSelected!)
                
                return cell
                
            }
        }
        
        
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.collectionViewUpcoming || collectionView == self.collectionViewLatestResults {
            return collectionView.bounds.size
        } else{
            let width = collectionView.bounds.size.width * 0.4
            let height = collectionView.bounds.size.height
            return CGSize(width: width, height: height)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView == self.collectionViewTeamsOrPlayers {
            
            if !presenter.checkisNetworkAvailable(){
                let alertController = UIAlertController(title: "Connectivity Issue", message: "Please connect to the internet.", preferredStyle: .alert)
                
                let cancelAction = UIAlertAction(title: "OK", style: .cancel)
                alertController.addAction(cancelAction)
                
                present(alertController, animated: true)
            } else{
                // if sportSelected = football/basketball/cricket
                if sportSelected != "tennis"{
                    
                    let teamViewController = self.storyboard?.instantiateViewController(withIdentifier: "TeamViewController") as! TeamDetailsViewController
                    
                    teamViewController.sportSelected = self.sportSelected
                    teamViewController.teamId = String(presenter.getAllTeamsItem(at: indexPath.row).team_key!)
                    
                    DispatchQueue.main.async {
                        self.navigationController?.pushViewController(teamViewController, animated: true)
                        
                    }
                    
                    // if sportSelected = tennis
                } else{
                    
                    let playerViewController = self.storyboard?.instantiateViewController(withIdentifier: "PlayerViewController") as! PlayerDetailsViewController
                    
                    playerViewController.sportSelected = self.sportSelected
                    playerViewController.playerId = String(presenter.getAllPlayersItem(at: indexPath.row).player_key!)
                    
                        DispatchQueue.main.async {
                            self.navigationController?.pushViewController(playerViewController, animated: true)
                            
                        }
                    
                }
            }
            
            
        }
        
    }
    
    func enableLottie(lottieViewNumber: Int) {
        
        var lottieView : LottieAnimationView
        
        switch lottieViewNumber{
        case 1:
            lottieView = lottieViewUpcoming
        case 2:
            lottieView = lottieViewLatest
        case 3:
            lottieView = lottieViewTeamsPlayers
        default:
            return
        }
        DispatchQueue.main.async {
            lottieView.isHidden = false
            self.view.bringSubviewToFront(lottieView)
            lottieView.contentMode = .scaleAspectFit
            lottieView.loopMode = .loop
            lottieView.animationSpeed = 1
            lottieView.play()
        }
    }
    
    func disableLottie(lottieViewNumber: Int) {
        var lottieView : LottieAnimationView
        
        switch lottieViewNumber{
        case 1:
            lottieView = lottieViewUpcoming
        case 2:
            lottieView = lottieViewLatest
        case 3:
            lottieView = lottieViewTeamsPlayers
        default:
            return
        }
        DispatchQueue.main.async {
            lottieView.isHidden = true
            lottieView.stop()
        }
    }
    
    func reloadCollectionView(collectionViewNumber: Int) {
        DispatchQueue.main.async {
            if collectionViewNumber == 1{
                self.collectionViewUpcoming.reloadData()
            } else if collectionViewNumber == 2{
                self.collectionViewLatestResults.reloadData()
            } else if collectionViewNumber == 3{
                self.collectionViewTeamsOrPlayers.reloadData()
            }
        }
    }
    
    func addSubview(text: String, lottieViewNumber: Int) {
        var lottieView : LottieAnimationView
        
        switch lottieViewNumber{
        case 1:
            lottieView = lottieViewUpcoming
        case 2:
            lottieView = lottieViewLatest
        case 3:
            lottieView = lottieViewTeamsPlayers
        default:
            return
        }
        DispatchQueue.main.async {
            self.view.addSubview(LabelGenerator.generateLabel(text: text, frame: lottieView.frame))
        }
    }
    
    func changeLabelTeamsOrPlayersTextToPlayers(){
        DispatchQueue.main.async {
            self.labelTeamsOrPlayers.text = "Players"
        }
    }
    
}
