//
//  PlayerDetails.swift
//  SportOn
//
//  Created by Marwan Elbahnasawy on 04/05/2023.
//

import Foundation

// MARK: Player Details (for a certain sport (Tennis only) )

struct ResultPlayerDetailsTennis: Decodable {
    let success: Int?
    let result: [ResultPlayerDetailsTennisItem]?
}


struct ResultPlayerDetailsTennisItem: Decodable {
    let player_name, player_number: String?
    let player_age: String?
    let team_name: String?
    let player_image: String?
}
