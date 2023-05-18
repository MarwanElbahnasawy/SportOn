//
//  OnboardingPresenterProtocol.swift
//  SportOn
//
//  Created by Marwan Elbahnasawy on 09/05/2023.
//

import Foundation

protocol OnboardingPresenterProtocol: AnyObject{
    func scrollViewDidScroll()
    func getStartedClicked()
    func getNumberOfOnboardingItems() -> Int
    func getOnboardingItem(at index: Int) -> OnboardingItem
}
