//
//  FavoritesPresenterProtocol.swift
//  SportOn
//
//  Created by Marwan Elbahnasawy on 10/05/2023.
//

import Foundation

protocol FavoritesPresenterProtocol {
    func checkisNetworkAvailable() -> Bool
    func getTeamsCount() -> Int
    func getPlayersCount() -> Int
    func getTeam(at index: Int) -> TeamItemDB
    func getPlayer(at index: Int) -> PlayerItemDB
    func deleteTeam(teamKey: Int, completionHandler: () -> () )
    func deletePlayer(playerKey: Int, completionHandler: () -> () )
    func reloadDataAtViewWillAppear()
}
