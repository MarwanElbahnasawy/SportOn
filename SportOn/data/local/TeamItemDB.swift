//
//  LeagueItemDB.swift
//  SportOn
//
//  Created by Marwan Elbahnasawy on 04/05/2023.
//

import Foundation

struct TeamItemDB: DatabaseItem {
    let team_name: String?
    let team_logo: Data?
    let team_logo_string: String?
    let team_key: Int?
    let sportSelected: String?

    init(team_name: String?, team_logo: Data?, team_logo_string: String?, team_key: Int?, sportSelected: String?){
        self.team_name = team_name
        self.team_logo = team_logo
        self.team_logo_string = team_logo_string
        self.team_key = team_key
        self.sportSelected = sportSelected
    }

}
