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
    var teamObjects : [NSManagedObject]!
    var playerObjects : [NSManagedObject]!
    
    var delegateDeletedTeamConfirmation: DeletedTeamFromDatabaseConfirmation?
    var delegateInsertedTeamConfirmation : InsertedTeamToDatabaseConfirmation?
    
    var delegateDeletedPlayerConfirmation: DeletedPlayerFromDatabaseConfirmation?
    var delegateInsertedPlayerConfirmation : InsertedPlayerToDatabaseConfirmation?
    
    
    func insert(context: NSManagedObjectContext, item: DatabaseItem){
        
        var entity: NSEntityDescription
        var itemDB: NSManagedObject
        var fetchRequest: NSFetchRequest<NSManagedObject>
        var predicate: NSPredicate
        
        if item is TeamItemDB {
            
            let castedItem = item as! TeamItemDB
            
            fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "TeamCoreData")
            predicate = NSPredicate(format: "team_key == %d", castedItem.team_key!)
            
            fetchRequest.predicate = predicate
            
            do{
                
                teamObjects = try context.fetch(fetchRequest)
                if teamObjects.count == 0{
                    entity = NSEntityDescription.entity(forEntityName: "TeamCoreData", in: context)!
                    itemDB = NSManagedObject(entity: entity, insertInto: context)
                    
                    itemDB.setValue(castedItem.team_name, forKey: "team_name")
                    itemDB.setValue(castedItem.team_key, forKey: "team_key")
                    itemDB.setValue(castedItem.sportSelected, forKey: "sportSelected")
                    itemDB.setValue(castedItem.team_logo_string, forKey: "team_logo_string")
                    
                    if castedItem.team_logo != nil {
                        itemDB.setValue(castedItem.team_logo, forKey: "team_logo")
                    }
                }
                
            } catch let error as NSError{
                print(error.localizedDescription)
            }
            
            
            
            
        } else if item is PlayerItemDB{
            
            let castedItem = item as! PlayerItemDB
            
            fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "PlayerCoreData")
            predicate = NSPredicate(format: "player_key == %d", castedItem.player_key!)
            
            fetchRequest.predicate = predicate
            
            do{
                
                playerObjects = try context.fetch(fetchRequest)
                
                if playerObjects.count == 0{
                    entity = NSEntityDescription.entity(forEntityName: "PlayerCoreData", in: context)!
                    itemDB = NSManagedObject(entity: entity, insertInto: context)
                    
                    
                    itemDB.setValue(castedItem.player_name, forKey: "player_name")
                    itemDB.setValue(castedItem.player_key, forKey: "player_key")
                    
                    if castedItem.player_image != nil {
                        itemDB.setValue(castedItem.player_image, forKey: "player_image")
                    }
                }
                
            } catch let error as NSError{
                print(error.localizedDescription)
            }
            
            
            
        }
        
        do{
            try context.save()
            print("Successful insert")
            //delegateInsert?.insertedLeagueSuccessfully()
        } catch let error as NSError{
            print(error.localizedDescription)
        }
        
        
    }
    
    func delete(teamOrPlayer: Int, context: NSManagedObjectContext, teamOrPlayerKey: Int){
        //teamsOrPlayers = 1 for teams and = 2 for players.
        
        var fetchRequest: NSFetchRequest<NSManagedObject>
        var predicate: NSPredicate
        
        if teamOrPlayer == 1 {
            
            fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "TeamCoreData")
            predicate = NSPredicate(format: "team_key == %d", teamOrPlayerKey)
            
            fetchRequest.predicate = predicate
            
            do{
                
                teamObjects = try context.fetch(fetchRequest)
                context.delete(teamObjects[0])
                
                try context.save()
                print("Successful delete")
                delegateDeletedTeamConfirmation?.deletedTeamSuccessfully()
            } catch let error as NSError{
                print(error.localizedDescription)
            }
            
        } else if teamOrPlayer == 2{
            
            fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "PlayerCoreData")
            predicate = NSPredicate(format: "player_key == %d", teamOrPlayerKey)
            
            fetchRequest.predicate = predicate
            
            do{
                playerObjects = try context.fetch(fetchRequest)
                context.delete(playerObjects[0])
                
                try context.save()
                print("Successful delete")
                delegateDeletedPlayerConfirmation?.deletedPlayerSuccessfully()
            } catch let error as NSError{
                print(error.localizedDescription)
            }
            
        }
        
    }
    
    
    func getAll(teamsOrPlayers: Int, context: NSManagedObjectContext) -> [DatabaseItem]{
        //teamsOrPlayers = 1 for teams and = 2 for players.
        
        var fetchReq: NSFetchRequest<NSManagedObject>
        var teams: [TeamItemDB]
        var players: [PlayerItemDB]
        
        if teamsOrPlayers == 1 {
            
            teams = [TeamItemDB]()
            fetchReq = NSFetchRequest<NSManagedObject>(entityName: "TeamCoreData")
            
            
            do{
                teamObjects = try context.fetch(fetchReq)
                for team in teamObjects {
                    let team_name = team.value(forKey: "team_name") as! String
                    let team_key = team.value(forKey: "team_key") as! Int
                    let team_logo = team.value(forKey: "team_logo") as? Data
                    let sportSelected = team.value(forKey: "sportSelected")  as! String
                    let team_logo_string = team.value(forKey: "team_logo_string") as! String
                    
                    
                    teams.append(TeamItemDB(team_name: team_name, team_logo: team_logo, team_logo_string: team_logo_string, team_key: team_key, sportSelected: sportSelected))
                    
                }
                
                return teams
                
            } catch let error as NSError{
                print(error.localizedDescription)
            }
            
            
        } else if teamsOrPlayers == 2{
            
            players = [PlayerItemDB]()
            fetchReq = NSFetchRequest<NSManagedObject>(entityName: "PlayerCoreData")
            
            do{
                playerObjects = try context.fetch(fetchReq)
                for player in playerObjects {
                    let player_name = player.value(forKey: "player_name") as! String
                    let player_key = player.value(forKey: "player_key") as! Int
                    let player_image = player.value(forKey: "player_image") as? Data
                    
                    players.append(PlayerItemDB(player_key: player_key, player_name: player_name, player_image: player_image))
                    
                }
                
                return players
                
            } catch let error as NSError{
                print(error.localizedDescription)
            }
            
        }
        
        
        return [DatabaseItem]()
        
    }
    
    
}
