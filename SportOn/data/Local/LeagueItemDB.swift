//
//  LeagueItemDB.swift
//  SportOn
//
//  Created by Marwan Elbahnasawy on 04/05/2023.
//

import Foundation

struct LeagueItemDB {
    var league_name : String?
    var league_key: Int?
    var league_logo: Data?
       
    init(league_name: String? = nil, league_logo: Data? = nil, league_key: Int? = nil) {
        self.league_name = league_name
        self.league_logo = league_logo
        self.league_key = league_key
    }
}
