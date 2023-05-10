//
//  AllLeaguesPresenterProtocol.swift
//  SportOn
//
//  Created by Marwan Elbahnasawy on 09/05/2023.
//

import Foundation

protocol AllLeaguesPresenterProtocol: AnyObject {
    func checkisNetworkAvailable() -> Bool
    func getNumberOfFilteredLeagueItems() -> Int
    func getFilteredLeagueItem(at index: Int) -> AllLeaguesItem
    func fetchLeagues(sportName: String)
    func handleSearch(searchText: String)
    func handleSearcbBarCancelButtonClicked()
}
