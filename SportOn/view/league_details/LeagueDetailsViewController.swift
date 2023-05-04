//
//  LeagueDetailsViewController.swift
//  SportOn
//
//  Created by Marwan Elbahnasawy on 03/05/2023.
//

import UIKit
import Kingfisher
import CoreData

class LeagueDetailsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  
    @IBOutlet weak var collectionViewUpcoming: UICollectionView!
    @IBOutlet weak var collectionViewLatestResults: UICollectionView!
    @IBOutlet weak var collectionViewTeamsOrPlayers: UICollectionView!
    
    @IBOutlet weak var upcomingEventsLabel: UILabel!
    @IBOutlet weak var addToFavOutlet: UIButton!
    
    
    var sportSelected: String?
    var leagueIDSelected: Int?
    
    let cellUpcomingId = "cellUpcomingId"
    let cellLatestResultsId = "cellLatestResultsId"
    let cellTeamsId = "cellTeamsId"
    
    private var leagueDetailsUpcoming : [ResultLeagueDetailsUpcomingItem] = []
    private var leagueDetailsLatestResults : [ResultLeagueDetailsLatestItem] = []
    private var leagueDetailsTeams : [ResultLeagueTeamsItem] = []
    
    private var leagueDetailsUpcomingTennis : [ResultLeagueDetailsUpcomingTennisItem] = []
    private var leagueDetailsLatestResultsTennis : [ResultLeagueDetailsLatestTennisItem] = []
    private var leagueDetailsPlayers : [ResultLeaguePlayersTennisItem] = []
    
    var context: NSManagedObjectContext!
    let db = DatabaseManager.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        context = appDelegate.persistentContainer.viewContext

        if sportSelected != "tennis"{
            
            NetworkService.fetchResultUpcoming(sportName: sportSelected!, leagueID: String(leagueIDSelected!)) { [weak self] res in
                guard let res = res, let result = res.result else {return}
                
                self?.leagueDetailsUpcoming = result
                
                DispatchQueue.main.async {
                    self?.collectionViewUpcoming.reloadData()
                }
            }
            
            NetworkService.fetchResultLatest(sportName: sportSelected!, leagueId: String(leagueIDSelected!)) { [weak self] res in
                guard let res = res, let result = res.result else {return}
                
                self?.leagueDetailsLatestResults = result
                            
                DispatchQueue.main.async {
                    self?.collectionViewLatestResults.reloadData()
                }
            }
            
            NetworkService.fetchTeams(sportName: sportSelected!, leagueId: String(leagueIDSelected!)) { [weak self] res in
                guard let res = res, let result = res.result else {return}
                            
                self?.leagueDetailsTeams = result
                
                DispatchQueue.main.async {
                    self?.collectionViewTeamsOrPlayers.reloadData()
                }
            }
        } else if sportSelected == "tennis"{
            
            NetworkService.fetchResultUpcomingTennis(sportName: sportSelected!, leagueID: String(leagueIDSelected!)) { [weak self] res in
                guard let res = res, let result = res.result else {return}

                self?.leagueDetailsUpcomingTennis = result

                DispatchQueue.main.async {
                    self?.collectionViewUpcoming.reloadData()
                }
            }
            
            NetworkService.fetchResultLatestTennis(sportName: sportSelected!, leagueId: String(leagueIDSelected!)) { [weak self] res in
                guard let res = res, let result = res.result else {return}

                self?.leagueDetailsLatestResultsTennis = result

                DispatchQueue.main.async {
                    self?.collectionViewLatestResults.reloadData()
                }
            }
            
            NetworkService.fetchPlayers(sportName: sportSelected!, leagueId: String(leagueIDSelected!)) { [weak self] res in
                guard let res = res, let result = res.result else {return}
                            
                self?.leagueDetailsPlayers = result
                
                DispatchQueue.main.async {
                    self?.collectionViewTeamsOrPlayers.reloadData()
                }
            }
        }
        
        

    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if sportSelected != "tennis"{
            if collectionView == self.collectionViewUpcoming {
                return leagueDetailsUpcoming.count
            } else if collectionView == self.collectionViewLatestResults {
                return leagueDetailsLatestResults.count
            } else if collectionView == self.collectionViewTeamsOrPlayers {
                return leagueDetailsTeams.count
            }
        } else{
            if collectionView == self.collectionViewUpcoming {
                return leagueDetailsUpcomingTennis.count
            } else if collectionView == self.collectionViewLatestResults {
                return leagueDetailsLatestResultsTennis.count
            } else if collectionView == self.collectionViewTeamsOrPlayers {
                return leagueDetailsPlayers.count
            }
        }
        
        
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if sportSelected != "tennis"{
            if collectionView == self.collectionViewUpcoming {
                
                let cell = collectionViewUpcoming.dequeueReusableCell(withReuseIdentifier: cellUpcomingId, for: indexPath) as! LeagueDetailsUpcomingCollectionViewCell
                let current = leagueDetailsUpcoming[indexPath.row]
                
                cell.homeLabel.text = current.event_home_team
                cell.awayLabel.text = current.event_away_team
                cell.dateLabel.text = current.event_date
                cell.timeLabel.text = current.event_time
                
                cell.imgViewHome.kf.setImage(with: URL(string: current.home_team_logo ?? ""))
                
                cell.imgViewAway.kf.setImage(with: URL(string: current.away_team_logo ?? ""))

                return cell
                
                } else if collectionView == self.collectionViewLatestResults {
                    
                        let cell = collectionViewLatestResults.dequeueReusableCell(withReuseIdentifier: cellLatestResultsId, for: indexPath) as! LeagueDetailsLatestResultsCollectionViewCell
                        let current = leagueDetailsLatestResults[indexPath.row]
                        
                        
                        cell.homeLabel.text = current.event_home_team
                        cell.awayLabel.text = current.event_away_team
                        cell.dateLabel.text = current.event_date
                        cell.timeLabel.text = current.event_time
                        cell.scoreLabel.text = current.event_final_result
                        
                        cell.imgViewHome.kf.setImage(with: URL(string: current.home_team_logo ?? ""))
                        
                        cell.imgViewAway.kf.setImage(with: URL(string: current.away_team_logo ?? ""))
                        
                        return cell
                    
                } else if collectionView == self.collectionViewTeamsOrPlayers {
                    
                        let cell = collectionViewTeamsOrPlayers.dequeueReusableCell(withReuseIdentifier: cellTeamsId, for: indexPath) as! LeagueDetailsTeamsOrPlayersCollectionViewCell
                        let current = leagueDetailsTeams[indexPath.row]
                        
                        cell.imgViewTeams.kf.setImage(with: URL(string: current.team_logo ?? ""))
                        
                        return cell
                    
                }
        } else {
            if collectionView == self.collectionViewUpcoming {
                
                let cell = collectionViewUpcoming.dequeueReusableCell(withReuseIdentifier: cellUpcomingId, for: indexPath) as! LeagueDetailsUpcomingCollectionViewCell
                let current = leagueDetailsUpcomingTennis[indexPath.row]
                
                cell.homeLabel.text = current.event_first_player
                cell.awayLabel.text = current.event_second_player
                cell.dateLabel.text = current.event_date
                cell.timeLabel.text = current.event_time
                
                cell.imgViewHome.kf.setImage(with: URL(string: current.event_first_player_logo ?? ""))
                
                cell.imgViewAway.kf.setImage(with: URL(string: current.event_second_player_logo ?? ""))

                return cell
                
                } else if collectionView == self.collectionViewLatestResults {
                    
                        let cell = collectionViewLatestResults.dequeueReusableCell(withReuseIdentifier: cellLatestResultsId, for: indexPath) as! LeagueDetailsLatestResultsCollectionViewCell
                        let current = leagueDetailsLatestResultsTennis[indexPath.row]
                        
                        
                        cell.homeLabel.text = current.event_first_player
                        cell.awayLabel.text = current.event_second_player
                        cell.dateLabel.text = current.event_date
                        cell.timeLabel.text = current.event_time
                        cell.scoreLabel.text = current.event_final_result
                        
                        cell.imgViewHome.kf.setImage(with: URL(string: current.event_first_player_logo ?? ""))
                        
                        cell.imgViewAway.kf.setImage(with: URL(string: current.event_second_player_logo ?? ""))
                        
                        return cell
                    
                } else if collectionView == self.collectionViewTeamsOrPlayers {
                    
                        let cell = collectionViewTeamsOrPlayers.dequeueReusableCell(withReuseIdentifier: cellTeamsId, for: indexPath) as! LeagueDetailsTeamsOrPlayersCollectionViewCell
                        let current = leagueDetailsPlayers[indexPath.row]
                        
                    cell.imgViewTeams.kf.setImage(with: URL(string: current.player_image ?? ""))
                        
                        return cell
                    
                }
        }
        
        
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.collectionViewUpcoming {
            return collectionView.bounds.size
        } else if collectionView == self.collectionViewLatestResults{
            let width = collectionView.bounds.size.width
                let height = collectionView.bounds.size.height * 0.7
                return CGSize(width: width, height: height)
        } else{
            let width = collectionView.bounds.size.width * 0.4
                let height = collectionView.bounds.size.height
                return CGSize(width: width, height: height)
        }
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == self.collectionViewTeamsOrPlayers {
            if sportSelected != "tennis"{
                
                let teamViewController = self.storyboard?.instantiateViewController(withIdentifier: "TeamViewController") as! TeamViewController
                
                NetworkService.fetchTeam(sportName: sportSelected!, teamId: String(leagueDetailsTeams[indexPath.row].team_key!)) { res in
                    guard let res = res, let result = res.result else {return}
                    
                    teamViewController.team = result[0]
                    
                    DispatchQueue.main.async {
                        self.navigationController?.pushViewController(teamViewController, animated: true)

                    }
                    
                }
                
            } else{
                
                let playerViewController = self.storyboard?.instantiateViewController(withIdentifier: "PlayerViewController") as! PlayerViewController
                
                NetworkService.fetchPlayer(sportName: sportSelected!, playerId: String(leagueDetailsPlayers[indexPath.row].player_key!)) { res in
                    
                        guard let res = res, let result = res.result else {return}
                        
                    playerViewController.player = result[0]
                        
                        DispatchQueue.main.async {
                            self.navigationController?.pushViewController(playerViewController, animated: true)

                        }
                }
                
            }
        }
    }

    
    @IBAction func addToFav(_ sender: Any) {
        //db.insertLeagueToDB(context: context, league: <#T##LeagueItemDB#>)
    }
    
}
