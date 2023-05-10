//
//  Leagues.swift
//  SportOn
//
//  Created by Marwan Elbahnasawy on 04/05/2023.
//

import Foundation

class AllLeaguesResult: Decodable {
    var success : Int?
    var result : [AllLeaguesItem]?
}

class AllLeaguesItem: Decodable{
    var league_name, league_logo : String?
    var league_key: Int?
}
