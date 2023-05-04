//
//  ResultLeagueDetailsLatestTennis.swift
//  SportOn
//
//  Created by Marwan Elbahnasawy on 04/05/2023.
//

import Foundation
//ResultLeagueDetailsLatestTennis

struct ResultLeagueDetailsLatestTennis: Decodable {
    let success: Int?
    let result: [ResultLeagueDetailsLatestTennisItem]?
}


struct ResultLeagueDetailsLatestTennisItem: Decodable {
    let event_first_player, event_second_player, event_final_result, event_first_player_logo, event_second_player_logo: String?
    let event_date, event_time: String?
}
