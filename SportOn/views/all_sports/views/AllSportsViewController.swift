//
//  SportsViewController.swift
//  SportOn
//
//  Created by Marwan Elbahnasawy on 02/05/2023.
//

import UIKit

class AllSportsViewController: MyBaseViewController, AllSportsViewProtocol, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    private lazy var presenter: AllSportsPresenterProtocol = {
        return AllSportsPresenter(view: self, db: db,  networkConnectivityObserver: MyBaseViewController.self)
    }()
    
    let db = DatabaseManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.topItem?.title = "Sports"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 34)]
        
        if UIDevice.current.userInterfaceIdiom == .pad{
            navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 44)]
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.getNumberOfSportsItems()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "sportsCellHomeID", for: indexPath) as! SportsCollectionViewCell
        
        let currentSportItem = presenter.getSportItem(at: indexPath.row)
        cell.configure(sportItem: currentSportItem)
            
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if !presenter.checkisNetworkAvailable(){
            
            let alertController = UIAlertController(title: "Connectivity Issue", message: "Please connect to the internet.", preferredStyle: .alert)
            
            let cancelAction = UIAlertAction(title: "OK", style: .cancel)
            alertController.addAction(cancelAction)
            
            present(alertController, animated: true)
            
        } else{
            let leaguesViewController = self.storyboard?.instantiateViewController(withIdentifier: "LeaguesViewController") as! AllLeaguesViewController
            
            var sportSelected: String
            
            sportSelected = presenter.getSportSelected(row: indexPath.row)
            
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
