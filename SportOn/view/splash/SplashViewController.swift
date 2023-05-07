//
//  ViewController.swift
//  SportOn
//
//  Created by Marwan Elbahnasawy on 01/05/2023.
//

import UIKit
import Lottie
import CoreData

class SplashViewController: UIViewController {

    let animationView = LottieAnimationView(name: "splash_animation")
    
    var onboardingCheckerObjects : [NSManagedObject]!
    let db = DatabaseManager.shared
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            NotificationCenter.default.addObserver(self, selector: #selector(networkUnavailable), name: Notification.Name("networkUnavailable"), object: nil)
            
            animationView.frame = view.bounds
            
            view.addSubview(animationView)
            

            animationView.play(fromProgress: 0, toProgress: 0.5) { finished in
                
                if self.db.checkIfOnboardingWasShownBefore(){
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
    
    @objc func networkUnavailable() {
        // e3mel el onboarding el awwal
        }

    }
