//
//  ResultTeams.swift
//  SportOn
//
//  Created by Marwan Elbahnasawy on 03/05/2023.
//

import Foundation

struct ResultLeagueTeams: Decodable {
    let success: Int?
    let result: [ResultLeagueTeamsItem]?
}

struct ResultLeagueTeamsItem: Decodable {
    let team_key: Int?
    let team_logo: String?

}

