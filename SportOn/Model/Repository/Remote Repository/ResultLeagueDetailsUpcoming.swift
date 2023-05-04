//
//  ResultLeagueDetailsUpcoming.swift
//  SportOn
//
//  Created by Marwan Elbahnasawy on 03/05/2023.
//

import Foundation


struct ResultLeagueDetailsUpcoming: Decodable {
    let success: Int?
    let result: [ResultLeagueDetailsUpcomingItem]?
}


struct ResultLeagueDetailsUpcomingItem: Decodable {
    let event_date, event_time, event_home_team, event_away_team, home_team_logo, away_team_logo: String?
    }
