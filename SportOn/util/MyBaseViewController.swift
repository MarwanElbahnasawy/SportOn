//
//  MyBaseViewController.swift
//  SportOn
//
//  Created by Marwan Elbahnasawy on 08/05/2023.
//

import UIKit
import Toast_Swift
import SnackBar_swift

class MyBaseViewController: UIViewController {
    
    private var snackBar : AppSnackBar?
    static var isNetworkAvailable: Bool!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(networkUnavailable), name: Notification.Name("networkUnavailable"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(networkAvailable), name: Notification.Name("networkAvailable"), object: nil)
        
    }
    
    
    @objc func networkUnavailable() {
        showSnackBar()
    }
    
    @objc func networkAvailable() {
        dismissSnackBar()
    }
    
    func showSnackBar() {
        snackBar = AppSnackBar.make(in: self.view, message: "Internet is disconnected!", duration: .infinite)
        snackBar?.show()
        MyBaseViewController.isNetworkAvailable = false
        
    }
    
    func dismissSnackBar(){
        snackBar?.dismiss()
        MyBaseViewController.isNetworkAvailable = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        guard let isNetworkAvailable = MyBaseViewController.isNetworkAvailable else {return}
        if !isNetworkAvailable{
            showSnackBar()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        snackBar?.dismiss()
    }
    
}

class AppSnackBar: SnackBar {
    
    override var style: SnackBarStyle {
        var style = SnackBarStyle()
        style.background = .red
        style.textColor = .black
        return style
    }
}

class InsertDeleteSnackBar: SnackBar{
    override var style: SnackBarStyle{
        var style = SnackBarStyle()
        //style.background = .red
        //style.textColor = .black
        return style
    }
}
