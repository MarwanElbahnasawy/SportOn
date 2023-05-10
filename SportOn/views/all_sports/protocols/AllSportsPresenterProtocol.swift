//
//  AllSportsPresenterProtocol.swift
//  SportOn
//
//  Created by Marwan Elbahnasawy on 09/05/2023.
//

import Foundation

protocol AllSportsPresenterProtocol: AnyObject {
    func checkisNetworkAvailable() -> Bool
    func getSportSelected(row: Int)-> String
    func getNumberOfSportsItems() -> Int
    func getSportItem(at index: Int) -> SportItem
}
