//
//  profileViewController.swift
//  NeuroPilot
//
//  Created by Kakha Sepashvili on 04.09.21.
//

import UIKit
import Firebase
import GoogleSignIn

class profileViewController: UIViewController {
    

    private let logo: UIImageView = {
       let logo = UIImageView()
        logo.image = UIImage(named: "logoLogin")
        logo.frame = CGRect(x: (UIScreen.main.bounds.width / 2) - (UIScreen.main.bounds.width / 8.3 / 2),
                            y: UIScreen.main.bounds.height / 18.45,
                            width: UIScreen.main.bounds.width / 8.3,
                            height: UIScreen.main.bounds.height / 18.45)
        return logo
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
    private let historyButton: UIButton = {
    let historyButton = UIButton()
    historyButton.setImage(UIImage(named: "profileLogoBlue"), for: .normal)
    historyButton.frame = CGRect(x: UIScreen.main.bounds.width / 1.2,
                                    y: UIScreen.main.bounds.height / 18.5,
                                    width: UIScreen.main.bounds.width / 8.5,
                                    height: UIScreen.main.bounds.height / 18.5)
    return historyButton
}()
    private let nameLabel: UILabel = {
       let nameLabel = UILabel()
        let textColor = UIColor(red: 36/255.0, green: 14/255.0, blue: 70/255.0, alpha: 0.7)
        nameLabel.text = "სახელი"
        nameLabel.textColor = textColor
        nameLabel.font = UIFont(name: "Helvetica", size: UIScreen.main.bounds.width / 27.857)
        nameLabel.frame = CGRect(x: UIScreen.main.bounds.width / 24.375,
                                 y: UIScreen.main.bounds.height / 5.741 ,
                                 width: UIScreen.main.bounds.width / 10.236 ,
                                 height: UIScreen.main.bounds.height / 56.266)
        return nameLabel
    }()
    private let nameAndSurnameLabel: UILabel = {
       let nameAndSurnameLabel = UILabel()
        let textColor = UIColor(red: 36/255.0, green: 14/255.0, blue: 70/255.0, alpha: 0.7)
        nameAndSurnameLabel.text = "John Appleased"
        nameAndSurnameLabel.font = UIFont(name: "Helvetica", size: UIScreen.main.bounds.width / 32.5)
        nameAndSurnameLabel.textColor = textColor
        nameAndSurnameLabel.frame = CGRect(x: UIScreen.main.bounds.width / 27.8571,
                                           y: UIScreen.main.bounds.height / 4.465,
                                           width: UIScreen.main.bounds.width / 3 ,
            height: UIScreen.main.bounds.height / 46.888)
        return nameAndSurnameLabel
    }()
    private let emailLabel: UILabel = {
       let emailLabel = UILabel()
        let textColor = UIColor(red: 36/255.0, green: 14/255.0, blue: 70/255.0, alpha: 0.7)
        emailLabel.text = "ელ. ფოსტა"
        emailLabel.font = UIFont(name: "Helvetica", size: UIScreen.main.bounds.width / 40)
        emailLabel.textColor = textColor
        emailLabel.frame = CGRect(x: UIScreen.main.bounds.width / 24.375 ,
                                  y: UIScreen.main.bounds.height / 3.417 ,
                                  width: UIScreen.main.bounds.width / 10.8333 ,
                                  height: UIScreen.main.bounds.height / 56.2666)
        return emailLabel
    }()
    private let userEmailLabel: UILabel = {
       let userEmailLabel = UILabel()
        let textColor = UIColor(red: 36/255.0, green: 14/255.0, blue: 70/255.0, alpha: 0.7)
        userEmailLabel.text = "Johndoe@gmail.com"
        userEmailLabel.font = UIFont(name: "Helvetica", size: UIScreen.main.bounds.width / 32.5)
        userEmailLabel.textColor = textColor
        userEmailLabel.frame = CGRect(x: UIScreen.main.bounds.width / 24.375 ,
                                      y: UIScreen.main.bounds.height / 2.920 ,
                                      width: UIScreen.main.bounds.width / 2.549 ,
                                      height: UIScreen.main.bounds.height / 49.647)
        return userEmailLabel
    }()
    private let editButton2: UIButton = {
       let editButton2 = UIButton()
        editButton2.setImage(UIImage(named: "editLogo"), for: .normal)
        editButton2.frame = CGRect(x: UIScreen.main.bounds.width / 1.150,
                                  y: UIScreen.main.bounds.height / 4.465 ,
                                  width: UIScreen.main.bounds.width / 19.5 ,
                                  height: UIScreen.main.bounds.height / 42.2 )
        editButton2.addTarget(self, action: #selector(editEmailButton2), for: .touchUpInside)
        return editButton2
    }()
    private let editButton: UIButton = {
       let editButton = UIButton()
        editButton.setImage(UIImage(named: "editLogo"), for: .normal)
        editButton.frame = CGRect(x: UIScreen.main.bounds.width / 1.150,
                                  y: UIScreen.main.bounds.height / 2.9407 ,
                                  width: UIScreen.main.bounds.width / 19.5 ,
                                  height: UIScreen.main.bounds.height / 42.2 )
        editButton.addTarget(self, action: #selector(editEmailButton), for: .touchUpInside)
        return editButton
    }()
    private let passwordLabel: UILabel = {
    let passwordLabel = UILabel()
        let textColor = UIColor(red: 36/255.0, green: 14/255.0, blue: 70/255.0, alpha: 0.7)
        passwordLabel.text = "პაროლი"
        passwordLabel.textColor = textColor
        passwordLabel.font = UIFont(name: "Helvetica", size: UIScreen.main.bounds.width / 40)
        passwordLabel.frame = CGRect(x: UIScreen.main.bounds.width / 24.375 ,
                                     y: UIScreen.main.bounds.height / 2.432276 ,
                                     width: UIScreen.main.bounds.width / 6.1904 ,
                                     height: UIScreen.main.bounds.height / 56.266)
        return passwordLabel
    }()
    private let changePasswordButton: UIButton = {
       let changePasswordButton = UIButton()
        changePasswordButton.setImage(UIImage(named: "changePassword"), for: .normal)
        changePasswordButton.frame = CGRect(x: UIScreen.main.bounds.width / 24.375 ,
                                            y: UIScreen.main.bounds.height / 2.180 ,
                                            width: UIScreen.main.bounds.width / 2.228 ,
                                            height: UIScreen.main.bounds.height / 20.095 )
        return changePasswordButton
    }()
    private let genderLabel: UILabel = {
       let genderlabel = UILabel()
        let textColor = UIColor(red: 36/255.0, green: 14/255.0, blue: 70/255.0, alpha: 0.7)
        genderlabel.text = "Gender"
        genderlabel.textColor = textColor
        genderlabel.font = UIFont(name: "Helvetica", size: 14)
        genderlabel.frame = CGRect(x: UIScreen.main.bounds.width / 24.375 ,
                                   y: UIScreen.main.bounds.height / 1.888 ,
                                   width: UIScreen.main.bounds.width / 8.125 ,
                                   height: UIScreen.main.bounds.height / 56.2666)
        return genderlabel
    }()
    private let maleGenderButton: UIButton = {
     let maleGenderButton = UIButton()
        maleGenderButton.setImage(UIImage(named: "maleButton"), for: .normal)
        maleGenderButton.frame = CGRect(x: UIScreen.main.bounds.width / 24.375,
                                        y: UIScreen.main.bounds.height / 1.769 ,
                                        width: UIScreen.main.bounds.width / 4.382 ,
                                        height: UIScreen.main.bounds.height / 20.095 )
        return maleGenderButton
    }()
    private let femaleGenderButton: UIButton = {
       let femaleGenderButton = UIButton()
        femaleGenderButton.setImage(UIImage(named: "femaleButton"), for: .normal)
        femaleGenderButton.frame = CGRect(x: UIScreen.main.bounds.width / 3.805 ,
                                          y: UIScreen.main.bounds.height /  1.769,
                                          width: UIScreen.main.bounds.width /  4.382,
                                          height: UIScreen.main.bounds.height /  20.0952)
        return femaleGenderButton
    }()
    private let languageLabel: UILabel = {
       let languageLabel = UILabel()
        let textColor = UIColor(red: 36/255.0, green: 14/255.0, blue: 70/255.0, alpha: 0.7)
        languageLabel.text = "Language"
        languageLabel.font = UIFont(name: "Helvetica", size: UIScreen.main.bounds.width / 27.857)
        languageLabel.textColor = textColor
        languageLabel.frame = CGRect(x: UIScreen.main.bounds.width / 23.5,
                                     y: UIScreen.main.bounds.height / 1.6,
                                     width: UIScreen.main.bounds.width / 6,
                                     height: UIScreen.main.bounds.height / 45)
        return languageLabel
    }()
    private let geLabel: UILabel = {
       let geLabel = UILabel()
        let textColor = UIColor(red: 36/255.0, green: 14/255.0, blue: 70/255.0, alpha: 0.7)
        geLabel.font = UIFont(name: "Helvetica", size: UIScreen.main.bounds.width / 27.857)
        geLabel.text = "ქარ."
        geLabel.textColor = textColor
        geLabel.frame = CGRect(x: UIScreen.main.bounds.width / 23.43,
                               y: UIScreen.main.bounds.height / 1.5,
                               width: UIScreen.main.bounds.width / 11.02,
                               height: UIScreen.main.bounds.height / 38.66)
        return geLabel
    }()
    private let enLabel: UILabel = {
       let enLabel = UILabel()
        let textColor = UIColor(red: 36/255.0, green: 14/255.0, blue: 70/255.0, alpha: 0.7)
        enLabel.text = "Eng."
        enLabel.font = UIFont(name: "Helvetica", size: UIScreen.main.bounds.width / 27.857)
        enLabel.textColor = textColor
        enLabel.frame = CGRect(x: UIScreen.main.bounds.width / 2.73,
                               y: UIScreen.main.bounds.height / 1.5,
                               width: UIScreen.main.bounds.width / 12.5,
                               height: UIScreen.main.bounds.height / 38.66)
        return enLabel
    }()
    private let toggleButton: UIImageView = {
       let toggleButton = UIImageView()
        toggleButton.image = UIImage(named: "languageButton")
        toggleButton.frame = CGRect(x: UIScreen.main.bounds.width / 7.6,
                                    y: UIScreen.main.bounds.height / 1.52,
                                    width: UIScreen.main.bounds.width / 4.52,
                                    height: UIScreen.main.bounds.height / 18.883)
        return toggleButton
    }()
//    private let headphoneLabel: UILabel = {
//       let headphoneLabel = UILabel()
//        headphoneLabel.text = "if you can put your headphones on, if its not possible you can mute sound"
//        headphoneLabel.textAlignment = .left
//        headphoneLabel.numberOfLines = 2
//        headphoneLabel.textColor = .systemPurple
//        headphoneLabel.font = UIFont(name: "Helvetica", size: UIScreen.main.bounds.width / 30.857)
//        headphoneLabel.frame = CGRect(x: UIScreen.main.bounds.width / 15.5,
//                                      y: UIScreen.main.bounds.height / 1.52,
//                                      width: UIScreen.main.bounds.width / 1.5,
//                                      height: UIScreen.main.bounds.height / 4.8)
//        return headphoneLabel
//    }()
//    private let muteButton: UIButton = {
//       let muteButton = UIButton()
//        muteButton.setImage(UIImage(named: "mute"), for: .normal)
//        muteButton.frame = CGRect(x: UIScreen.main.bounds.width / 23.4,
//                                  y: UIScreen.main.bounds.height / 1.18,
//                                  width: UIScreen.main.bounds.width / 8.9,
//                                  height: UIScreen.main.bounds.height / 19.33)
//        return muteButton
//    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(patternImage: UIImage(named: "backgroundProfile")!)
        fetchUserName(myLabel: nameAndSurnameLabel)
        view.addSubview(logo)
        view.addSubview(backButton)
        view.addSubview(historyButton)
        view.addSubview(nameLabel)
        view.addSubview(nameAndSurnameLabel)
        view.addSubview(emailLabel)
        view.addSubview(userEmailLabel)
        view.addSubview(editButton)
        view.addSubview(passwordLabel)
        view.addSubview(changePasswordButton)
        view.addSubview(genderLabel)
        view.addSubview(maleGenderButton)
        view.addSubview(femaleGenderButton)
        view.addSubview(languageLabel)
        view.addSubview(geLabel)
        view.addSubview(enLabel)
        view.addSubview(toggleButton)
//        view.addSubview(headphoneLabel)
//        view.addSubview(muteButton)
        view.addSubview(editButton2)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
      
    }
    @objc func dismissViewController() {
        dismiss(animated: false, completion: nil)
    }
    @objc func editEmailButton() {
       showAlert(title1: "Change Email", title2: "Put your new Email below", placeholder: "Type Email")
    }
    @objc func editEmailButton2() {
       showAlert(title1: "Change Name", title2: "Put your new Name below", placeholder: "Type Name")
    }
    func showAlert(title1: String, title2: String, placeholder: String) {
        var alertTextField = UITextField()
        let alert = UIAlertController(title: title1, message: title2, preferredStyle: UIAlertController.Style.alert)
        alert.addTextField { (textField : UITextField) -> Void in
            textField.placeholder = placeholder
            alertTextField = textField
        }
        alert.addAction(UIAlertAction(title: "Change", style: UIAlertAction.Style.default) {action in
            changeData(newName: alertTextField.text ?? "")
        })
        
        
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil))
        self.present(alert, animated: false, completion: nil)
        
    }
}
