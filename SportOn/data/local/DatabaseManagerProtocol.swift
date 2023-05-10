//
//  DatabaseManagerProtocol.swift
//  SportOn
//
//  Created by Marwan Elbahnasawy on 10/05/2023.
//

import Foundation

protocol DatabaseManagerProtocol {
    func insert(item: DatabaseItem, completionHandler: () -> ())
    func deleteTeam(teamKey: Int, completionHandler: () -> ())
    func deletePlayer(playerKey: Int, completionHandler: () -> ())
    func getAllTeams() -> [DatabaseItem]
    func getAllPlayers() -> [DatabaseItem]
    func setOnboardingWasShownBeforeToTrue()
    func checkIfOnboardingWasShownBefore() -> Bool
    func checkIfTeamExists(teamKey: Int) -> Bool
    func checkIfPlayerExists(playerKey: Int) -> Bool
}
