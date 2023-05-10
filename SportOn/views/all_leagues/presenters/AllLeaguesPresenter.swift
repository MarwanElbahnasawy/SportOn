//
//  AllLeaguesPresenter.swift
//  SportOn
//
//  Created by Marwan Elbahnasawy on 09/05/2023.
//

import Foundation

class AllLeaguesPresenter: AllLeaguesPresenterProtocol{
   
    private let view: AllLeaguesViewProtocol
    private let networkService: NetworkService.Type
    private let networkConnectivityObserver : NetworkConnectivityObserver.Type
    
    init(view: AllLeaguesViewProtocol, networkService: NetworkService.Type,  networkConnectivityObserver: NetworkConnectivityObserver.Type) {
        self.view = view
        self.networkService = networkService
        self.networkConnectivityObserver = networkConnectivityObserver
    }
    
    private var allLeagueItems = [AllLeaguesItem]()
    private var filteredLeagues = [AllLeaguesItem]()
    
    func fetchLeagues(sportName: String){
        networkService.fetchLeagues(sportName: sportName) { [weak self] res in
                        
            guard let res = res, let result = res.result else {
                self?.view.disableLottie()
                self?.view.addSubview(text: "No Leagues Available.")
                return
            }
            
            self?.allLeagueItems = result
            self?.filteredLeagues = result
            
            self?.view.reloadTableView()
            self?.view.disableLottie()
            
        }
    }
    
    func checkisNetworkAvailable() -> Bool {
        return networkConnectivityObserver.getIsNetworkAvailable()
    }
    
    func getNumberOfFilteredLeagueItems() -> Int {
        return filteredLeagues.count
    }
    
    func getFilteredLeagueItem(at index: Int) -> AllLeaguesItem {
        return filteredLeagues[index]
    }
    
    func handleSearch(searchText: String) {
        if searchText.isEmpty {
            filteredLeagues = allLeagueItems
            
        } else{
            filteredLeagues = allLeagueItems.filter {
                if let currentLeagueName = $0.league_name {
                    return currentLeagueName.lowercased().contains(searchText.lowercased())
                } else{
                    return false
                }
            }
            
        }
        view.reloadTableView()
    }
    
    func handleSearcbBarCancelButtonClicked(){
        filteredLeagues = allLeagueItems
        view.reloadTableView()
    }
}
