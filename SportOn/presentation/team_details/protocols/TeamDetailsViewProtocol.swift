//
//  TeamViewProtocol.swift
//  SportOn
//
//  Created by Marwan Elbahnasawy on 10/05/2023.
//

import Foundation

protocol TeamDetailsViewProtocol {
    func enableLottie()
    func disableLottie()
    func reloadTableView()
    func updateView(team: TeamDetailsItem?)
}
