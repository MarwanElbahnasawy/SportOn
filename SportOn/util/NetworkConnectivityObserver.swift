//
//  NetworkConnectivity.swift
//  SportOn
//
//  Created by Marwan Elbahnasawy on 09/05/2023.
//

import Foundation

protocol NetworkConnectivityObserver {
    static func getIsNetworkAvailable() -> Bool
}
