//
//  DatabaseManager.swift
//  SportOn
//
//  Created by Marwan Elbahnasawy on 04/05/2023.
//

import UIKit
import CoreData

class DatabaseManager {
    static let shared = DatabaseManager()
    
    var context: NSManagedObjectContext!
    var teamObjects : [NSManagedObject]!
    var playerObjects : [NSManagedObject]!
    var onboardingCheckerObjects : [NSManagedObject]!
    
    var delegateDeletedTeamConfirmation: DeletedTeamFromDatabaseConfirmation?
    var delegateInsertedTeamConfirmation : InsertedTeamToDatabaseConfirmation?
    
    var delegateDeletedPlayerConfirmation: DeletedPlayerFromDatabaseConfirmation?
    var delegateInsertedPlayerConfirmation : InsertedPlayerToDatabaseConfirmation?
    
    init(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        context = appDelegate.persistentContainer.viewContext
    }
    
    func insert(item: DatabaseItem){
        
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
                    itemDB.setValue(castedItem.player_image_string, forKey: "player_image_string")
                    
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
    
    func deleteTeam(teamKey: Int){
        
        var fetchRequest: NSFetchRequest<NSManagedObject>
        var predicate: NSPredicate
            
            fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "TeamCoreData")
            predicate = NSPredicate(format: "team_key == %d", teamKey)
            
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
            
        
    }
    
    func deletePlayer(playerKey: Int){
        
        var fetchRequest: NSFetchRequest<NSManagedObject>
        var predicate: NSPredicate
        
            
            fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "PlayerCoreData")
            predicate = NSPredicate(format: "player_key == %d", playerKey)
            
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
    
    
    func getAllTeams() -> [DatabaseItem]{
        
        var fetchReq: NSFetchRequest<NSManagedObject>
        var teams: [TeamItemDB]
         
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
            
        
        
        return [DatabaseItem]()
        
    }
    
    func getAllPlayers() -> [DatabaseItem]{
        
        var fetchReq: NSFetchRequest<NSManagedObject>
        var players: [PlayerItemDB]
        
            
            players = [PlayerItemDB]()
            fetchReq = NSFetchRequest<NSManagedObject>(entityName: "PlayerCoreData")
            
            do{
                playerObjects = try context.fetch(fetchReq)
                for player in playerObjects {
                    let player_name = player.value(forKey: "player_name") as! String
                    let player_key = player.value(forKey: "player_key") as! Int
                    let player_image = player.value(forKey: "player_image") as? Data
                    let player_image_string = player.value(forKey: "player_image_string") as! String
                                        
                    players.append(PlayerItemDB(player_key: player_key, player_name: player_name, player_image: player_image, player_image_string: player_image_string))
                    
                }
                
                return players
                
            } catch let error as NSError{
                print(error.localizedDescription)
            }
            
        
        
        
        return [DatabaseItem]()
        
    }
    
    func setOnboardingWasShownBeforeToTrue(){
        var entity: NSEntityDescription
        var itemDB: NSManagedObject
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "OnboardingCheckerCoreData")
        
        do{
            onboardingCheckerObjects = try context.fetch(fetchRequest)
            
            if onboardingCheckerObjects.count == 0 {
                entity = NSEntityDescription.entity(forEntityName: "OnboardingCheckerCoreData", in: context)!
                
                itemDB = NSManagedObject(entity: entity, insertInto: context)
                itemDB.setValue(true, forKey: "isShownBefore")
                try context.save()
                print("Successful insert")
            }
            
        }
        catch let error as NSError{
            print(error.localizedDescription)
        }
    }
    
    func checkIfOnboardingWasShownBefore() -> Bool{
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "OnboardingCheckerCoreData")
        
        do{
            onboardingCheckerObjects = try context.fetch(fetchRequest)
            
            if onboardingCheckerObjects.count == 0 {
                return false
            } else{
                return true
            }
            
        }
        catch let error as NSError{
            print(error.localizedDescription)
        }
        return false
    }
    
    func checkIfTeamExists(teamKey: Int) -> Bool{
        
        var fetchRequest: NSFetchRequest<NSManagedObject>
        var predicate: NSPredicate

            fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "TeamCoreData")
            predicate = NSPredicate(format: "team_key == %d", teamKey)
            
            fetchRequest.predicate = predicate
            
            do{
                teamObjects = try context.fetch(fetchRequest)
                
                if teamObjects.count == 0 {
                    return false
                } else{
                    return true
                }
                
            }
            catch let error as NSError{
                print(error.localizedDescription)
            }
        
        
        return false
    }
    
    func checkIfPlayerExists(playerKey: Int) -> Bool{
        
        var fetchRequest: NSFetchRequest<NSManagedObject>
        var predicate: NSPredicate
        
            fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "PlayerCoreData")
            predicate = NSPredicate(format: "player_key == %d", playerKey)
            
            fetchRequest.predicate = predicate
            
            do{
                playerObjects = try context.fetch(fetchRequest)
                
                if playerObjects.count == 0 {
                    return false
                } else{
                    return true
                }
                
            }
            catch let error as NSError{
                print(error.localizedDescription)
            }
        
        return false
    }
    
}
