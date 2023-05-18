//
//  LeagueDetailsViewProtocol.swift
//  SportOn
//
//  Created by Marwan Elbahnasawy on 10/05/2023.
//

import Foundation

protocol LeagueDetailsViewProtocol: AnyObject {
    func enableLottie(lottieViewNumber: Int)
    func disableLottie(lottieViewNumber: Int)
    func addSubview(text: String, lottieViewNumber: Int)
    func reloadCollectionView(collectionViewNumber: Int )
    func changeLabelTeamsOrPlayersTextToPlayers()
}
