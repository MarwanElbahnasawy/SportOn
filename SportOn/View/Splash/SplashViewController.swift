//
//  ViewController.swift
//  SportOn
//
//  Created by Marwan Elbahnasawy on 01/05/2023.
//

import UIKit
import Lottie

class SplashViewController: UIViewController {

    let animationView = LottieAnimationView(name: "splash_animation")
    
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            animationView.frame = view.bounds
            
            view.addSubview(animationView)
            

            animationView.play(fromProgress: 0, toProgress: 0.5) { finished in

            }
        }
    }
