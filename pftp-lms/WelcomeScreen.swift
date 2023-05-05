//
//  WelcomeScreen.swift
//  pftp-lms
//
//  Created by Maheen on 04/05/2023.
//

import UIKit

class WelcomeScreen: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
   
    @IBAction func NextPage(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let loginPage = storyBoard.instantiateViewController(withIdentifier: "LoginScreen") as! LoginScreen
        loginPage.modalPresentationStyle = .fullScreen
        loginPage.modalTransitionStyle = .crossDissolve
        UserDefaults.standard.hasOnboarded = true
        self.present(loginPage, animated: true, completion: nil)
    }
    
    
    @IBAction func LoginScreen(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let loginPage = storyBoard.instantiateViewController(withIdentifier: "LoginScreen") as! LoginScreen
        loginPage.modalPresentationStyle = .fullScreen
        loginPage.modalTransitionStyle = .crossDissolve
        self.present(loginPage, animated: true, completion: nil)
    }
    
}
