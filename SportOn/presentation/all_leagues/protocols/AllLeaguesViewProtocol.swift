//
//  AllLeaguesViewProtocol.swift
//  SportOn
//
//  Created by Marwan Elbahnasawy on 09/05/2023.
//

import Foundation

protocol AllLeaguesViewProtocol: AnyObject {
    func enableLottie()
    func disableLottie()
    func addSubview(text: String)
    func reloadTableView()
}
