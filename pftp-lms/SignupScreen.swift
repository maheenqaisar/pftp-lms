//
//  SignupScreen.swift
//  pftp-lms
//
//  Created by Maheen on 04/05/2023.
//

import UIKit

class SignupScreen: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Register"
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func registerButtonTapped(_ sender: Any) {
        
        let userModeldata = UserModelData()
        userModeldata.email = emailTextField.text ?? ""
        userModeldata.password = passwordTextField.text ?? ""
        
        let (isValid, errorMessage) = userModeldata.validate()
        if isValid {
            let alertVC = UIAlertController(title: "Success", message: "Account created successfully !", preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
                self.navigationController?.popViewController(animated: true)
            }))
            present(alertVC, animated: true, completion: nil)
        } else {
            showAlert(title: "Validation Error !", message: errorMessage)
        }
    }
    
    func showAlert(title: String, message: String?) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OkAct = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(OkAct)
        present(alertController, animated: true, completion: nil)
        
    }
}
