//
//  PlayerDetails.swift
//  SportOn
//
//  Created by Marwan Elbahnasawy on 04/05/2023.
//

import Foundation

// MARK: Player Details (for a certain sport (Tennis only) )

struct PlayerDetailsResult: Decodable {
    let success: Int?
    let result: [PlayerDetailsItem]?
}


struct PlayerDetailsItem: Decodable {
    let player_key: Int?
    let player_name, player_number: String?
    let player_age: String?
    let team_name: String?
    let player_image: String?
}
