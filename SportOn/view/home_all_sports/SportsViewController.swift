//
//  SportsViewController.swift
//  SportOn
//
//  Created by Marwan Elbahnasawy on 02/05/2023.
//

import UIKit

class SportsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let sportsItems : [SportItem] = [SportItem(title: "Football", image: UIImage(named: "football_square")!), SportItem(title: "Basketball", image: UIImage(named: "basketball_square")!), SportItem(title: "Cricket", image: UIImage(named: "cricket_square")! ),SportItem(title: "Tennis", image: UIImage(named: "tennis_square")!) ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Sports"
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sportsItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "sportsCellHomeID", for: indexPath) as! SportsCollectionViewCell
        cell.imgView.image = sportsItems[indexPath.row].image
        cell.titleLabel.text = sportsItems[indexPath.row].title
        
        return cell
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let leaguesViewController = self.storyboard?.instantiateViewController(withIdentifier: "LeaguesViewController") as! LeaguesViewController
        
        var sportSelected: String
        switch indexPath.row {
        case 0:
            sportSelected = "football"
        case 1:
            sportSelected = "basketball"
        case 2:
            sportSelected = "cricket"
        case 3:
            sportSelected = "tennis"
        default:
            sportSelected = "football"
        }
        
        leaguesViewController.sportSelected = sportSelected
        navigationController?.pushViewController(leaguesViewController, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width
        let height = collectionView.frame.height
        return CGSize(width: width/2, height: height/2)
    }
    
}
