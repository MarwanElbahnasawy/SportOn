//
//  TeamPresenterProtocol.swift
//  SportOn
//
//  Created by Marwan Elbahnasawy on 10/05/2023.
//

import Foundation

protocol TeamDetailsPresenterProtocol {
    func checkisNetworkAvailable() -> Bool
    func fetchData(sportSelected: String, teamId: String)
    func getNumberOfPlayersInTeam() -> Int
    func getTeamPlayer(at index: Int) -> Player?
    func checkIfTeamExists() -> Bool
    func deleteTeam(completionHandler: () -> () )
    func insertTeam(teamItemDB: TeamItemDB, completionHandler : () -> () )
    func getTeam() -> TeamDetailsItem?
}
