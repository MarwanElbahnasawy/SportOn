//
//  TeamDetails.swift
//  SportOn
//
//  Created by Marwan Elbahnasawy on 04/05/2023.
//

import Foundation

// MARK: Team Details (for a certain sport (Football/Basketball/Cricket only) )

struct TeamDetailsResult: Decodable {
    let success: Int?
    let result: [TeamDetailsItem]?
}


struct TeamDetailsItem: Decodable {
    let team_name: String?
    let team_logo: String?
    let team_key: Int?
    let players: [Player]?
    let coaches: [Coach]?

}


struct Coach: Decodable {
    let coach_name: String?

}


struct Player: Decodable {
    let player_name, player_number, player_type: String?
    let player_age, player_match_played, player_goals, player_yellow_cards: String?
    let player_red_cards: String?
    let player_image: String?
}
