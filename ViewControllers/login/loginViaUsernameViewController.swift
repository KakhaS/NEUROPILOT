//
//  loginViaUsernameViewController.swift
//  NeuroPilot
//
//  Created by Kakha Sepashvili on 29.09.21.
//

import UIKit
import Firebase
import FirebaseAuth
import GoogleSignIn
import AuthenticationServices

class loginViaUsername: UIViewController {
    private let topLogo: UIImageView = {
       let topLogo = UIImageView()
        topLogo.image = UIImage(named: "logoLogin")
        topLogo.frame = CGRect(x: (UIScreen.main.bounds.width / 2) - (UIScreen.main.bounds.width / 8.3 / 2),
                                                       y: UIScreen.main.bounds.height / 18.45,
                                                       width: UIScreen.main.bounds.width / 8.3,
                                                       height: UIScreen.main.bounds.height / 18.45)
        return topLogo
    }()
    private let loginText: UILabel = {
       let loginText = UILabel()
        loginText.text = "შესვლა"
        loginText.textColor = .black
        loginText.textAlignment = .left
        loginText.font = UIFont(name: "FiraGO-Regular", size: 18)
        loginText.frame = CGRect(x: UIScreen.main.bounds.width / 2.5 ,
                                 y: UIScreen.main.bounds.height / 6.8 ,
                                 width: UIScreen.main.bounds.width / 1.3 ,
                                 height: UIScreen.main.bounds.width / 8)
        return loginText
    }()
    private let emailTextField: UITextField = {
       let emaiLTextField = UITextField()
        emaiLTextField.attributedPlaceholder = NSAttributedString(string: "ელ. ფოსტა", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        emaiLTextField.textColor = .black
        emaiLTextField.layer.cornerRadius =  2
        emaiLTextField.layer.borderColor = UIColor.black.cgColor
        emaiLTextField.layer.borderWidth = 2
        let leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 10, height: 0))
        emaiLTextField.leftView = leftView
        emaiLTextField.leftViewMode = .always
        emaiLTextField.frame = CGRect(x: (UIScreen.main.bounds.width / 2) - (UIScreen.main.bounds.width / 1.1 / 2),
                                      y: UIScreen.main.bounds.height / 4.4,
                                      width: UIScreen.main.bounds.width / 1.1,
                                      height: UIScreen.main.bounds.height / 15.3 )
        return emaiLTextField
    }()
    private let passworedField: UITextField = {
       let passworedField = UITextField()
        passworedField.layer.cornerRadius =  5
        passworedField.layer.borderColor = UIColor.black.cgColor
        passworedField.layer.borderWidth = 2
        let leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 10, height: 0))
        passworedField.leftView = leftView
        passworedField.leftViewMode = .always
        passworedField.clipsToBounds = true
        passworedField.isSecureTextEntry = true
        passworedField.attributedPlaceholder = NSAttributedString(string: "პაროლი", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        passworedField.textColor = .black
        passworedField.frame = CGRect(x: (UIScreen.main.bounds.width / 2) - (UIScreen.main.bounds.width / 1.1 / 2),
                                      y: UIScreen.main.bounds.height / 3,
                                      width: UIScreen.main.bounds.width / 1.1,
                                      height: UIScreen.main.bounds.height / 15.3 )
        return passworedField
    }()
    private let forgotPasswordButton: UIButton = {
       let forgotPasswordButton = UIButton()
        forgotPasswordButton.setTitle("დაგავიწყდა პაროლი?", for: .normal)
        forgotPasswordButton.setTitleColor(.black, for: .normal)
        forgotPasswordButton.alpha = 0.4
        forgotPasswordButton.titleLabel?.font = UIFont(name: "Helvetica", size: 12)
        forgotPasswordButton.frame = CGRect(x: UIScreen.main.bounds.width / 3.1,
                                            y: UIScreen.main.bounds.height / 2.2,
                                            width: UIScreen.main.bounds.width / 1.1,
                                            height: UIScreen.main.bounds.height / 58)
        forgotPasswordButton.addTarget(self, action: #selector(forgotPasswordPressed), for: .touchUpInside)
        return forgotPasswordButton
    }()
    private let loginButton: UIButton = {
       let loginButton = UIButton()
        loginButton.setImage(UIImage(named: "shesvla"), for: .normal)
        loginButton.frame = CGRect(x: (UIScreen.main.bounds.width / 2) - (UIScreen.main.bounds.width / 1.1 / 2),
                                   y: UIScreen.main.bounds.height / 2,
                                   width: UIScreen.main.bounds.width / 1.1,
                                   height: UIScreen.main.bounds.height / 12.3)
        loginButton.addTarget(self, action: #selector(LoginUserButton), for: .touchUpInside)
        return loginButton
    }()
    private let orImage: UIImageView = {
       let orImage = UIImageView()
        orImage.image = UIImage(named: "orImage")
        orImage.frame = CGRect(x: (UIScreen.main.bounds.width / 2 ) - (UIScreen.main.bounds.width / 1.1 / 2),
                               y: UIScreen.main.bounds.height / 1.55,
                               width: UIScreen.main.bounds.width / 1.1,
                               height: UIScreen.main.bounds.height / 45 )
        return orImage
    }()
    private let googleButton: GIDSignInButton = {
       let googleButton = GIDSignInButton()
        googleButton.frame = CGRect(x: (UIScreen.main.bounds.width / 2) - (UIScreen.main.bounds.width / 1.1 / 2 ),
                                    y: UIScreen.main.bounds.height / 1.40,
                                    width: UIScreen.main.bounds.width / 1.1,
                                    height: UIScreen.main.bounds.height / 20.3)
        return googleButton
    }()
    private let appleButton: ASAuthorizationAppleIDButton = {
       let appleButton = ASAuthorizationAppleIDButton()
        appleButton.frame = CGRect(x: (UIScreen.main.bounds.width / 2) - ( UIScreen.main.bounds.width / 1.1 / 2),
                                   y: UIScreen.main.bounds.height / 1.25,
                                   width: UIScreen.main.bounds.width / 1.1,
                                   height: UIScreen.main.bounds.height / 20.3)
        return appleButton
    }()
    private let newUserButton: UIButton = {
       let newUserButton = UIButton()
        newUserButton.setTitle("რეგისტრაცია", for: .normal)
        newUserButton.setTitleColor(.black, for: .normal)
        newUserButton.frame = CGRect(x: (UIScreen.main.bounds.width / 2) - (UIScreen.main.bounds.width / 2.3 / 2),
                                     y: UIScreen.main.bounds.height / 1.1,
                                     width: UIScreen.main.bounds.width / 2.3,
                                     height: UIScreen.main.bounds.height / 45)
        newUserButton.addTarget(self, action: #selector(newUserbuttonClicked), for: .touchUpInside)
        return newUserButton
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
    private let errorPassword: UILabel = {
       let errorPassword = UILabel()
        errorPassword.text = "Error. Check your credentials"
        errorPassword.textColor = .red
        errorPassword.font = UIFont(name: "Helvetica", size: 10)
        errorPassword.textAlignment = .left
        errorPassword.frame = CGRect(x: UIScreen.main.bounds.width / 15.5 ,
                                     y: UIScreen.main.bounds.height / 2.4, width: UIScreen.main.bounds.width / 1.1, height: UIScreen.main.bounds.height / 58 )
        return errorPassword
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
            let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
           view.addGestureRecognizer(tap)
        let backgroundColor = UIColor(red: 255/255.0, green: 252/255.0, blue: 245/255.0, alpha: 1.0)
        view.backgroundColor = backgroundColor
        view.addSubview(topLogo)
        view.addSubview(loginText)
        view.addSubview(emailTextField)
        view.addSubview(passworedField)
        view.addSubview(forgotPasswordButton)
        view.addSubview(loginButton)
        view.addSubview(orImage)
        view.addSubview(backButton)
//        view.addSubview(googleButton)
//        view.addSubview(appleButton)
        view.addSubview(newUserButton)
        view.addSubview(errorPassword)
        errorPassword.isHidden = true
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance()?.presentingViewController = self
    }
    @objc func dismissViewController() {
        let vc = loginViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: false)
    }
    @objc func newUserbuttonClicked() {
        let vc = registerViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: false)
    }
    @objc func LoginUserButton() {
        Auth.auth().signIn(withEmail: emailTextField.text ?? "", password: passworedField.text ?? "") { (resultdata, error)  in
            if error != nil {
                self.passworedField.textColor = .red
                self.errorPassword.isHidden = false
            } else {
                let vc = firstPageViewController()
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: false)
            }
        }
        }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

    @objc func forgotPasswordPressed() {
        let vc = forgotPasswordViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: false)
    }
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Login Failed", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OKay", style: .default, handler: nil))
        present(alert, animated: false, completion: nil)
    }
    }

extension loginViaUsername: GIDSignInDelegate {
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

