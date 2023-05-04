//
//  ResultLeagueDetailsUpcomingTennis.swift
//  SportOn
//
//  Created by Marwan Elbahnasawy on 04/05/2023.
//

import Foundation


struct ResultLeagueDetailsUpcomingTennis: Decodable {
    let success: Int?
    let result: [ResultLeagueDetailsUpcomingTennisItem]?
}


struct ResultLeagueDetailsUpcomingTennisItem: Decodable {
    let event_date, event_time, event_first_player, event_second_player, event_first_player_logo, event_second_player_logo: String?
}
