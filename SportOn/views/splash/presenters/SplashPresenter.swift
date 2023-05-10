//
//  SplashPresenter.swift
//  SportOn
//
//  Created by Marwan Elbahnasawy on 09/05/2023.
//

import Foundation

class SplashPresenter: SplashPresenterProtocol{
    
    private let view: SplashViewProtocol
    private let db: DatabaseManager
    
    init(view: SplashViewProtocol, db: DatabaseManager) {
        self.view = view
        self.db = db
    }
    
    func checkIfOnboardingWasShownBefore() -> Bool{
        return db.checkIfOnboardingWasShownBefore()
    }
    
}
