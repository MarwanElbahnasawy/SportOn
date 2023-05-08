//
//  OnboardingViewController.swift
//  SportOn
//
//  Created by Marwan Elbahnasawy on 06/05/2023.
//

import UIKit

private let reuseIdentifier = "CellOnboarding"

class OnboardingViewController: MyBaseViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var getStartedOutlet: UIButton!
    
   
    let db = DatabaseManager.shared
    
    private let onboardingItems : [OnboardingItem] = [OnboardingItem(title: "Football", description: "A game involving two teams of 11 players who try to maneuver the ball into the other team’s goal without using their hands or arms.", image: UIImage(named: "footballplayer")!),
                                                      OnboardingItem(title: "Basketball", description: "A game played by two teams of five players each, where the objective is to shoot a ball through a hoop 10 feet high.", image: UIImage(named: "basketballplayer")!),
                                                      OnboardingItem(title: "Cricket", description: "A bat-and-ball game played between two teams of 11 players, where the objective is to score runs by hitting a ball and running between wickets.", image: UIImage(named: "cricketplayer")!),
                                                      OnboardingItem(title: "Tennis", description: "A racket sport played between two players (singles) or between two teams of two players each (doubles), where the objective is to hit a ball over a net and into the opponent’s court.", image: UIImage(named: "tennisplayer")!)]
    
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
        
        return onboardingItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! OnboardingCollectionViewCell
        
        
        cell.labelTitle.text = onboardingItems[indexPath.row].title
        cell.labelDesc.text = onboardingItems[indexPath.row].description
        cell.imgView.image = onboardingItems[indexPath.row].image
        
        cell.labelDesc.textAlignment = .center
        cell.labelDesc.baselineAdjustment = .alignCenters
        
        if UIDevice.current.userInterfaceIdiom == .pad{
        
            cell.labelTitle.font = UIFont.systemFont(ofSize: 50)
            cell.labelDesc.font = UIFont.systemFont(ofSize: 32)

            cell.labelTitle.removeConstraint(cell.oldConstraintTopTitle)

            let newTopConstraint = NSLayoutConstraint(
                item: cell.labelTitle,
                attribute: .top,
                relatedBy: .equal,
                toItem: cell.imgView,
                attribute: .bottom,
                multiplier: 0.95,
                constant: 0
            )

            cell.contentView.addConstraint(newTopConstraint)
            
        }
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.bounds.size
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageWidth = collectionView.bounds.width
        let currentPage = Int((collectionView.contentOffset.x + pageWidth / 2) / pageWidth)
        pageControl.currentPage = currentPage
        
        if currentPage == 3{
            getStartedOutlet.setTitle("Get Started", for: .normal)
            
        } else{
            
            getStartedOutlet.setTitle("Next", for: .normal)
           
            
        }
        
    }
    
    
    @IBAction func getStarted(_ sender: Any) {
        if pageControl.currentPage == 3{
            performSegue(withIdentifier: "segueOnboardingToHome", sender: self)
            db.setOnboardingWasShownBeforeToTrue()
        } else{
            pageControl.currentPage += 1
            let pageWidth = collectionView.bounds.width
            let newOffset = CGPoint(x: collectionView.contentOffset.x + pageWidth, y: collectionView.contentOffset.y)
            collectionView.setContentOffset(newOffset, animated: true)
        }
    }
    
}
