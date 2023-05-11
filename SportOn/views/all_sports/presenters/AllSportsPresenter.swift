//
//  AllSportsPresenter.swift
//  SportOn
//
//  Created by Marwan Elbahnasawy on 09/05/2023.
//

import Foundation

class AllSportsPresenter: AllSportsPresenterProtocol{
    
    private let view: AllSportsViewProtocol
    private let db: DatabaseManagerProtocol
    private let networkConnectivityObserver: NetworkConnectivityObserverProtocol.Type
    
    init(view: AllSportsViewProtocol, db: DatabaseManagerProtocol, networkConnectivityObserver: NetworkConnectivityObserverProtocol.Type) {
        self.view = view
        self.db = db
        self.networkConnectivityObserver = networkConnectivityObserver
    }
    
    private let sportItems: [SportItem] = [SportItem(title: "Football", image: .footballplayer), SportItem(title: "Basketball", image: .basketballplayer), SportItem(title: "Cricket", image: .cricketplayer ),SportItem(title: "Tennis", image: .tennisplayer) ]
    
    func checkisNetworkAvailable() -> Bool{
        return networkConnectivityObserver.getIsNetworkAvailable()
    }
    
    func getSportSelected(row: Int)-> String{
        switch row {
        case 0:
            return "football"
        case 1:
            return "basketball"
        case 2:
            return "cricket"
        default:
            return "tennis"
        }
    }
    
    func getNumberOfSportsItems() -> Int {
        return sportItems.count
    }
    
    func getSportItem(at index: Int) -> SportItem {
        return sportItems[index]
    }
}
