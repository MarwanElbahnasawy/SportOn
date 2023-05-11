//
//  TeamDetailsPresenter.swift
//  SportOn
//
//  Created by Marwan Elbahnasawy on 09/05/2023.
//

import Foundation

class TeamDetailsPresenter: TeamDetailsPresenterProtocol{
    
    private let view: TeamDetailsViewProtocol
    private let networkService: NetworkServiceProtocol.Type
    private let networkConnectivityObserver : NetworkConnectivityObserverProtocol.Type
    private let sportSelected: String
    private let db: DatabaseManagerProtocol
    
    init(view: TeamDetailsViewProtocol, networkService: NetworkServiceProtocol.Type,  networkConnectivityObserver: NetworkConnectivityObserverProtocol.Type, sportSelected: String, db: DatabaseManagerProtocol) {
        self.view = view
        self.networkService = networkService
        self.networkConnectivityObserver = networkConnectivityObserver
        self.sportSelected = sportSelected
        self.db = db
    }
    
    var team : TeamDetailsItem?
    var teamPlayers: [Player]?
    
    
    func checkisNetworkAvailable() -> Bool {
        return networkConnectivityObserver.getIsNetworkAvailable()
    }
    
    func fetchData(sportSelected: String, teamId: String) {
        NetworkService.fetchTeam(sportName: sportSelected, teamId: teamId) { [weak self] res in
            guard let res = res, let result = res.result else {return}
            
            self?.team = result[0]
            self?.teamPlayers = self?.team?.players
            
            self?.view.updateView(team: self?.team)
            
            self?.view.reloadTableView()
            self?.view.disableLottie()
            
        }
    }
    
    func getNumberOfPlayersInTeam() -> Int {
        return teamPlayers?.count ?? 0
    }
    
    func getTeamPlayer(at index: Int) -> Player? {
        if let teamPlayers = teamPlayers {
            return teamPlayers[index]
        } else{
            return nil
        }
    }
    
    func checkIfTeamExists() -> Bool{
        return db.checkIfTeamExists(teamKey: (team?.team_key!)!)
    }
    
    func deleteTeam(completionHandler: () -> () ){
        db.deleteTeam(teamKey: (team?.team_key!)!) {
            completionHandler()
        }
    }
    
    func insertTeam(teamItemDB: TeamItemDB, completionHandler : () -> () ){
        db.insert(item: teamItemDB) {
            completionHandler()
        }
    }
    
    func getTeam() -> TeamDetailsItem? {
        return team
    }
}
