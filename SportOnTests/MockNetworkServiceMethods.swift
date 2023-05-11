//
//  MockNetworkServiceMethods.swift
//  SportOnTests
//
//  Created by Marwan Elbahnasawy on 11/05/2023.
//

import Foundation
@testable import SportOn

extension MockNetworkService: NetworkServiceProtocol{
    
    
    static func fetchData(met: String, sportName: String, additionalParam: [String : String], completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) {
        
    }
    
    static func fetchLeagues(sportName: String, completionHandler: @escaping (SportOn.AllLeaguesResult?) -> Void) {
        let data = Data(allLeaguesForFootballData.utf8)
        do {
            let res = try JSONDecoder().decode(AllLeaguesResult.self, from: data)
            completionHandler(res)
        } catch {
            completionHandler(nil)
        }
    }
    
    static func fetchResultUpcoming(sportName: String, leagueID: String, completionHandler: @escaping (SportOn.UpcomingMatchesResultForFootballBasketballCricket?) -> Void) {
        let data = Data(upcomingMatchesForFootballData.utf8)
        do {
            let res = try JSONDecoder().decode(UpcomingMatchesResultForFootballBasketballCricket.self, from: data)
            completionHandler(res)
        } catch {
            completionHandler(nil)
        }
    }
    
    static func fetchResultUpcomingTennis(sportName: String, leagueID: String, completionHandler: @escaping (SportOn.UpcomingMatchesResultForTennis?) -> Void) {
        let data = Data(upcomingMatchesForTennisData.utf8)
        do {
            let res = try JSONDecoder().decode(UpcomingMatchesResultForTennis.self, from: data)
            completionHandler(res)
        } catch {
            completionHandler(nil)
        }
    }
    
    static func fetchResultLatest(sportName: String, leagueId: String, completionHandler: @escaping (SportOn.LiveMatchesResultForFootballBasketballCricket?) -> Void) {
        let data = Data(liveMatchesForFootballData.utf8)
        do {
            let res = try JSONDecoder().decode(LiveMatchesResultForFootballBasketballCricket.self, from: data)
            completionHandler(res)
        } catch {
            completionHandler(nil)
        }
    }
    
    static func fetchResultLatestTennis(sportName: String, leagueId: String, completionHandler: @escaping (SportOn.LiveMatchesResultForTennis?) -> Void) {
        let data = Data(liveMatchesForTennisData.utf8)
        do {
            let res = try JSONDecoder().decode(LiveMatchesResultForTennis.self, from: data)
            completionHandler(res)
        } catch {
            completionHandler(nil)
        }
    }
    
    static func fetchTeams(sportName: String, leagueId: String, completionHandler: @escaping (SportOn.AllTeamsResult?) -> Void) {
        let data = Data(teamsForFootballMatch.utf8)
        do {
            let res = try JSONDecoder().decode(AllTeamsResult.self, from: data)
            completionHandler(res)
        } catch {
            completionHandler(nil)
        }
    }
    
    static func fetchPlayers(sportName: String, leagueId: String, completionHandler: @escaping (SportOn.AllPlayersResult?) -> Void) {
        
    }
    
    static func fetchTeam(sportName: String, teamId: String, completionHandler: @escaping (SportOn.TeamDetailsResult?) -> Void) {
        let data = Data(teamDetailsForFootballData.utf8)
        do {
            let res = try JSONDecoder().decode(TeamDetailsResult.self, from: data)
            completionHandler(res)
        } catch {
            completionHandler(nil)
        }
    }
    
    static func fetchPlayer(sportName: String, playerId: String, completionHandler: @escaping (SportOn.PlayerDetailsResult?) -> Void) {
        
    }
    
    
}
