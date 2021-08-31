//
//  registerViewController.swift
//  NeuroPilot
//
//  Created by Kakha Sepashvili on 31.08.21.
//

import UIKit

class registerViewController: UIViewController {

    private let bigLabel: UILabel = {
        let bigLabel = UILabel()
        bigLabel.textColor = .systemBlue
        bigLabel.text = "Create your account."
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
        nameField.layer.borderWidth = 1
        nameField.layer.borderColor = UIColor.systemBlue.cgColor
        nameField.placeholder = "Name"
        nameField.frame = CGRect(x: UIScreen.main.bounds.width / 16.175,
                                 y: UIScreen.main.bounds.height / 3.309,
                                 width: UIScreen.main.bounds.width / 1.137,
                                 height: UIScreen.main.bounds.height / 12.7878)
        return nameField
    }()
    private let emailField: UITextField = {
       let emailField = UITextField()
        emailField.borderStyle = .line
        emailField.layer.borderWidth = 1
        emailField.layer.borderColor = UIColor.systemBlue.cgColor
        emailField.placeholder = "Your Email"
        emailField.frame = CGRect(x: UIScreen.main.bounds.width / 16.175,
                                  y: UIScreen.main.bounds.height / 2.5119,
                                 width: UIScreen.main.bounds.width / 1.137,
                                 height: UIScreen.main.bounds.height / 12.7878)
        return emailField
    }()
    private let passwordField: UITextField = {
       let passwordField = UITextField()
        passwordField.borderStyle = .line
        passwordField.layer.borderWidth = 1
        passwordField.layer.borderColor = UIColor.systemBlue.cgColor
        passwordField.placeholder = "Create a Strong Password"
        passwordField.frame = CGRect(x: UIScreen.main.bounds.width / 16.175,
                                     y: UIScreen.main.bounds.height / 2.02398,
                                 width: UIScreen.main.bounds.width / 1.137,
                                 height: UIScreen.main.bounds.height / 12.7878)
        return passwordField
    }()
    private let repeatField: UITextField = {
       let repeatField = UITextField()
        repeatField.borderStyle = .line
        repeatField.layer.borderWidth = 1
        repeatField.layer.borderColor = UIColor.systemBlue.cgColor
        repeatField.placeholder = "Repeat Password"
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
        return registrationButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(backButton)
        view.addSubview(bigLabel)
        view.addSubview(nameField)
        view.addSubview(emailField)
        view.addSubview(passwordField)
        view.addSubview(repeatField)
        view.addSubview(registrationButton)
    }
    @objc func dismissViewController() {
        dismiss(animated: false)
    }
}
