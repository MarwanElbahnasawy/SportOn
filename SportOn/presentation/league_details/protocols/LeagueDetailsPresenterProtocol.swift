//
//  LeagueDetailsPresenterProtocol.swift
//  SportOn
//
//  Created by Marwan Elbahnasawy on 10/05/2023.
//

import Foundation

protocol LeagueDetailsPresenterProtocol: AnyObject {
    func checkisNetworkAvailable() -> Bool
    func fetchData(sportSelected: String, leagueIDSelected: String)
    func getNumberOfUpcomingMatchesForFootballBasketballCricketItem() -> Int
    func getNumberOfLiveMatchesForFootballBasketballCricketItem() -> Int
    func getNumberOfAllTeamsItem() -> Int
    func getNumberOfUpcomingMatchesForTennisItem() -> Int
    func getNumberOfLiveMatchesForTennisItem() -> Int
    func getNumberOfAllPlayersItem() -> Int
    func getUpcomingMatchesForFootballBasketballCricketItem(at index: Int) -> UpcomingMatchesForFootballBasketballCricketItem
    func getLiveMatchesForFootballBasketballCricketItem(at index: Int) -> LiveMatchesForFootballBasketballCricketItem
    func getAllTeamsItem(at index: Int) -> AllTeamsItem
    func getUpcomingMatchesForTennisItem(at index: Int) -> UpcomingMatchesForTennisItem
    func getLiveMatchesForTennisItem(at index: Int) -> LiveMatchesForTennisItem
    func getAllPlayersItem(at index: Int) -> AllPlayersItem
}
