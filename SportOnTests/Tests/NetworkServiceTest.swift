//
//  NetworkServiceTest.swift
//  SportOnTests
//
//  Created by Marwan Elbahnasawy on 11/05/2023.
//

import XCTest
@testable import SportOn

final class NetworkServiceTest: XCTestCase {
    
    func testDataDecodingForAllLeagues () {
        // Given: An API request to fetch all leagues
        let expectation = expectation(description: "Waiting for the API")
        NetworkService.fetchLeagues(sportName: "football") { res in
            // When: The response is received
            guard let _ = res else {
                // Then: The result should not be nil
                XCTFail("Result returned was nil.")
                expectation.fulfill()
                return
            }
            expectation.fulfill()
        }
        
        self.waitForExpectations(timeout: 5)
        
    }
    
    func testLeaguesCount () {
        // Given: An API request to fetch all leagues
        let expectation = expectation(description: "Waiting for the API")
        NetworkService.fetchLeagues(sportName: "football") { res in
            // When: The response is received
            guard let res = res, let leagues = res.result else {
                // Then: The result should not be nil
                XCTFail("Result returned was nil.")
                expectation.fulfill()
                return
            }
            // Then: The number of leagues should be greater than 3
            XCTAssertGreaterThan(leagues.count, 3)
            expectation.fulfill()
        }
        
        self.waitForExpectations(timeout: 5)
        
    }
    
    func testUpcomingMatchesFootballNotNil () {
        // Given: An API request to fetch upcoming football matches for league ID "3"
        let expectation = expectation(description: "Waiting for the API")
        NetworkService.fetchResultUpcoming(sportName: "football", leagueID: "3") { res in
            // When: The response is received
            guard let res = res else {
                // Then: The result should not be nil
                XCTFail("Result returned was nil.")
                expectation.fulfill()
                return
            }
            let upcomingMatchesFootball = res.result
            // Then: Upcoming matches should not be nil
            XCTAssertNotNil(upcomingMatchesFootball)
            expectation.fulfill()
        }
        
        self.waitForExpectations(timeout: 5)
        
    }
    
    func testUpcomingMatchesTennisNil () {
        // Given: An API request to fetch upcoming tennis matches for league ID "2833"
        let expectation = expectation(description: "Waiting for the API")
        NetworkService.fetchResultUpcomingTennis(sportName: "tennis", leagueID: "2833") { res in
            // When: The response is received
            guard let res = res else {
                // Then: The result should not be nil
                XCTFail("Result returned was nil.")
                expectation.fulfill()
                return
            }
            // Then: Upcoming matches tessis should be nil
            XCTAssertNil(res.result)
            expectation.fulfill()
        }
        
        self.waitForExpectations(timeout: 5)
        
    }
    
    func testLiveMatchesCricketResponseSuccess () {
        // Given: An API request to fetch the latest cricket match results for league ID "733"
        let expectation = expectation(description: "Waiting for the API")
        NetworkService.fetchResultLatest(sportName: "cricket", leagueId: "733") { res in
            // When: The response is received
            guard let res = res else {
                // Then: The result should not be nil
                XCTFail("Result returned was nil.")
                expectation.fulfill()
                return
            }
            // Then: The value for success parameter should be equal 1
            XCTAssertEqual(res.success, 1)
            expectation.fulfill()
        }
        
        self.waitForExpectations(timeout: 5)
        
    }
    
    func testWrongParametersInUrlResultNil () {
        // Given: An API request to fetch the latest match results for an incorrect sport name and an incorrect league id
        let expectation = expectation(description: "Waiting for the API")
        NetworkService.fetchResultLatestTennis(sportName: "wrongName", leagueId: "wrongId") { res in
            // When: The response is received
            // Then: Response should be nil
            XCTAssertNil(res)
            expectation.fulfill()
        }
        
        
        self.waitForExpectations(timeout: 5)
        
    }
    
    func testLeageTeamsCountLessThanHundred () {
        // Given: An API request to fetch teams for football league ID "207"
        let expectation = expectation(description: "Waiting for the API")
        NetworkService.fetchTeams(sportName: "football", leagueId: "207") { res in
            // When: The response is received
            guard let res = res, let leagueTeams = res.result else {
                // Then: The result should not be nil
                XCTFail("Result returned was nil.")
                expectation.fulfill()
                return
            }
            // The: The league teams count should be less than 100
            XCTAssertLessThan(leagueTeams.count, 100)
            expectation.fulfill()
        }
        
        self.waitForExpectations(timeout: 5)
        
    }
    
    func testBasketBallTeamName () {
        // Given: An API request to fetch the basketball team with team ID "251"
        let expectation = expectation(description: "Waiting for the API")
        NetworkService.fetchTeam(sportName: "basketball", teamId: "251") { res in
            // When: The response is received
            guard let res = res, let basketballTeamArray = res.result else {
                // Then: The result should not be nil
                XCTFail("Result returned was nil.")
                expectation.fulfill()
                return
            }
            let basketballTeam = basketballTeamArray[0]
            // Then: The basketball team name should be "Slask Wroclaw II"
            XCTAssertTrue(basketballTeam.team_name == "Slask Wroclaw II")
            expectation.fulfill()
        }
        
        self.waitForExpectations(timeout: 5)
        
    }
    
    func testTennisPlayerName () {
        // Given: An API request to fetch a tennis player with player ID "1895"
        let expectation = expectation(description: "Waiting for the API")
        NetworkService.fetchPlayer(sportName: "tennis", playerId: "1895") { res in
            // When: The response is received
            guard let res = res, let playerArray = res.result else {
                // Then: The result should not be nil
                XCTFail("Result returned was nil.")
                expectation.fulfill()
                return
            }
            let player = playerArray[0]
            // Then: The player name should be "A. Bublik"
            XCTAssertEqual(player.player_name == "A. Bublik", true)
            expectation.fulfill()
        }
        
        self.waitForExpectations(timeout: 5)
        
    }
    
}
