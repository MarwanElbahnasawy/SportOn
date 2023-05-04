//
//  Leagues.swift
//  SportOn
//
//  Created by Marwan Elbahnasawy on 04/05/2023.
//

import Foundation

// MARK: ResultLeagues (All leagues for any sport)

class ResultLeagues: Decodable {
    var success : Int?
    var result : [ResultLeaguesItem]?
}

class ResultLeaguesItem: Decodable{
    var league_name, league_logo : String?
    var league_key: Int?
}
