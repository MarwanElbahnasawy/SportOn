//
//  NetworkServiceProtocol.swift
//  SportOn
//
//  Created by Marwan Elbahnasawy on 10/05/2023.
//

import Foundation

protocol NetworkServiceProtocol {
    static func fetchData(met: String, sportName: String, additionalParam: [String: String], completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void)
    static func fetchLeagues(sportName: String, completionHandler: @escaping (AllLeaguesResult?) -> Void)
    static func fetchResultUpcoming(sportName: String, leagueID: String, completionHandler: @escaping (UpcomingMatchesResultForFootballBasketballCricket?) -> Void)
    static func fetchResultUpcomingTennis(sportName: String, leagueID: String, completionHandler: @escaping (UpcomingMatchesResultForTennis?) -> Void)
    static func fetchResultLatest(sportName: String, leagueId: String, completionHandler: @escaping (LiveMatchesResultForFootballBasketballCricket?) -> Void)
    static func fetchResultLatestTennis(sportName: String, leagueId: String, completionHandler: @escaping (LiveMatchesResultForTennis?) -> Void)
    static func fetchTeams(sportName: String, leagueId: String, completionHandler: @escaping (AllTeamsResult?) -> Void)
    static func fetchPlayers(sportName: String, leagueId: String, completionHandler: @escaping (AllPlayersResult?) -> Void)
    static func fetchTeam(sportName: String, teamId: String, completionHandler: @escaping (TeamDetailsResult?) -> Void)
    static func fetchPlayer(sportName: String, playerId: String, completionHandler: @escaping (PlayerDetailsResult?) -> Void)
}
