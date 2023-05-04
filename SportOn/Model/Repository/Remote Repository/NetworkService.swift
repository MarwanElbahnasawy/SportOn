//
//  NetworkService.swift
//  MVC
//
//  Created by Marwan Elbahnasawy on 02/05/2023.
//

import Foundation

protocol MovieProtocol {
    static func fetchLeagues (sportName: String, complitionHandler: @escaping (ResultLeagues?)->Void)
}

class NetworkService: MovieProtocol{
    
    static func fetchLeagues(sportName: String ,complitionHandler: @escaping (ResultLeagues?)->Void) {
        let url = URL(string: "https://apiv2.allsportsapi.com/\(sportName)/?met=Leagues&APIkey=5b498705a93e8796ef9d57dc29036620ab44a54d95824fff9fa19c7c5509cb82")
        guard let newUrl = url else{
            return
        }
        let req = URLRequest(url: newUrl)
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: req) {data, response, error in
            do{
                let res = try JSONDecoder().decode(ResultLeagues.self, from: data!)
                complitionHandler(res)
            } catch let error {
                print(error.localizedDescription)
                
            }
        }
        task.resume()
        
    }
    
    static func fetchResultUpcoming(sportName: String, leagueID: String ,complitionHandler: @escaping (ResultLeagueDetailsUpcoming?)->Void) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        let currentDate = Date()
        let fromDateString = dateFormatter.string(from: currentDate)

        let toDate = Calendar.current.date(byAdding: .day, value: 30, to: currentDate)!
        let toDateString = dateFormatter.string(from: toDate)

        let url = URL(string: "https://apiv2.allsportsapi.com/\(sportName)/?met=Fixtures&APIkey=5b498705a93e8796ef9d57dc29036620ab44a54d95824fff9fa19c7c5509cb82&from=\(fromDateString)&to=\(toDateString)&leagueId=\(leagueID)")

        guard let newUrl = url else{
            return
        }
        let req = URLRequest(url: newUrl)
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: req) {data, response, error in
            do{
                let res = try JSONDecoder().decode(ResultLeagueDetailsUpcoming.self, from: data!)
                complitionHandler(res)
            } catch let error {
                print(error.localizedDescription)
                
            }
        }
        task.resume()
        
    }
    
    static func fetchResultUpcomingTennis(sportName: String, leagueID: String ,complitionHandler: @escaping (ResultLeagueDetailsUpcomingTennis?)->Void) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        let currentDate = Date()
        let fromDateString = dateFormatter.string(from: currentDate)

        let toDate = Calendar.current.date(byAdding: .day, value: 30, to: currentDate)!
        let toDateString = dateFormatter.string(from: toDate)

        let url = URL(string: "https://apiv2.allsportsapi.com/\(sportName)/?met=Fixtures&APIkey=5b498705a93e8796ef9d57dc29036620ab44a54d95824fff9fa19c7c5509cb82&from=\(fromDateString)&to=\(toDateString)&leagueId=\(leagueID)")

        guard let newUrl = url else{
            return
        }
        let req = URLRequest(url: newUrl)
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: req) {data, response, error in
            do{
                let res = try JSONDecoder().decode(ResultLeagueDetailsUpcomingTennis.self, from: data!)
                complitionHandler(res)
            } catch let error {
                print(error.localizedDescription)
                
            }
        }
        task.resume()
        
    }
    
    static func fetchResultLatest(sportName: String, leagueId: String ,complitionHandler: @escaping (ResultLeagueDetailsLatest?)->Void) {
                
        let url = URL(string: "https://apiv2.allsportsapi.com/\(sportName)/?met=Livescore&APIkey=5b498705a93e8796ef9d57dc29036620ab44a54d95824fff9fa19c7c5509cb82&leagueId=\(leagueId)")

        guard let newUrl = url else{
            return
        }
        let req = URLRequest(url: newUrl)
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: req) {data, response, error in
            do{
                let res = try JSONDecoder().decode(ResultLeagueDetailsLatest.self, from: data!)
                
                complitionHandler(res)
            } catch let error {
                print(error.localizedDescription)
                
            }
        }
        task.resume()
        
    }
    
    static func fetchResultLatestTennis(sportName: String, leagueId: String ,complitionHandler: @escaping (ResultLeagueDetailsLatestTennis?)->Void) {
                
        let url = URL(string: "https://apiv2.allsportsapi.com/\(sportName)/?met=Livescore&APIkey=5b498705a93e8796ef9d57dc29036620ab44a54d95824fff9fa19c7c5509cb82&leagueId=\(leagueId)")

        guard let newUrl = url else{
            return
        }
        let req = URLRequest(url: newUrl)
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: req) {data, response, error in
            do{
                let res = try JSONDecoder().decode(ResultLeagueDetailsLatestTennis.self, from: data!)
                
                complitionHandler(res)
            } catch let error {
                print(error.localizedDescription)
                
            }
        }
        task.resume()
        
    }
    
    static func fetchTeams(sportName: String, leagueId: String ,complitionHandler: @escaping (ResultLeagueTeams?)->Void) {

        let url = URL(string: "https://apiv2.allsportsapi.com/\(sportName)/?&met=Teams&APIkey=5b498705a93e8796ef9d57dc29036620ab44a54d95824fff9fa19c7c5509cb82&leagueId=\(leagueId)")

        guard let newUrl = url else{
            return
        }
        let req = URLRequest(url: newUrl)
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: req) {data, response, error in
            do{
                let res = try JSONDecoder().decode(ResultLeagueTeams.self, from: data!)
                complitionHandler(res)
            } catch let error {
                print(error.localizedDescription)
                
            }
        }
        task.resume()
        
    }
    
    static func fetchPlayers(sportName: String, leagueId: String ,complitionHandler: @escaping (ResultLeaguePlayersTennis?)->Void) {

        let url = URL(string: "https://apiv2.allsportsapi.com/\(sportName)/?&met=Players&APIkey=5b498705a93e8796ef9d57dc29036620ab44a54d95824fff9fa19c7c5509cb82&leagueId=\(leagueId)")

        guard let newUrl = url else{
            return
        }
        let req = URLRequest(url: newUrl)
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: req) {data, response, error in
            do{
                let res = try JSONDecoder().decode(ResultLeaguePlayersTennis.self, from: data!)
                complitionHandler(res)
            } catch let error {
                print(error.localizedDescription)
                
            }
        }
        task.resume()
        
    }
    
    static func fetchTeam(sportName: String, teamId: String ,complitionHandler: @escaping (ResultTeamDetails?)->Void) {
        
        let url = URL(string: "https://apiv2.allsportsapi.com/\(sportName)/?&met=Teams&APIkey=5b498705a93e8796ef9d57dc29036620ab44a54d95824fff9fa19c7c5509cb82&teamId=\(teamId)")

        guard let newUrl = url else{
            return
        }
        let req = URLRequest(url: newUrl)
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: req) {data, response, error in
            do{
                let res = try JSONDecoder().decode(ResultTeamDetails.self, from: data!)
                complitionHandler(res)
            } catch let error {
                print(error.localizedDescription)
                
            }
        }
        task.resume()
        
    }
    
    static func fetchPlayer(sportName: String, playerId: String ,complitionHandler: @escaping (ResultPlayerDetailsTennis?)->Void) {
        
        let url = URL(string: "https://apiv2.allsportsapi.com/\(sportName)/?&met=Teams&APIkey=5b498705a93e8796ef9d57dc29036620ab44a54d95824fff9fa19c7c5509cb82&teamId=\(playerId)")

        guard let newUrl = url else{
            return
        }
        let req = URLRequest(url: newUrl)
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: req) {data, response, error in
            do{
                let res = try JSONDecoder().decode(ResultPlayerDetailsTennis.self, from: data!)
                complitionHandler(res)
            } catch let error {
                print(error.localizedDescription)
                
            }
        }
        task.resume()
        
    }
    
    
}

