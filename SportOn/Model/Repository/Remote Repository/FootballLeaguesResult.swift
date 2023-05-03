//
//  FootballLeaguesResult.swift
//  SportOn
//
//  Created by Marwan Elbahnasawy on 02/05/2023.
//

import Foundation

class FootballLeaguesResult: Decodable {
    var success : Int
    var result : [FootballLeaguesItem]?
}
