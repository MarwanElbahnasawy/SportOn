//
//  SportsViewController.swift
//  SportOn
//
//  Created by Marwan Elbahnasawy on 02/05/2023.
//

import UIKit

class SportsViewController: MyBaseViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let sportsItems : [SportItem] = [SportItem(title: "Football", image: UIImage(named: "footballplayer")!), SportItem(title: "Basketball", image: UIImage(named: "basketballplayer")!), SportItem(title: "Cricket", image: UIImage(named: "cricketplayer")! ),SportItem(title: "Tennis", image: UIImage(named: "tennisplayer")!) ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Sports"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 25)]
        
        if UIDevice.current.userInterfaceIdiom == .pad{
            navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 44)]
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sportsItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "sportsCellHomeID", for: indexPath) as! SportsCollectionViewCell
        cell.imgView.image = sportsItems[indexPath.row].image
        cell.titleLabel.text = sportsItems[indexPath.row].title
        
        if UIDevice.current.userInterfaceIdiom == .pad{
        
            cell.titleLabel.font = UIFont.systemFont(ofSize: 50)

            cell.titleLabel.removeConstraint(cell.oldConstraintTitleTop)

            let newTopConstraint = NSLayoutConstraint(
                item: cell.titleLabel,
                attribute: .top,
                relatedBy: .equal,
                toItem: cell.imgView,
                attribute: .bottom,
                multiplier: 0.8,
                constant: 0
            )

            cell.contentView.addConstraint(newTopConstraint)
            
        }
        
        return cell
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if !MyBaseViewController.isNetworkAvailable{
            let alertController = UIAlertController(title: "Connectivity Issue", message: "Please connect to the internet.", preferredStyle: .alert)
            
            let cancelAction = UIAlertAction(title: "OK", style: .cancel)
            alertController.addAction(cancelAction)

            present(alertController, animated: true)
        } else{
            let leaguesViewController = self.storyboard?.instantiateViewController(withIdentifier: "LeaguesViewController") as! LeaguesViewController
            
            var sportSelected: String
            switch indexPath.row {
            case 0:
                sportSelected = "football"
            case 1:
                sportSelected = "basketball"
            case 2:
                sportSelected = "cricket"
            default:
                sportSelected = "tennis"
            }
            
            leaguesViewController.sportSelected = sportSelected
            navigationController?.pushViewController(leaguesViewController, animated: true)
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width
        let height = collectionView.frame.height
        return CGSize(width: width/2, height: height/2)
    }
    
}
