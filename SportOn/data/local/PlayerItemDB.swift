//
//  PlayerItemDB.swift
//  SportOn
//
//  Created by Marwan Elbahnasawy on 05/05/2023.
//

import Foundation

struct PlayerItemDB: DatabaseItem {
    let player_key: Int?
    let player_name: String?
    let player_image: Data?
    let player_image_string: String?
    
    init(player_key: Int?, player_name: String?, player_image: Data?, player_image_string: String?) {
        self.player_key = player_key
        self.player_name = player_name
        self.player_image = player_image
        self.player_image_string = player_image_string
    }
}
