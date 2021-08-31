//
//  ViewController.swift
//  NeuroPilot
//
//  Created by Kakha Sepashvili on 21.08.21.
//

import UIKit
import GoogleSignIn

class loginViewController: UIViewController {
    
    
    private let logoWoman: UIImageView = {
       let logoWoman = UIImageView()
        logoWoman.image = UIImage(named: "logoLogin")
        logoWoman.frame = CGRect(x: UIScreen.main.bounds.width / 5.424,
                                 y: UIScreen.main.bounds.width / 3.4831,
            width: UIScreen.main.bounds.width / 1.58,
            height:  UIScreen.main.bounds.height / 2.4)
        return logoWoman
    }()
     let loginButton: UIButton = {
        let loginButton = UIButton()
        loginButton.setImage(UIImage(named: "loginLogin"), for: .normal)
        loginButton.frame = CGRect(x: UIScreen.main.bounds.width / 16.25,
                                   y: UIScreen.main.bounds.height / 1.39,
                                   width: UIScreen.main.bounds.width / 1.137,
                                   height: UIScreen.main.bounds.height / 12.79)
        loginButton.addTarget(self, action: #selector(login), for: .touchUpInside)
        return loginButton
    }()
    private let greetingText: UILabel = {
        let greetingText = UILabel()
        greetingText.textColor = .systemBlue
        greetingText.text = "I’m not superstitious, but I am a little stitious."
        greetingText.numberOfLines = 2
        greetingText.alpha = 0.6
        greetingText.frame = CGRect(x: UIScreen.main.bounds.width / 7.09090909,
                                    y: UIScreen.main.bounds.height / 1.68,
                                    width: UIScreen.main.bounds.width / 1.39285,
                                    height: UIScreen.main.bounds.height / 17.583333)
        return greetingText
    }()
    private let signUp: UIButton = {
       let signUp = UIButton()
        signUp.setTitle("Sign Up", for: .normal)
        signUp.setTitle("Signing Up", for: .highlighted)
        signUp.titleLabel?.font = UIFont(name: "Helvetica", size: 10)
        signUp.setTitleColor(.orange, for: .normal)
        signUp.frame = CGRect(x: UIScreen.main.bounds.width / 2.294,
                              y: UIScreen.main.bounds.height / 1.113456,
                              width: UIScreen.main.bounds.width / 7.8,
                              height: UIScreen.main.bounds.height / 46.8888)
        signUp.addTarget(self, action: #selector(registerButton), for: .touchUpInside)
        return signUp
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(logoWoman)
        view.addSubview(loginButton)
        view.addSubview(greetingText)
        view.addSubview(signUp)
    }
    @objc func login() {
        let vc = loginViewController2()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: false, completion: nil)
        
    }
    @objc func registerButton() {
        let vc = registerViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: false)
    }
}

class loginViewController2: UIViewController {

    private let googleButton: GIDSignInButton = {
       let googleButton = GIDSignInButton()
        googleButton.frame = CGRect(x: UIScreen.main.bounds.width / 7.62,
                                    y: UIScreen.main.bounds.height / 1.5077,
                                    width: UIScreen.main.bounds.width / 1.424,
                                    height: UIScreen.main.bounds.height / 12.23)
        googleButton.addTarget(self, action: #selector(GDSSignedIN), for: .touchUpInside)
        return googleButton
    }()
    private let appleButton: UIButton = {
       let appleButton = UIButton()
        appleButton.setImage(UIImage(named: "SignInWithApple"), for: .normal)
        appleButton.sizeToFit()
        appleButton.frame = CGRect(x: UIScreen.main.bounds.width / 7.62,
                                   y: UIScreen.main.bounds.height / 1.3677,
                                   width: UIScreen.main.bounds.width / 1.424,
                                   height: UIScreen.main.bounds.height / 12.23)
        return appleButton
        
    }()
    private let loginButton: UIButton = {
        let loginButton = UIButton()
        loginButton.setImage(UIImage(named: "loginLogin"), for: .normal)
        loginButton.frame = CGRect(x: UIScreen.main.bounds.width / 16.913,
                                   y: UIScreen.main.bounds.height / 1.949,
                                   width: UIScreen.main.bounds.width / 1.1832,
                                   height: UIScreen.main.bounds.height / 13.1875)
        return loginButton
    }()
    private let logo: UIImageView = {
       let logo = UIImageView()
        logo.image = UIImage(named: "LOGO")
        logo.frame = CGRect(x: UIScreen.main.bounds.width / 2.62,
                            y: UIScreen.main.bounds.height / 9.299,
                            width: UIScreen.main.bounds.width / 4.98,
                            height: UIScreen.main.bounds.height / 10.68)
        return logo
    }()
    private let bigLabel: UILabel = {
        let bigLabel = UILabel()
        bigLabel.textColor = .systemBlue
        bigLabel.text = "Take your Time"
        bigLabel.font = UIFont(name: "FiraGO", size: 22)
        bigLabel.frame = CGRect(x: UIScreen.main.bounds.width / 2.88,
                                y: UIScreen.main.bounds.height / 3.734,
                                width: UIScreen.main.bounds.width /  1.945,
                                height: UIScreen.main.bounds.height /  27.225)
        return bigLabel
    }()
    private let secondaryLabel: UILabel = {
       let secondaryLabel = UILabel()
        secondaryLabel.textColor = .systemBlue
        secondaryLabel.text = "I’m an early bird and I’m a night owl so I’m wise and I have worms."
        secondaryLabel.numberOfLines = 3
        secondaryLabel.font = UIFont(name: "FiraGO", size: 8)
        secondaryLabel.frame = CGRect(x: UIScreen.main.bounds.width / 6.078 ,
                                      y: UIScreen.main.bounds.height / 2.99,
                                      width: UIScreen.main.bounds.width / 1.607,
                                      height: UIScreen.main.bounds.height / 11.7222)
        return secondaryLabel
    }()
    private let backButton: UIButton = {
       let backButton = UIButton()
        backButton.setImage(UIImage(named: "backlogo"), for: .normal)
        backButton.frame = CGRect(x: UIScreen.main.bounds.width / 97.25,
                                  y: UIScreen.main.bounds.height / 18.18,
                                  width: UIScreen.main.bounds.width / 8.84,
                                  height: UIScreen.main.bounds.height / 19.18)
        backButton.addTarget(self, action: #selector(dismissViewController), for: .touchUpInside)
        
        return backButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance()?.presentingViewController = self
        view.backgroundColor = .white
        view.addSubview(appleButton)
        view.addSubview(googleButton)
        view.addSubview(loginButton)
        view.addSubview(logo)
        view.addSubview(bigLabel)
        view.addSubview(secondaryLabel)
        view.addSubview(backButton)
    }
    @objc func dismissViewController() {
        dismiss(animated: false)
    }
    
    @objc func GDSSignedIN() {

        GIDSignIn.sharedInstance()?.delegate = self
        GIDSignIn.sharedInstance().signIn()
    }
    @objc func registerButton() {
        let vc = registerViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: false)
    }
}
extension loginViewController2: GIDSignInDelegate {
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        print("logged in")
    }
    
    
}

