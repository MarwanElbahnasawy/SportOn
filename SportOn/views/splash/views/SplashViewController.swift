//
//  ViewController.swift
//  SportOn
//
//  Created by Marwan Elbahnasawy on 01/05/2023.
//

import UIKit
import Lottie

class SplashViewController: MyBaseViewController, SplashViewProtocol {
    
    private lazy var presenter: SplashPresenterProtocol = {
        return SplashPresenter(view: self, db: db)
    }()
    
    let animationView = LottieAnimationView(name: "splash_animation")
    let db = DatabaseManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animationView.frame = view.bounds
        
        view.addSubview(animationView)
        
        animationView.play(fromProgress: 0, toProgress: 0.5) { finished in
            if self.presenter.checkIfOnboardingWasShownBefore(){
                self.navigateToHome()
            } else{
                self.navigateToOnboarding()
            }
        }
    }
    
    func navigateToOnboarding(){
        performSegue(withIdentifier: "segueSplashToOnboarding", sender: self)
    }
    
    func navigateToHome(){
        performSegue(withIdentifier: "segueSplashToHome", sender: self)
        
    }
    
}
