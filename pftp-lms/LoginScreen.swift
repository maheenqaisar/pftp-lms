//
//  LoginScreen.swift
//  pftp-lms
//
//  Created by Maheen on 04/05/2023.
//

import UIKit

class UserModelData {
    var email: String = ""
    var password: String = ""

    func validate() -> (Bool, String?) {
        // Validate the email and password
        if email.isEmpty {
            return (false, "Email is required !")
        }

        if password.isEmpty {
            return (false, "Password is required !")
        }

        if password.count < 6 {
            return (false, "Password must be at least 6 characters long !")
        }

        return (true, nil)
    }
}

class LoginScreen: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        let userModeldata = UserModelData()
        userModeldata.email = emailTextField.text ?? ""
        userModeldata.password = passwordTextField.text ?? ""
        let (isValid, errorMessage) = userModeldata.validate()
        
        if isValid {
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            let homePage = storyBoard.instantiateViewController(withIdentifier: "HomeScreen") as! HomeScreen
            let navController = UINavigationController(rootViewController: homePage)
            navController.modalPresentationStyle = .fullScreen
            navController.modalTransitionStyle = .crossDissolve
            self.present(navController, animated: true, completion: nil)

        } else {
            showAlert(title: "Validation Error", message: errorMessage)
            
        }
        
    }
    
    func showAlert(title: String, message: String?) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OkayAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(OkayAction)
        present(alertController, animated: true, completion: nil)
    }
    
    
    @IBAction func signUpClicked(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController( withIdentifier: "SignupScreen") as! SignupScreen
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func forgotpass(_ sender: Any) {
        let alertController = UIAlertController(title: "Forgot Password", message: "Enter your email address to reset your password", preferredStyle: .alert)
        alertController.addTextField { (textField) in
            textField.placeholder = "Email Address"
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            alertController.addAction(cancelAction)
        let resetPasswordAction = UIAlertAction(title: "Reset Password", style: .default) { (action) in
            if (alertController.textFields?.first?.text) != nil {
                print("Okay Working")
            }
        }
        alertController.addAction(resetPasswordAction)
        self.present(alertController, animated: true, completion: nil)
    }
}

