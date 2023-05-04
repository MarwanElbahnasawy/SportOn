//
//  ResultLeagueTeamsTennis.swift
//  SportOn
//
//  Created by Marwan Elbahnasawy on 04/05/2023.
//

import Foundation
//ResultLeaguePlayersTennis

struct ResultLeaguePlayersTennis: Decodable {
    let success: Int?
    let result: [ResultLeaguePlayersTennisItem]?
}

struct ResultLeaguePlayersTennisItem: Decodable {
    let player_key: String?
    let player_image: String?
}
