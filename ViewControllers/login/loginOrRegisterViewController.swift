//
//  loginOrRegisterViewController.swift
//  NeuroPilot
//
//  Created by Kakha Sepashvili on 29.09.21.
//

import UIKit
import GoogleSignIn

class loginOrRegisterViewController: UIViewController {
    
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
    private let logo: UIImageView = {
       let logo = UIImageView()
        logo.image = UIImage(named: "logoLogin")
        logo.frame = CGRect(x: (UIScreen.main.bounds.width / 2) - (UIScreen.main.bounds.width / 3.202 / 2) ,
                            y: UIScreen.main.bounds.height / 9.373,
                            width: UIScreen.main.bounds.width / 3.202,
                            height: UIScreen.main.bounds.height / 7.099)
        return logo
        
    }()
    private let startLabel: UILabel = {
       let startLabel = UILabel()
        startLabel.text = "NEUROPILOT"
        startLabel.numberOfLines = 2
        startLabel.textColor = .white
        startLabel.font = UIFont(name: "FiraGO-SemiBold", size: 24)
        startLabel.textAlignment = .center
        startLabel.frame = CGRect(x: (UIScreen.main.bounds.width / 2) - (UIScreen.main.bounds.width / 1.3 / 2) ,
                                  y: UIScreen.main.bounds.height / 3.2,
                                  width: UIScreen.main.bounds.width /  1.3,
                                  height: UIScreen.main.bounds.height / 9)
        return startLabel
    }()
    private let greetingText: UILabel = {
        let greetingText = UILabel()
        let textColor = UIColor(red: 255/255.0, green: 255/255.0, blue: 255/255.0, alpha: 0.7)
        greetingText.textColor = textColor
        greetingText.text = "მე მიყვარს ჩემი გონება !                             ის, სწრაფია და მოხერხებული!"
        greetingText.numberOfLines = 3
        greetingText.font = UIFont(name: "FiraGO-Regular", size: 20)
        greetingText.alpha = 0.6
        greetingText.textAlignment
            = .center
        greetingText.frame = CGRect(x: (UIScreen.main.bounds.width / 2) - (UIScreen.main.bounds.width / 1.2 / 2),
                                    y: UIScreen.main.bounds.height / 2.5,
                                    width: UIScreen.main.bounds.width / 1.2,
                                    height: UIScreen.main.bounds.height / 7)
        return greetingText
    }()
    private let accountCreationButton: UIButton = {
        let accountCreationButton = UIButton()
        accountCreationButton.setImage(UIImage(named: "createAccount"), for: .normal)
        accountCreationButton.frame = CGRect(x: (UIScreen.main.bounds.width / 2) - (UIScreen.main.bounds.width / 1.1 / 2),
            y: UIScreen.main.bounds.height / 1.34,
            width: UIScreen.main.bounds.width / 1.1,
            height: UIScreen.main.bounds.height / 12.2)
        accountCreationButton.addTarget(self, action: #selector(createAccountButton), for: .touchUpInside)
        return accountCreationButton
    }()
    private let loginButton: UIButton = {
       let loginbutton = UIButton()
        loginbutton.setImage(UIImage(named: "loginWhite"), for: .normal)
        loginbutton.frame = CGRect(x: (UIScreen.main.bounds.width / 2) - (UIScreen.main.bounds.width  / 1.1 / 2) ,
            y: UIScreen.main.bounds.height / 1.18,
                                   width: UIScreen.main.bounds.width  / 1.1,
                                   height: UIScreen.main.bounds.height / 12.3)
        loginbutton.addTarget(self, action: #selector(loginButtonPressed), for: .touchUpInside)
        return loginbutton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let backgroundColor = UIColor(red: 61/255.0, green: 36/255.0, blue: 105/255.0, alpha: 1.0)
        view.backgroundColor = backgroundColor
        view.addSubview(backButton)
        view.addSubview(logo)
        view.addSubview(startLabel)
        view.addSubview(greetingText)
        view.addSubview(accountCreationButton)
        view.addSubview(loginButton)
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance()?.presentingViewController = self
    }
    @objc func dismissViewController() {
        let vc = onboardingViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: false)
    }
    @objc func loginButtonPressed() {
        let vc = loginViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: false)
    }
    @objc func createAccountButton() {
        let vc = registerViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: false)
    }
}
extension loginOrRegisterViewController: GIDSignInDelegate {
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if error == nil {
            let vc = firstPageViewController()
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: false)
            let username = user.profile.name ?? "NoName"
            let email = user.profile.email ?? "No Email"
            writeData(email: email, name: username)
           
        } else {
           return
            print("Error occured")
        }
    }
}
