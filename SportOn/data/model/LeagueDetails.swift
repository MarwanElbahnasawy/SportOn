//
//  LeagueDetails.swift
//  SportOn
//
//  Created by Marwan Elbahnasawy on 04/05/2023.
//

import Foundation

// MARK: League Details -> Upcoming (for a certain sport (Football/Basketball/Cricket only) )

struct ResultLeagueDetailsUpcoming: Decodable {
    let success: Int?
    let result: [ResultLeagueDetailsUpcomingItem]?
}


struct ResultLeagueDetailsUpcomingItem: Decodable {
    let event_date, event_time, event_home_team, event_away_team, home_team_logo, away_team_logo: String?
    }


// MARK: League Details -> Upcoming (for a certain sport (Tennis only) )

struct ResultLeagueDetailsUpcomingTennis: Decodable {
    let success: Int?
    let result: [ResultLeagueDetailsUpcomingTennisItem]?
}


struct ResultLeagueDetailsUpcomingTennisItem: Decodable {
    let event_date, event_time, event_first_player, event_second_player, event_first_player_logo, event_second_player_logo: String?
}





// MARK: League Details -> Latest Results / Live Matches (for a certain sport (Football/Basketball/Cricket only) )

struct ResultLeagueDetailsLatest: Decodable {
    let success: Int?
    let result: [ResultLeagueDetailsLatestItem]?
}


struct ResultLeagueDetailsLatestItem: Decodable {
    let event_home_team, event_away_team, event_final_result, home_team_logo, away_team_logo: String?
    let event_date, event_time: String?
}


// MARK: League Details -> Latest Results / Live Matches (for a certain sport (Tennis only) )

struct ResultLeagueDetailsLatestTennis: Decodable {
    let success: Int?
    let result: [ResultLeagueDetailsLatestTennisItem]?
}


struct ResultLeagueDetailsLatestTennisItem: Decodable {
    let event_first_player, event_second_player, event_final_result, event_first_player_logo, event_second_player_logo: String?
    let event_date, event_time: String?
}





// MARK: League Details -> Teams (for a certain sport (Football/Basketball/Cricket only) )

struct ResultLeagueTeams: Decodable {
    let success: Int?
    let result: [ResultLeagueTeamsItem]?
}

struct ResultLeagueTeamsItem: Decodable {
    let team_key: Int?
    let team_logo: String?

}


// MARK: League Details -> Players (for a certain sport (Tennis only) )

struct ResultLeaguePlayersTennis: Decodable {
    let success: Int?
    let result: [ResultLeaguePlayersTennisItem]?
}

struct ResultLeaguePlayersTennisItem: Decodable {
    let player_key: String?
    let player_image: String?
}
