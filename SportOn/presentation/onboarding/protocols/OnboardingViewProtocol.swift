//
//  OnboardingViewProtocol.swift
//  SportOn
//
//  Created by Marwan Elbahnasawy on 09/05/2023.
//

import Foundation

protocol OnboardingViewProtocol: AnyObject {
    func updatePageNumber(currentPage: Int)
    func updateGetStartedButtonTitle(getStartedText: String)
    func updateCollectionViewOffset(newOffset: CGPoint)
    func navigateToHome()
    func getPageControlCurrentPage() -> Int
    func getCollectionViewBoundsWidth() -> CGFloat
    func getCollectionViewOffset() -> CGPoint
}
