//
//  OnboardingViewController.swift
//  SportOn
//
//  Created by Marwan Elbahnasawy on 06/05/2023.
//

import UIKit

private let reuseIdentifier = "CellOnboarding"

class OnboardingViewController: MyBaseViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, OnboardingViewProtocol {
    
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var getStartedOutlet: UIButton!
    
    private lazy var presenter: OnboardingPresenterProtocol = {
        return OnboardingPresenter(view: self, db: db)
    }()
    
    let db = DatabaseManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if UIDevice.current.userInterfaceIdiom == .pad{
            getStartedOutlet.titleLabel?.font = UIFont.systemFont(ofSize: 44, weight: .bold)
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.getNumberOfOnboardingItems()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! OnboardingCollectionViewCell
        let currentOnboardingItem = presenter.getOnboardingItem(at: indexPath.row)
        cell.configure(onboardingItem: currentOnboardingItem)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.bounds.size
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        presenter.scrollViewDidScroll()
    }
    
    @IBAction func getStartedClicked(_ sender: Any) {
        presenter.getStartedClicked()
    }
    
    func navigateToHome() {
        performSegue(withIdentifier: "segueOnboardingToHome", sender: self)
    }
    
    func getPageControlCurrentPage() -> Int {
        return pageControl.currentPage
    }
    
    func getCollectionViewOffset() -> CGPoint {
        return CGPoint(x: collectionView.contentOffset.x, y: collectionView.contentOffset.y)
    }
    
    func getCollectionViewBoundsWidth() -> CGFloat {
        return collectionView.bounds.width
    }
    
    func updatePageNumber(currentPage: Int){
        pageControl.currentPage = currentPage
    }
    
    func updateGetStartedButtonTitle(getStartedText: String){
        getStartedOutlet.setTitle(getStartedText, for: .normal)
    }
    
    func updateCollectionViewOffset(newOffset: CGPoint){
        collectionView.setContentOffset(newOffset, animated: true)
    }
    
}
