//
//  NetworkService.swift
//  MVC
//
//  Created by Marwan Elbahnasawy on 02/05/2023.
//

import Foundation

protocol MovieProtocol {
    static func fetchResult (league: String, complitionHandler: @escaping (FootballLeaguesResult?)->Void)
}

class NetworkService: MovieProtocol{
    
    static func fetchResult(league: String ,complitionHandler: @escaping (FootballLeaguesResult?)->Void) {
        let url = URL(string: "https://apiv2.allsportsapi.com/\(league)/?met=Leagues&APIkey=5b498705a93e8796ef9d57dc29036620ab44a54d95824fff9fa19c7c5509cb82")
        guard let newUrl = url else{
            return
        }
        let req = URLRequest(url: newUrl)
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: req) {data, response, error in
            do{
                let res = try JSONDecoder().decode(FootballLeaguesResult.self, from: data!)
                complitionHandler(res)
            } catch let error {
                print(error.localizedDescription)
                
            }
        }
        task.resume()
        
    }
    
    
}

