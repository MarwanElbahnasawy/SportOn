//
//  ResultLeagueLatest.swift
//  SportOn
//
//  Created by Marwan Elbahnasawy on 03/05/2023.
//

import Foundation

struct ResultLeagueDetailsLatest: Decodable {
    let success: Int?
    let result: [ResultLeagueDetailsLatestItem]?
}


struct ResultLeagueDetailsLatestItem: Decodable {
    let event_home_team, event_away_team, event_final_result, home_team_logo, away_team_logo: String?
    let event_date, event_time: String?
}
