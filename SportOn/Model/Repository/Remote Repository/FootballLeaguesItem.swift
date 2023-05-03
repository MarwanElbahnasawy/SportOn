//
//  FootballLeaguesItem.swift
//  SportOn
//
//  Created by Marwan Elbahnasawy on 02/05/2023.
//

import Foundation

class FootballLeaguesItem: Decodable{
    var league_key : Int?
    var league_name: String?
    var country_key: Int?
    var country_name : String?
    var league_logo: String?
    var country_logo: String?
}
