//
//  OnboardingPresenter.swift
//  SportOn
//
//  Created by Marwan Elbahnasawy on 09/05/2023.
//

import Foundation

class OnboardingPresenter: OnboardingPresenterProtocol{
    
    private let view: OnboardingViewProtocol
    private let db: DatabaseManagerProtocol
    
    init(view: OnboardingViewProtocol, db: DatabaseManagerProtocol) {
        self.view = view
        self.db = db
    }
    
    private let onboardingItems : [OnboardingItem] = [OnboardingItem(title: "Football", description: "A game involving two teams of 11 players who try to maneuver the ball into the other team’s goal without using their hands or arms.", image: .footballplayer),
                                                                    OnboardingItem(title: "Basketball", description: "A game played by two teams of five players each, where the objective is to shoot a ball through a hoop 10 feet high.", image: .basketballplayer),
                                                                    OnboardingItem(title: "Cricket", description: "A bat-and-ball game played between two teams of 11 players, where the objective is to score runs by hitting a ball and running between wickets.", image: .cricketplayer),
                                                                    OnboardingItem(title: "Tennis", description: "A racket sport played between two players (singles) or between two teams of two players each (doubles), where the objective is to hit a ball over a net and into the opponent’s court.", image: .tennisplayer)]
    
    func scrollViewDidScroll(){
        let pageWidth = view.getCollectionViewBoundsWidth()
        let currentOffset = view.getCollectionViewOffset()
        let currentPage = Int((currentOffset.x + pageWidth / 2) / pageWidth)
        view.updatePageNumber(currentPage: currentPage)
        
        let getStartedText = currentPage == 3 ? "Get Started" : "Next"
        view.updateGetStartedButtonTitle(getStartedText: getStartedText)
    }
    
    func getStartedClicked(){
        if view.getPageControlCurrentPage() == 3{
            view.navigateToHome()
            db.setOnboardingWasShownBeforeToTrue()
        } else{
            view.updatePageNumber(currentPage: view.getPageControlCurrentPage() + 1)
            let pageWidth = view.getCollectionViewBoundsWidth()
            let currentOffset = view.getCollectionViewOffset()
            let newOffset = CGPoint(x: currentOffset.x + pageWidth, y: currentOffset.y)
            view.updateCollectionViewOffset(newOffset: newOffset)
        }
    }
    
    func getNumberOfOnboardingItems() -> Int{
        return onboardingItems.count
    }
    
    func getOnboardingItem(at index: Int) -> OnboardingItem{
        return onboardingItems[index]
    }
    
}
