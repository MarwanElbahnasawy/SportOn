//
//  MockNetworkServiceTest.swift
//  SportOnTests
//
//  Created by Marwan Elbahnasawy on 10/05/2023.
//

import XCTest
@testable import SportOn

final class MockNetworkServiceTest: XCTestCase {
    
    func testDecodeFootballData() {
        // Given: A request to fetch football leagues
        MockNetworkService.fetchLeagues(sportName: "football") { res in
            // When: The response is received
            guard let _ = res else {
                // Then: The result should not be nil
                XCTFail("Result returned was nil.")
                return
            }
            
        }
        
    }
    
    func testFirstFootballLeagueName() {
        // Given: A request to fetch football leagues
        MockNetworkService.fetchLeagues(sportName: "football") { res in
            // When: The response is received
            guard let res = res else {
                // Then: The result should not be nil
                XCTFail("Result returned was nil.")
                return
            }
            let allLeagues = res.result!
            // Then: The first league name should be "UEFA Europa League"
            XCTAssert(allLeagues[0].league_name == "UEFA Europa League")
        }
        
    }
    
    func testUpcomingFootballMatchesCount() {
        // Given: A request to fetch upcoming football matches for league ID "207"
        MockNetworkService.fetchResultUpcoming(sportName: "football", leagueID: "207") { res in
            // When: The response is received
            guard let res = res else {
                // Then: The result should not be nil
                XCTFail("Result returned was nil.")
                return
            }
            let upcomingMatchesFootball = res.result!
            // Then: The count of upcoming matches should be 2
            XCTAssertEqual(upcomingMatchesFootball.count, 2)
        }
        
        
    }
    
    func testFirstPlayerNameInTennisNotNil() {
        // Given: A request to fetch upcoming tennis matches for league ID "2010"
        MockNetworkService.fetchResultUpcomingTennis(sportName: "tennis", leagueID: "2010") { res in
            // When: The response is received
            guard let res = res else {
                // Then: The result should not be nil
                XCTFail("Result returned was nil.")
                return
            }
            let upcomingMatchesTennis = res.result!
            // Then: The first player name should not be nil
            XCTAssertNotNil(upcomingMatchesTennis[0].event_first_player)
        }
    }
    
    
    func testLiveFootballMatchFinalResult() {
        // Given: A request to fetch the latest football match results for league ID "21"
        MockNetworkService.fetchResultLatest(sportName: "football", leagueId: "21") { res in
            // When: The response is received
            guard let res = res else {
                // Then: The result should not be nil
                XCTFail("Result returned was nil.")
                return
            }
            let liveMatchesFootball = res.result!
            // Then: The final result of the first match should be "3 - 2"
            XCTAssertTrue(liveMatchesFootball[0].event_final_result == "3 - 2")
        }
        
        
        
    }
    
    func testLiveTennisMatchesCount() {
        // Given: A request to fetch the latest tennis match results for league ID "14"
        MockNetworkService.fetchResultLatestTennis(sportName: "tennis", leagueId: "14") { res in
            // When: The response is received
            guard let res = res else {
                // Then: The result should not be nil
                XCTFail("Result returned was nil.")
                return
            }
            let liveMatchesTennis = res.result!
            // Then: The count of live tennis matches should not be 2
            XCTAssertFalse(liveMatchesTennis.count == 2)
        }
        
        
        
    }
    
    func testFootballTeamKey() {
        // Given: A request to fetch teams for football league ID "123"
        MockNetworkService.fetchTeams(sportName: "football", leagueId: "123") { res in
            // When: The response is received
            guard let res = res else {
                // Then: The result should not be nil
                XCTFail("Result returned was nil.")
                return
            }
            let teamsFootball = res.result!
            // Then: The team key of the first team should be 557
            XCTAssertTrue(teamsFootball[0].team_key == 557)
        }
        
        
        
    }
    
    func testFootballTeamCoachName() {
        // Given: A request to fetch the football team with team ID "631"
        MockNetworkService.fetchTeam(sportName: "football", teamId: "631") { res in
            // When: The response is received
            guard let res = res else {
                // Then: The result should not be nil
                XCTFail("Result returned was nil.")
                return
            }
            let teamFootball = res.result!
            guard let coaches = teamFootball[0].coaches else{
                // Then: Coaches should not be nil
                XCTFail("Coaches were nil.")
                return
            }
            // Then: The coach name of the team should be "M. Allegri"
            XCTAssert(coaches[0].coach_name == "M. Allegri")
        }
        
    }
    
    
    
}
