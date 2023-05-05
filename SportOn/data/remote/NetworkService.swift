//
//  NetworkService.swift
//  SportOn
//
//  Created by Marwan Elbahnasawy on 02/05/2023.
//

import Foundation

class NetworkService{
    
    // MARK: Generic fetching data method

    static func fetchData(met: String, sportName: String, additionalParam: [String: String] ,complitionHandler: @escaping (Data?, URLResponse?, Error?)->Void) {
        var urlString = "https://apiv2.allsportsapi.com/\(sportName)/?met=\(met)&APIkey=\(Constants.apiKey)"
        
        for (key,value) in additionalParam{
            urlString += "&\(key)=\(value)"
        }
        
        guard let url = URL(string: urlString) else{
            return
        }
        
        let req = URLRequest(url: url)
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: req, completionHandler: complitionHandler)
        task.resume()
    }
    
    // MARK: fetching all Leagues

    static func fetchLeagues(sportName: String ,complitionHandler: @escaping (ResultLeagues?)->Void) {
        
        fetchData(met: "Leagues", sportName: sportName, additionalParam: [:]) { data, _, error in
            do{
                let res = try JSONDecoder().decode(ResultLeagues.self, from: data!)
                complitionHandler(res)
            } catch let error {
                print(error.localizedDescription)
                
            }
        }
        
        
    }
    
    // MARK: fetching upcoming for football/basketball/cricket

    static func fetchResultUpcoming(sportName: String, leagueID: String ,complitionHandler: @escaping (ResultLeagueDetailsUpcoming?)->Void) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        let currentDate = Date()
        let fromDateString = dateFormatter.string(from: currentDate)

        let toDate = Calendar.current.date(byAdding: .day, value: 14, to: currentDate)!
        let toDateString = dateFormatter.string(from: toDate)
        
        fetchData(met: "Fixtures", sportName: sportName, additionalParam: ["from":fromDateString, "to":toDateString, "leagueId":leagueID]) { data, _, error in
            do{
                let res = try JSONDecoder().decode(ResultLeagueDetailsUpcoming.self, from: data!)
                complitionHandler(res)
            } catch let error {
                print(error.localizedDescription)
                
            }
        }
        
    }
    
    // MARK: fetching upcoming for tennis

    static func fetchResultUpcomingTennis(sportName: String, leagueID: String ,complitionHandler: @escaping (ResultLeagueDetailsUpcomingTennis?)->Void) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        let currentDate = Date()
        let fromDateString = dateFormatter.string(from: currentDate)

        let toDate = Calendar.current.date(byAdding: .day, value: 14, to: currentDate)!
        let toDateString = dateFormatter.string(from: toDate)

        fetchData(met: "Fixtures", sportName: sportName, additionalParam: ["from":fromDateString, "to":toDateString, "leagueId":leagueID ]) { data, _, error in
            do{
                let res = try JSONDecoder().decode(ResultLeagueDetailsUpcomingTennis.self, from: data!)
                complitionHandler(res)
            } catch let error {
                print(error.localizedDescription)
                
            }
        }
        
    }
    
    // MARK: fetching live results for football/basketball/cricket

    static func fetchResultLatest(sportName: String, leagueId: String ,complitionHandler: @escaping (ResultLeagueDetailsLatest?)->Void) {

        fetchData(met: "Livescore", sportName: sportName, additionalParam: ["leagueId":leagueId ]) { data, _, error in
            do{
                let res = try JSONDecoder().decode(ResultLeagueDetailsLatest.self, from: data!)
                
                complitionHandler(res)
            } catch let error {
                print(error.localizedDescription)
                
            }
        }
        
    }
    
    // MARK: fetching live results for tennis

    static func fetchResultLatestTennis(sportName: String, leagueId: String ,complitionHandler: @escaping (ResultLeagueDetailsLatestTennis?)->Void) {
                
        
        fetchData(met: "Livescore", sportName: sportName, additionalParam: ["leagueId":leagueId ]) { data, _, error in
            do{
                let res = try JSONDecoder().decode(ResultLeagueDetailsLatestTennis.self, from: data!)
                
                complitionHandler(res)
            } catch let error {
                print(error.localizedDescription)
                
            }
        }
        
    }
    
    // MARK: fetching all teams for a specific league for football/basketball/cricket

    static func fetchTeams(sportName: String, leagueId: String ,complitionHandler: @escaping (ResultLeagueTeams?)->Void) {

        fetchData(met: "Teams", sportName: sportName, additionalParam: ["leagueId":leagueId ]) { data, _, error in
            do{
                let res = try JSONDecoder().decode(ResultLeagueTeams.self, from: data!)
                complitionHandler(res)
            } catch let error {
                print(error.localizedDescription)
                
            }
        }
        
    }
    
    // MARK: fetching all players for a specific league for tennis

    static func fetchPlayers(sportName: String, leagueId: String ,complitionHandler: @escaping (ResultLeaguePlayersTennis?)->Void) {

        fetchData(met: "Players", sportName: sportName, additionalParam: ["leagueId":leagueId ]) { data, _, error in
            do{
                let res = try JSONDecoder().decode(ResultLeaguePlayersTennis.self, from: data!)
                complitionHandler(res)
            } catch let error {
                print(error.localizedDescription)
                
            }
        }
        
    }
    
    // MARK: fetching team details for football/basketball/cricket

    static func fetchTeam(sportName: String, teamId: String ,complitionHandler: @escaping (ResultTeamDetails?)->Void) {
        
        fetchData(met: "Teams", sportName: sportName, additionalParam: ["teamId":teamId ]) { data, _, error in
            do{
                let res = try JSONDecoder().decode(ResultTeamDetails.self, from: data!)
                complitionHandler(res)
            } catch let error {
                print(error.localizedDescription)
                
            }
        }
        
    }
    
    // MARK: fetching player details for football/basketball/cricket

    static func fetchPlayer(sportName: String, playerId: String ,complitionHandler: @escaping (ResultPlayerDetailsTennis?)->Void) {
        
        fetchData(met: "Players", sportName: sportName, additionalParam: ["playerId":playerId ]) { data, _, error in
            do{
                let res = try JSONDecoder().decode(ResultPlayerDetailsTennis.self, from: data!)
                complitionHandler(res)
            } catch let error {
                print(error.localizedDescription)
                
            }
        }
        
    }
    
    
}

