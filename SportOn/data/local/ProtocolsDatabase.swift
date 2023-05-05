//
//  ProtocolsDatabase.swift
//  SportOn
//
//  Created by Marwan Elbahnasawy on 04/05/2023.
//

import Foundation

protocol InsertedTeamToDatabaseConfirmation {
    func insertedTeamSuccessfully()
}

protocol DeletedTeamFromDatabaseConfirmation {
    func deletedTeamSuccessfully()
}

protocol InsertedPlayerToDatabaseConfirmation {
    func insertedPlayerSuccessfully()
}

protocol DeletedPlayerFromDatabaseConfirmation {
    func deletedPlayerSuccessfully()
}

protocol DatabaseItem{}
