//
//  LeagueDetailsPresenter.swift
//  SportOn
//
//  Created by Marwan Elbahnasawy on 09/05/2023.
//

import Foundation

class LeagueDetailsPresenter: LeagueDetailsPresenterProtocol{
    
    private let view: LeagueDetailsViewProtocol
    private let networkService: NetworkService.Type
    private let networkConnectivityObserver : NetworkConnectivityObserver.Type
    private let sportSelected: String
    
    init(view: LeagueDetailsViewProtocol, networkService: NetworkService.Type,  networkConnectivityObserver: NetworkConnectivityObserver.Type, sportSelected: String) {
        self.view = view
        self.networkService = networkService
        self.networkConnectivityObserver = networkConnectivityObserver
        self.sportSelected = sportSelected
    }
    
    private var leagueDetailsUpcoming : [UpcomingMatchesForFootballBasketballCricketItem] = []
    private var leagueDetailsLatestResults : [LiveMatchesForFootballBasketballCricketItem] = []
    private var leagueDetailsTeams : [AllTeamsItem] = []
    
    private var leagueDetailsUpcomingTennis : [UpcomingMatchesForTennisItem] = []
    private var leagueDetailsLatestResultsTennis : [LiveMatchesForTennisItem] = []
    private var leagueDetailsPlayers : [AllPlayersItem] = []
    
    func checkisNetworkAvailable() -> Bool {
        return networkConnectivityObserver.getIsNetworkAvailable()
    }
    
    func fetchData(sportSelected: String, leagueIDSelected: String) {
        // if sportSelected = football/basketball/cricket
        if sportSelected != "tennis"{
            
            NetworkService.fetchResultUpcoming(sportName: sportSelected, leagueID: String(leagueIDSelected)) { [weak self] res in
                guard let res = res, let result = res.result else {
                    self?.view.disableLottie(lottieViewNumber: 1)
                    self?.view.addSubview(text: "No Upcoming Matches Available.", lottieViewNumber: 1)
                    return
                    
                }
                
                self?.leagueDetailsUpcoming = result
                
                self?.view.reloadCollectionView(collectionViewNumber: 1)
                self?.view.disableLottie(lottieViewNumber: 1)
                
            }
            
            NetworkService.fetchResultLatest(sportName: sportSelected, leagueId: String(leagueIDSelected)) { [weak self] res in
                guard let res = res, let result = res.result else {
                    self?.view.disableLottie(lottieViewNumber: 2)
                    self?.view.addSubview(text: "No Live Matches Available.", lottieViewNumber: 2)
                    return
                }
                
                self?.leagueDetailsLatestResults = result
                
                self?.view.reloadCollectionView(collectionViewNumber: 2)
                self?.view.disableLottie(lottieViewNumber: 2)
                
            }
            
            NetworkService.fetchTeams(sportName: sportSelected, leagueId: String(leagueIDSelected)) { [weak self] res in
                guard let res = res, let result = res.result else {
                    self?.view.disableLottie(lottieViewNumber: 3)
                    self?.view.addSubview(text: "No Teams Available.", lottieViewNumber: 3)
                    return
                }
                
                self?.leagueDetailsTeams = result
                
                self?.view.reloadCollectionView(collectionViewNumber: 3)
                self?.view.disableLottie(lottieViewNumber: 3)
                
            }
            // if sportSelected = tennis
        } else if sportSelected == "tennis"{
            
            view.changeLabelTeamsOrPlayersTextToPlayers()
            
            
            NetworkService.fetchResultUpcomingTennis(sportName: sportSelected, leagueID: String(leagueIDSelected)) { [weak self] res in
                guard let res = res, let result = res.result else {
                    self?.view.disableLottie(lottieViewNumber: 1)
                    self?.view.addSubview(text: "No Upcoming Matches Available.", lottieViewNumber: 1)
                    return
                }
                
                self?.leagueDetailsUpcomingTennis = result
                
                self?.view.reloadCollectionView(collectionViewNumber: 1)
                self?.view.disableLottie(lottieViewNumber: 1)
            }
            
            NetworkService.fetchResultLatestTennis(sportName: sportSelected, leagueId: String(leagueIDSelected)) { [weak self] res in
                guard let res = res, let result = res.result else {
                    self?.view.disableLottie(lottieViewNumber: 2)
                    self?.view.addSubview(text: "No Live Matches Available.", lottieViewNumber: 2)
                    return
                    
                }
                
                self?.leagueDetailsLatestResultsTennis = result
                
                self?.view.reloadCollectionView(collectionViewNumber: 2)
                self?.view.disableLottie(lottieViewNumber: 2)
            }
            
            NetworkService.fetchPlayers(sportName: sportSelected, leagueId: String(leagueIDSelected)) { [weak self] res in
                guard let res = res, let result = res.result else {
                    self?.view.disableLottie(lottieViewNumber: 3)
                    self?.view.addSubview(text: "No Players Available.", lottieViewNumber: 3)
                    return
                    
                }
                
                self?.leagueDetailsPlayers = result
                
                self?.view.reloadCollectionView(collectionViewNumber: 3)
                self?.view.disableLottie(lottieViewNumber: 3)
            }
        }
    }
    
    
    func getNumberOfUpcomingMatchesForFootballBasketballCricketItem() -> Int {
        return leagueDetailsUpcoming.count
    }
    
    func getNumberOfLiveMatchesForFootballBasketballCricketItem() -> Int {
        return leagueDetailsLatestResults.count
    }
    
    func getNumberOfAllTeamsItem() -> Int {
        return leagueDetailsTeams.count
    }

    func getNumberOfUpcomingMatchesForTennisItem() -> Int {
        return leagueDetailsUpcomingTennis.count
    }
    
    func getNumberOfLiveMatchesForTennisItem() -> Int {
        return leagueDetailsLatestResultsTennis.count
    }
    
    func getNumberOfAllPlayersItem() -> Int {
        return leagueDetailsPlayers.count
    }
    
    func getUpcomingMatchesForFootballBasketballCricketItem(at index: Int) -> UpcomingMatchesForFootballBasketballCricketItem {
        return leagueDetailsUpcoming[index]
    }
    
    func getLiveMatchesForFootballBasketballCricketItem(at index: Int) -> LiveMatchesForFootballBasketballCricketItem {
        return leagueDetailsLatestResults[index]
    }
    
    func getAllTeamsItem(at index: Int) -> AllTeamsItem {
        return leagueDetailsTeams[index]
    }
    
    func getUpcomingMatchesForTennisItem(at index: Int) -> UpcomingMatchesForTennisItem {
        return leagueDetailsUpcomingTennis[index]
    }
    
    func getLiveMatchesForTennisItem(at index: Int) -> LiveMatchesForTennisItem {
        return leagueDetailsLatestResultsTennis[index]
    }
    
    func getAllPlayersItem(at index: Int) -> AllPlayersItem {
        return leagueDetailsPlayers[index]
    }
    
    
}
