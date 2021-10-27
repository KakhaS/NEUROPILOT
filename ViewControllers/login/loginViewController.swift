//
//  ViewController.swift
//  NeuroPilot
//
//  Created by Kakha Sepashvili on 21.08.21.
//

import UIKit
import GoogleSignIn
import FirebaseAuth
import Firebase
import AuthenticationServices


class loginViewController: UIViewController {

    private let logo: UIImageView = {
       let logo = UIImageView()
        logo.image = UIImage(named: "logoLogin")
        logo.frame = CGRect(x: UIScreen.main.bounds.width / 2.908,
                            y: UIScreen.main.bounds.width / 4.373,
                            width: UIScreen.main.bounds.width / 3.202,
                            height:  UIScreen.main.bounds.height / 7.099)
        return logo
    }()
    private let signUpLabel: UILabel = {
       let signUpLabel = UILabel()
        signUpLabel.text = "Sign Up"
        signUpLabel.textColor = .white
        signUpLabel.font = UIFont(name: "Helvetica", size: 40)
        signUpLabel.frame = CGRect(x: UIScreen.main.bounds.width / 3.05,
            y: UIScreen.main.bounds.height / 3.089,
            width: UIScreen.main.bounds.width / 1.932857 ,
            height: UIScreen.main.bounds.height / 24.8235)
        return signUpLabel
    }()
    private let greetingText: UILabel = {
        let greetingText = UILabel()
        let textColor = UIColor(red: 255/255.0, green: 255/255.0, blue: 255/255.0, alpha: 0.7)
        greetingText.textColor = textColor
        greetingText.text = "I’m an early bird and I’m a night owl so I’m wise and I have worms."
        greetingText.numberOfLines = 3
        greetingText.font = UIFont(name: "Helvetica", size: 20)
        greetingText.alpha = 0.6
        greetingText.frame = CGRect(x: UIScreen.main.bounds.width / 5.09090909,
                                    y: UIScreen.main.bounds.height / 2.4,
                                    width: UIScreen.main.bounds.width / 1.59285,
                                    height: UIScreen.main.bounds.height / 10.583333)
        return greetingText
    }()
    private let loginButton: UIButton = {
        let loginButton = UIButton()
        loginButton.setImage(UIImage(named: "signUpFree"), for: .normal)
        loginButton.frame = CGRect(x: UIScreen.main.bounds.width / 35,
                                   y: UIScreen.main.bounds.height / 1.7095,
                                   width: UIScreen.main.bounds.width / 1.037,
                                   height: UIScreen.main.bounds.height / 12.78787)
        loginButton.addTarget(self, action: #selector(registerButton), for: .touchUpInside)
        return loginButton
    }()
    private let googleButton: GIDSignInButton = {
       let googleButton = GIDSignInButton()
        googleButton.frame = CGRect(x: UIScreen.main.bounds.width / 15.8,
                                    y: UIScreen.main.bounds.height / 1.48,
                                    width: UIScreen.main.bounds.width / 1.115,
                                    height: UIScreen.main.bounds.height / 6.8303)
        return googleButton
    }()
    private let appleButton: ASAuthorizationAppleIDButton = {
       let appleButton = ASAuthorizationAppleIDButton()
        appleButton.frame = CGRect(x: UIScreen.main.bounds.width / 15.8,
                                   y: UIScreen.main.bounds.height / 1.338,
                                   width: UIScreen.main.bounds.width / 1.12,
                                   height: UIScreen.main.bounds.height / 20.8303)
//        appleButton.addTarget(self, action: #selector(AppleSignIn), for: .touchUpInside)
        return appleButton
        
    }()
    private let signUp: UIButton = {
       let signUp = UIButton()
        signUp.setTitle("Already Have an Account ? Log in", for: .normal)
        signUp.setTitle("Logging in", for: .highlighted)
        signUp.titleLabel?.font = UIFont(name: "Helvetica", size: 12)
        signUp.setTitleColor(.white, for: .normal)
        signUp.frame = CGRect(x: UIScreen.main.bounds.width / 4.5,
                              y: UIScreen.main.bounds.height / 1.113456,
                              width: UIScreen.main.bounds.width / 1.8,
                              height: UIScreen.main.bounds.height / 46.8888)
        signUp.addTarget(self, action: #selector(loginPressed), for: .touchUpInside)
        return signUp
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
        let backgroundColor = UIColor(red: 61/255.0, green: 36/255.0, blue: 105/255.0, alpha: 1.0)
        view.backgroundColor = backgroundColor
        view.addSubview(logo)
        view.addSubview(signUpLabel)
        view.addSubview(loginButton)
        view.addSubview(greetingText)
        view.addSubview(signUp)
        view.addSubview(appleButton)
        view.addSubview(googleButton)
        view.addSubview(backButton)
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance()?.presentingViewController = self
    }
    @objc func registerButton() {
        let vc = registerViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: false)
    }
    @objc func loginPressed() {
        let vc = loginViaUsername()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: false)
    }
    @objc func dismissViewController() {
        let vc = loginOrRegisterViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: false)
    }
}
extension loginViewController: GIDSignInDelegate {
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
