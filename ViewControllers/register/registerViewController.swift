//
//  registerViewController.swift
//  NeuroPilot
//
//  Created by Kakha Sepashvili on 31.08.21.
//

import UIKit
import Firebase

class registerViewController: UIViewController {
    
    var userName: String = ""
    var userEmail: String = ""

    private let logoTop: UIImageView = {
       let logoTop = UIImageView()
        logoTop.image = UIImage(named: "logoLogin")
        logoTop.frame = CGRect(x: (UIScreen.main.bounds.width / 2) - (UIScreen.main.bounds.width / 8.3 / 2),
                               y: UIScreen.main.bounds.height / 18.45,
                               width: UIScreen.main.bounds.width / 8.3,
                               height: UIScreen.main.bounds.height / 18.45)
        return logoTop
    }()
    private let bigLabel: UILabel = {
        let bigLabel = UILabel()
        bigLabel.textColor = .systemBlue
        bigLabel.text = "Create your account"
        bigLabel.font = UIFont(name: "Helvetica", size: 26)
        bigLabel.numberOfLines = 2
        bigLabel.frame = CGRect(x: UIScreen.main.bounds.width / 6.104,
                                y: UIScreen.main.bounds.height / 6.806,
                                width: UIScreen.main.bounds.width /  1.089,
                                height: UIScreen.main.bounds.height /  6.55)
        return bigLabel
    }()
    private let backButton: UIButton = {
       let backButton = UIButton()
        backButton.setImage(UIImage(named: "backlogo"), for: .normal)
        backButton.frame = CGRect(x: UIScreen.main.bounds.width / 95.25,
                                  y: UIScreen.main.bounds.height / 18.18,
                                  width: UIScreen.main.bounds.width / 8.84,
                                  height: UIScreen.main.bounds.height / 19.18)
        backButton.addTarget(self, action: #selector(dismissViewController), for: .touchUpInside)
        
        return backButton
    }()
    private let nameField: UITextField = {
       let nameField = UITextField()
        nameField.borderStyle = .line
        nameField.layer.cornerRadius =  5
        nameField.layer.borderColor = UIColor.systemBlue.cgColor
        nameField.layer.borderWidth = 2
        let leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 10, height: 0))
        nameField.leftView = leftView
        nameField.leftViewMode = .always
        nameField.attributedPlaceholder = NSAttributedString(string: "Name", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        nameField.clipsToBounds = true
        nameField.frame = CGRect(x: UIScreen.main.bounds.width / 16.175,
                                 y: UIScreen.main.bounds.height / 3.309,
                                 width: UIScreen.main.bounds.width / 1.137,
                                 height: UIScreen.main.bounds.height / 12.7878)
        return nameField
    }()
    private let emailField: UITextField = {
       let emailField = UITextField()
        emailField.borderStyle = .line
        emailField.layer.borderColor = UIColor.systemBlue.cgColor
        emailField.attributedPlaceholder = NSAttributedString(string: "Name", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        emailField.layer.cornerRadius =  5
        emailField.layer.borderWidth = 2
        let leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 10, height: 0))
        emailField.leftView = leftView
        emailField.leftViewMode = .always
        emailField.clipsToBounds = true
        emailField.frame = CGRect(x: UIScreen.main.bounds.width / 16.175,
                                  y: UIScreen.main.bounds.height / 2.5119,
                                 width: UIScreen.main.bounds.width / 1.137,
                                 height: UIScreen.main.bounds.height / 12.7878)
        return emailField
    }()
    private let passwordField: UITextField = {
       let passwordField = UITextField()
        passwordField.borderStyle = .line
        passwordField.layer.borderColor = UIColor.systemBlue.cgColor
        passwordField.layer.cornerRadius =  5
        passwordField.layer.borderWidth = 2
        let leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 10, height: 0))
        passwordField.leftView = leftView
        passwordField.leftViewMode = .always
        passwordField.attributedPlaceholder = NSAttributedString(string: "Create Strong Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        passwordField.isSecureTextEntry = true
        passwordField.clipsToBounds = true
        passwordField.frame = CGRect(x: UIScreen.main.bounds.width / 16.175,
                                     y: UIScreen.main.bounds.height / 2.02398,
                                 width: UIScreen.main.bounds.width / 1.137,
                                 height: UIScreen.main.bounds.height / 12.7878)
        return passwordField
    }()
    private let repeatField: UITextField = {
       let repeatField = UITextField()
        repeatField.borderStyle = .line
   
        repeatField.layer.borderColor = UIColor.systemBlue.cgColor
        repeatField.attributedPlaceholder = NSAttributedString(string: "Repeat Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        repeatField.isSecureTextEntry = true
        repeatField.layer.cornerRadius =  5
        repeatField.layer.borderWidth = 2
        let leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 10, height: 0))
        repeatField.leftView = leftView
        repeatField.leftViewMode = .always
        repeatField.clipsToBounds = true
        repeatField.frame = CGRect(x: UIScreen.main.bounds.width / 16.175,
                                   y: UIScreen.main.bounds.height / 1.6947,
                                 width: UIScreen.main.bounds.width / 1.137,
                                 height: UIScreen.main.bounds.height / 12.7878)
        return repeatField
    }()
    private let registrationButton: UIButton = {
       let registrationButton = UIButton()
        registrationButton.setImage(UIImage(named: "registerButton"), for: .normal)
        registrationButton.frame = CGRect(x: UIScreen.main.bounds.width / 18.375 ,
                                          y: UIScreen.main.bounds.height / 1.367902,
                                          width: UIScreen.main.bounds.width / 1.1370262,
                                          height: UIScreen.main.bounds.height / 12.787878)
        registrationButton.addTarget(self, action: #selector(didtapRegister), for: .touchUpInside)
        return registrationButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
                view.addGestureRecognizer(tap)
        let backgroundColor = UIColor(red: 255/255.0, green: 252/255.0, blue: 245/255.0, alpha: 1.0)
        view.backgroundColor = backgroundColor
        view.addSubview(logoTop)
        view.addSubview(backButton)
        view.addSubview(bigLabel)
        view.addSubview(nameField)
        view.addSubview(emailField)
        view.addSubview(passwordField)
        view.addSubview(repeatField)
        view.addSubview(registrationButton)
        saveInfo(name: nameField.text, Email: emailField.text)
      
    }
    func saveInfo(name: String?, Email: String?) {
        userName.append(name ?? "No name Provided" )
        userEmail.append(Email ?? "No Email Provided")
    }
    
    @objc func dismissViewController() {
        dismiss(animated: false)
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    @objc func didtapRegister() {
        if passwordField.text != repeatField.text {
            self.showAlert(message: "Passwords do not match.")
        } else {
        if let email = emailField.text, let password = passwordField.text {
            Auth.auth().createUser(withEmail: email, password: password) { (resultdata, error) in
                if let err = error {
                    self.showAlert(message: err.localizedDescription)
                } else {
                    let vc = firstPageViewController()
                    vc.modalPresentationStyle = .fullScreen
                    self.present(vc, animated: false)
                }
            }
        }
    }
     writeData()
    }
    func writeData() {
        let object: [String: Any] = [
            "Email" : emailField.text ?? "Email Field Empty",
            "Name" : nameField.text ?? "Name Field Empty"
        ]
        if emailField.text != nil {
            let filteredEmail = emailField.text!.replacingOccurrences(of: "@gmail.com", with: "")
            Database.database().reference().child("\(filteredEmail.lowercased())").setValue(object)
        } else {
            return
        }
    
    }
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Creation Failed", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OKay", style: .default, handler: nil))
        present(alert, animated: false, completion: nil)
    }
}

