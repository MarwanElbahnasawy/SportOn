//
//  DatabaseManager.swift
//  SportOn
//
//  Created by Marwan Elbahnasawy on 04/05/2023.
//

import Foundation
import CoreData

class DatabaseManager {
    static let shared = DatabaseManager()
    
    var context: NSManagedObjectContext!
    var leagueObjects : [NSManagedObject]!
    
    var delegateDelete: DeletedLeague?
    var delegateInsert : InsertedLeague?

    
    func insertLeagueToDB(context: NSManagedObjectContext, league: LeagueItemDB){
        
        let entity = NSEntityDescription.entity(forEntityName: "League", in: context)!
        
        let leagueDB = NSManagedObject(entity: entity, insertInto: context)
        
        leagueDB.setValue(league.league_name, forKey: "league_name")
        leagueDB.setValue(league.league_key, forKey: "league_key")
        
        if league.league_logo != nil {
            leagueDB.setValue(league.league_logo, forKey: "league_logo")
        }
        
        do{
            try context.save()
            print("Successful insert")
            //delegateInsert?.insertedLeagueSuccessfully()
        } catch let error as NSError{
            print(error.localizedDescription)
        }
        
        
    }
    
    func deleteLeague(context: NSManagedObjectContext, league: LeagueItemDB){
        
        let fetchReq = NSFetchRequest<NSManagedObject>(entityName: "League")
        let predicate = NSPredicate(format: "league_key == %@", league.league_key!)
        fetchReq.predicate = predicate
        
        do{
            leagueObjects = try context.fetch(fetchReq)
            context.delete(leagueObjects[0])
            try context.save()
            print("Successful delete")
            //delegateDelete?.deletedLeagueSuccessfully()
        } catch let error as NSError{
            print(error.localizedDescription)
        }
       
    }
    
    func getLeaguesFromDB(context: NSManagedObjectContext) -> [LeagueItemDB]{
        
        var leagues = [LeagueItemDB]()
        
        let fetchReq = NSFetchRequest<NSManagedObject>(entityName: "League")
        do{
            leagueObjects = try context.fetch(fetchReq)

            for league in leagueObjects {
                let league_name = league.value(forKey: "league_name") as! String
                let league_key = league.value(forKey: "league_key") as! Int
                let league_logo = league.value(forKey: "league_logo") as? Data
                
                leagues.append(LeagueItemDB(league_name: league_name, league_logo: league_logo, league_key: league_key))

            }
            
        } catch let error as NSError{
            print(error.localizedDescription)
        }
        
        
        return leagues
        
    }
    
    func checkIfDBIsEmpty(context: NSManagedObjectContext) -> Bool{
        
        var isEmpty = true
        
        let fetchReq = NSFetchRequest<NSManagedObject>(entityName: "Employee")
        do{
            leagueObjects = try context.fetch(fetchReq)
            
            if (leagueObjects.count > 0){
                isEmpty = false
            }
            
        } catch let error as NSError{
            print(error.localizedDescription)
        }
        
        return isEmpty
    }

    
}
