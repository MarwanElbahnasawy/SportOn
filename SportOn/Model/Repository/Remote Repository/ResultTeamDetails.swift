//
//  ResultTeamDetails.swift
//  SportOn
//
//  Created by Marwan Elbahnasawy on 03/05/2023.
//

import Foundation

struct ResultTeamDetails: Decodable {
    let success: Int?
    let result: [ResultTeamDetailsItem]?
}


struct ResultTeamDetailsItem: Decodable {
    let team_name: String?
    let team_logo: String?
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

