//
//  forgotPasswordViewController.swift
//  NeuroPilot
//
//  Created by Kakha Sepashvili on 12.09.21.
//

import UIKit
import FirebaseAuth

class forgotPasswordViewController: UIViewController {
    private let logo: UIImageView = {
       let logo = UIImageView()
        logo.image = UIImage(named: "logoLogin")
        logo.frame = CGRect(x: (UIScreen.main.bounds.width / 2) - (UIScreen.main.bounds.width / 8.3 / 2),
                            y: UIScreen.main.bounds.height / 18.45,
                            width: UIScreen.main.bounds.width / 8.3,
                            height: UIScreen.main.bounds.height / 18.45)
        return logo
    }()
    private let forgotPasswordLabel: UILabel = {
       let forgotPasswordLabel = UILabel()
        forgotPasswordLabel.text = "Forgot Password"
        forgotPasswordLabel.textColor = .black
        forgotPasswordLabel.textAlignment = .center
        forgotPasswordLabel.font = UIFont(name: "Helvetica", size: 25)
        forgotPasswordLabel.frame = CGRect(x: (UIScreen.main.bounds.width / 2) - (UIScreen.main.bounds.width / 1.3 / 2 ),
                                           y: UIScreen.main.bounds.height / 6.2 ,
                                           width: UIScreen.main.bounds.width / 1.3,
                                           height: UIScreen.main.bounds.height / 8.5)
        return forgotPasswordLabel
    }()
    private let enterEmailLabel: UILabel = {
       let enterEmailLabel = UILabel()
        enterEmailLabel.text = "Enter your email"
        enterEmailLabel.textColor = .black
        enterEmailLabel.textAlignment = .center
        enterEmailLabel.frame = CGRect(x: (UIScreen.main.bounds.width / 2 ) - (UIScreen.main.bounds.width / 1.3 / 2 ),
                                       y: UIScreen.main.bounds.height / 4,
                                       width: UIScreen.main.bounds.width / 1.3 ,
                                       height: UIScreen.main.bounds.height / 8.5 )
        return enterEmailLabel
    }()
    private let verificationLabel: UILabel = {
       let verificationLabel = UILabel()
        verificationLabel.text = "you will get verification link "
        verificationLabel.textColor = .black
        verificationLabel.textAlignment = .center
        verificationLabel.frame = CGRect(x: (UIScreen.main.bounds.width / 2 ) - (UIScreen.main.bounds.width / 1.3 / 2 ),
                                         y: UIScreen.main.bounds.height / 2.8,
                                         width: UIScreen.main.bounds.width / 1.3 ,
                                         height: UIScreen.main.bounds.height / 35.3)
        return verificationLabel
    }()
    private let emailTextField: UITextField = {
       let emaiLTextField = UITextField()
        emaiLTextField.layer.borderWidth = 1
        emaiLTextField.layer.cornerRadius = 8
        emaiLTextField.clipsToBounds = true
        emaiLTextField.placeholder = "Enter Email "
        emaiLTextField.frame = CGRect(x: (UIScreen.main.bounds.width / 2) - (UIScreen.main.bounds.width / 1.1 / 2),
                                      y: UIScreen.main.bounds.height / 2.2,
                                      width: UIScreen.main.bounds.width / 1.1,
                                      height: UIScreen.main.bounds.height / 18.2 )
        return emaiLTextField
    }()
    private let registrationButton: UIButton = {
       let registrationButton = UIButton()
        registrationButton.setImage(UIImage(named: "registerButton"), for: .normal)
        registrationButton.frame = CGRect(x: (UIScreen.main.bounds.width / 2) - (UIScreen.main.bounds.width / 1.1 / 2) ,
                                          y: UIScreen.main.bounds.height / 1.3,
                                          width: UIScreen.main.bounds.width / 1.1,
                                          height: UIScreen.main.bounds.height / 12.3)
        registrationButton.addTarget(self, action: #selector(passwordReminder), for: .touchUpInside)
        return registrationButton
    }()
    private let backButton: UIButton = {
       let backButton = UIButton()
        backButton.setImage(UIImage(systemName: "arrow.backward"), for: .normal)

        backButton.frame = CGRect(x: UIScreen.main.bounds.width / 97.25,
                                  y: UIScreen.main.bounds.height / 18.18,
                                  width: UIScreen.main.bounds.width / 8.84,
                                  height: UIScreen.main.bounds.height / 19.18)
        backButton.addTarget(self, action: #selector(dismissViewController), for: .touchUpInside)
        
        return backButton
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let backgroundColor = UIColor(red: 255/255.0, green: 252/255.0, blue: 245/255.0, alpha: 1.0)
        view.backgroundColor = backgroundColor
        view.addSubview(logo)
        view.addSubview(forgotPasswordLabel)
        view.addSubview(enterEmailLabel)
        view.addSubview(verificationLabel)
        view.addSubview(emailTextField)
        view.addSubview(registrationButton)
        view.addSubview(backButton)
    }
    @objc func dismissViewController() {
        let vc = loginViaUsername()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: false)
    }
    @objc func passwordReminder() {
        Auth.auth().sendPasswordReset(withEmail: emailTextField.text ?? "") { (error) in
            if self.emailTextField.text != "" {
            if error != nil {
                self.showAlert(title: "Reset Failed.", message: "The Email was not found in system.")
            } else {
                self.showAlert(title: "Success", message: "Password Reset link was sent to your Email")
            }
        }
        else {
            self.showAlert(title: "Reset Failed.", message: "Email field is empty. Type your Email first.")
        }
        
    }
}
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OKay", style: .default, handler: nil))
        present(alert, animated: false, completion: nil)
    }
}
