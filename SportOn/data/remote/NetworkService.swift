//
//  NetworkService.swift
//  SportOn
//
//  Created by Marwan Elbahnasawy on 02/05/2023.
//

import Foundation

class NetworkService{
    
    // MARK: Generic fetching data method

    static func fetchData(met: String, sportName: String, additionalParam: [String: String] ,completionHandler: @escaping (Data?, URLResponse?, Error?)->Void) {
        var urlString = "https://apiv2.allsportsapi.com/\(sportName)/?met=\(met)&APIkey=\(Constants.apiKey)"
        
        for (key,value) in additionalParam{
            urlString += "&\(key)=\(value)"
        }
        
        guard let url = URL(string: urlString) else{
            return
        }
        
        let req = URLRequest(url: url)
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: req, completionHandler: completionHandler)
        task.resume()
    }
    
    // MARK: fetching all Leagues

    static func fetchLeagues(sportName: String ,completionHandler: @escaping (ResultLeagues?)->Void) {
        
        fetchData(met: "Leagues", sportName: sportName, additionalParam: [:]) { data, _, error in
            do{
                guard let data = data else {return}
                let res = try JSONDecoder().decode(ResultLeagues.self, from: data)
                completionHandler(res)
            } catch let error {
                completionHandler(nil)
                print(error.localizedDescription)
                
            }
        }
        
        
    }
    
    // MARK: fetching upcoming for football/basketball/cricket

    static func fetchResultUpcoming(sportName: String, leagueID: String ,completionHandler: @escaping (ResultLeagueDetailsUpcoming?)->Void) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        let currentDate = Date()
        let fromDateString = dateFormatter.string(from: currentDate)

        let toDate = Calendar.current.date(byAdding: .day, value: 14, to: currentDate)!
        let toDateString = dateFormatter.string(from: toDate)
        
        fetchData(met: "Fixtures", sportName: sportName, additionalParam: ["from":fromDateString, "to":toDateString, "leagueId":leagueID]) { data, _, error in
            do{
                guard let data = data else {return}
                let res = try JSONDecoder().decode(ResultLeagueDetailsUpcoming.self, from: data)
                completionHandler(res)
            } catch let error {
                completionHandler(nil)
                print(error.localizedDescription)
                
            }
        }
        
    }
    
    // MARK: fetching upcoming for tennis

    static func fetchResultUpcomingTennis(sportName: String, leagueID: String ,completionHandler: @escaping (ResultLeagueDetailsUpcomingTennis?)->Void) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        let currentDate = Date()
        let fromDateString = dateFormatter.string(from: currentDate)

        let toDate = Calendar.current.date(byAdding: .day, value: 14, to: currentDate)!
        let toDateString = dateFormatter.string(from: toDate)

        fetchData(met: "Fixtures", sportName: sportName, additionalParam: ["from":fromDateString, "to":toDateString, "leagueId":leagueID ]) { data, _, error in
            do{
                guard let data = data else {return}
                let res = try JSONDecoder().decode(ResultLeagueDetailsUpcomingTennis.self, from: data)
                completionHandler(res)
            } catch let error {
                completionHandler(nil)
                print(error.localizedDescription)
                
            }
        }
        
    }
    
    // MARK: fetching live results for football/basketball/cricket

    static func fetchResultLatest(sportName: String, leagueId: String ,completionHandler: @escaping (ResultLeagueDetailsLatest?)->Void) {

        fetchData(met: "Livescore", sportName: sportName, additionalParam: ["leagueId":leagueId ]) { data, _, error in
            do{
                guard let data = data else {return}
                let res = try JSONDecoder().decode(ResultLeagueDetailsLatest.self, from: data)
                completionHandler(res)
            } catch let error {
                completionHandler(nil)
                print(error.localizedDescription)
                
            }
        }
        
    }
    
    // MARK: fetching live results for tennis

    static func fetchResultLatestTennis(sportName: String, leagueId: String ,completionHandler: @escaping (ResultLeagueDetailsLatestTennis?)->Void) {
                
        
        fetchData(met: "Livescore", sportName: sportName, additionalParam: ["leagueId":leagueId ]) { data, _, error in
            do{
                guard let data = data else {return}
                let res = try JSONDecoder().decode(ResultLeagueDetailsLatestTennis.self, from: data)
                
                completionHandler(res)
            } catch let error {
                completionHandler(nil)
                print(error.localizedDescription)
                
            }
        }
        
    }
    
    // MARK: fetching all teams for a specific league for football/basketball/cricket

    static func fetchTeams(sportName: String, leagueId: String ,completionHandler: @escaping (ResultLeagueTeams?)->Void) {

        fetchData(met: "Teams", sportName: sportName, additionalParam: ["leagueId":leagueId ]) { data, _, error in
            do{
                guard let data = data else {return}
                let res = try JSONDecoder().decode(ResultLeagueTeams.self, from: data)
                completionHandler(res)
            } catch let error {
                completionHandler(nil)
                print(error.localizedDescription)
                
            }
        }
        
    }
    
    // MARK: fetching all players for a specific league for tennis

    static func fetchPlayers(sportName: String, leagueId: String ,completionHandler: @escaping (ResultLeaguePlayersTennis?)->Void) {

        fetchData(met: "Players", sportName: sportName, additionalParam: ["leagueId":leagueId ]) { data, _, error in
            do{
                guard let data = data else {return}
                let res = try JSONDecoder().decode(ResultLeaguePlayersTennis.self, from: data)
                completionHandler(res)
            } catch let error {
                completionHandler(nil)
                print(error.localizedDescription)
                
            }
        }
        
    }
    
    // MARK: fetching team details for football/basketball/cricket

    static func fetchTeam(sportName: String, teamId: String ,completionHandler: @escaping (ResultTeamDetails?)->Void) {
        
        fetchData(met: "Teams", sportName: sportName, additionalParam: ["teamId":teamId ]) { data, _, error in
            do{
                guard let data = data else {return}
                let res = try JSONDecoder().decode(ResultTeamDetails.self, from: data)
                completionHandler(res)
            } catch let error {
                completionHandler(nil)
                print(error.localizedDescription)
                
            }
        }
        
    }
    
    // MARK: fetching player details for football/basketball/cricket

    static func fetchPlayer(sportName: String, playerId: String ,completionHandler: @escaping (ResultPlayerDetailsTennis?)->Void) {
        
        fetchData(met: "Players", sportName: sportName, additionalParam: ["playerId":playerId ]) { data, _, error in
            do{
                guard let data = data else {return}
                let res = try JSONDecoder().decode(ResultPlayerDetailsTennis.self, from: data)
                completionHandler(res)
            } catch let error {
                completionHandler(nil)
                print(error.localizedDescription)
                
            }
        }
        
    }
    
    
}

