//
//  PlayerDetailsPresenterProtocol.swift
//  SportOn
//
//  Created by Marwan Elbahnasawy on 10/05/2023.
//

import Foundation

protocol PlayerDetailsPresenterProtocol {
    func checkisNetworkAvailable() -> Bool
    func fetchData(sportSelected: String, playerId: String)
    func checkIfPlayerExists() -> Bool
    func deletePlayer(completionHandler: () -> () )
    func insertPlayer(playerItemDB: PlayerItemDB, completionHandler : () -> () )
    func getPlayer() -> PlayerDetailsItem?
}
