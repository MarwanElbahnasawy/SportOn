//
//  PlayerDetailsPresenter.swift
//  SportOn
//
//  Created by Marwan Elbahnasawy on 09/05/2023.
//

import Foundation

class PlayerDetailsPresenter: PlayerDetailsPresenterProtocol{
   
    private let view: PlayerDetailsViewProtocol
    private let networkService: NetworkServiceProtocol.Type
    private let networkConnectivityObserver : NetworkConnectivityObserverProtocol.Type
    private let sportSelected: String
    private let db: DatabaseManagerProtocol
    
    init(view: PlayerDetailsViewProtocol, networkService: NetworkServiceProtocol.Type,  networkConnectivityObserver: NetworkConnectivityObserverProtocol.Type, sportSelected: String, db: DatabaseManagerProtocol) {
        self.view = view
        self.networkService = networkService
        self.networkConnectivityObserver = networkConnectivityObserver
        self.sportSelected = sportSelected
        self.db = db
    }
    
    private var player: PlayerDetailsItem?
    
    func checkisNetworkAvailable() -> Bool {
        return networkConnectivityObserver.getIsNetworkAvailable()
    }
    
    func fetchData(sportSelected: String, playerId: String) {
        
        NetworkService.fetchPlayer(sportName: sportSelected, playerId: playerId) { [weak self] res in
            
            guard let res = res, let result = res.result else {return}
            
            self?.player = result[0]
            
            self?.view.updateView(player: self?.player)
            
            self?.view.disableLottie()
            
        }
        
    }
    
    func checkIfPlayerExists() -> Bool {
        return db.checkIfPlayerExists(playerKey: (player?.player_key)!)
    }
    
    func deletePlayer(completionHandler: () -> ()) {
        db.deletePlayer(playerKey: (player?.player_key)!) {
            completionHandler()
        }
    }
    
    func insertPlayer(playerItemDB: PlayerItemDB, completionHandler: () -> ()) {
        db.insert(item: playerItemDB) {
            completionHandler()
        }
    }
    
    func getPlayer() -> PlayerDetailsItem? {
        return player
    }
    
}
