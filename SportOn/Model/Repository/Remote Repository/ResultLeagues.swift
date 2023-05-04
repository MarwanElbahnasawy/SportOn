//
//  FootballLeaguesResult.swift
//  SportOn
//
//  Created by Marwan Elbahnasawy on 02/05/2023.
//

import Foundation

class ResultLeagues: Decodable {
    var success : Int?
    var result : [ResultLeaguesItem]?
}

class ResultLeaguesItem: Decodable{
    var league_name, league_logo : String?
    var league_key: Int?
}
