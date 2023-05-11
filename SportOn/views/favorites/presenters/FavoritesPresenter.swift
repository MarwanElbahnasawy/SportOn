//
//  FavoritesPresenter.swift
//  SportOn
//
//  Created by Marwan Elbahnasawy on 09/05/2023.
//

import Foundation
import CoreData

class FavoritesPreesenter: FavoritesPresenterProtocol{
    
    private let view: FavoritesViewProtocol
    private let networkService: NetworkServiceProtocol.Type
    private let networkConnectivityObserver : NetworkConnectivityObserverProtocol.Type
    private let db: DatabaseManagerProtocol
    
    init(view: FavoritesViewProtocol, networkService: NetworkServiceProtocol.Type,  networkConnectivityObserver: NetworkConnectivityObserverProtocol.Type, db: DatabaseManagerProtocol) {
        self.view = view
        self.networkService = networkService
        self.networkConnectivityObserver = networkConnectivityObserver
        self.db = db
    }
    
    private lazy var arrayTeams : [TeamItemDB] = {
        return (db.getAllTeams()).map{ $0 as! TeamItemDB}
    }()
    
    private lazy var arrayPlayers : [PlayerItemDB] = {
        return (db.getAllPlayers()).map{ $0 as! PlayerItemDB}
    }()
    
    private var teamObjects : [NSManagedObject]!
    private var playerObjects : [NSManagedObject]!
    
    
    func checkisNetworkAvailable() -> Bool {
        return networkConnectivityObserver.getIsNetworkAvailable()
    }
    
    func getTeamsCount() -> Int {
        return arrayTeams.count
    }
    
    func getPlayersCount() -> Int {
        return arrayPlayers.count
    }
    
    func getTeam(at index: Int) -> TeamItemDB {
        return arrayTeams[index]
    }
    
    func getPlayer(at index: Int) -> PlayerItemDB {
        return arrayPlayers[index]
    }
    
    func deleteTeam(teamKey: Int, completionHandler: () -> ()) {
        db.deleteTeam(teamKey: teamKey) {
            arrayTeams.removeAll()
            arrayTeams = db.getAllTeams().map {$0 as! TeamItemDB}
            view.reloadTableView()
        }
    }
    
    func deletePlayer(playerKey: Int, completionHandler: () -> ()) {
        db.deletePlayer(playerKey: playerKey) {
            arrayPlayers.removeAll()
            arrayPlayers = self.db.getAllPlayers().map {$0 as! PlayerItemDB}
            view.reloadTableView()
        }
    }
    
    
    
    
    func reloadDataAtViewWillAppear() {
        arrayTeams.removeAll()
        arrayTeams = db.getAllTeams().map {$0 as! TeamItemDB}
        arrayPlayers.removeAll()
        arrayPlayers = db.getAllPlayers().map {$0 as! PlayerItemDB}
        
        view.reloadTableView()
    }
    
    
}
