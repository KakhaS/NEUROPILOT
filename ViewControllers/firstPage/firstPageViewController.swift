//
//  firstPageViewController.swift
//  NeuroPilot
//
//  Created by Kakha Sepashvili on 03.09.21.
//

import UIKit
import Firebase
import GoogleSignIn
import FirebaseAuth

class firstPageViewController: UIViewController {
    private let backgroundWhite: UIImageView = {
       let backgroundWhite = UIImageView()
        backgroundWhite.image = UIImage(named: "backgroundWhite")
        backgroundWhite.frame = CGRect(x: (UIScreen.main.bounds.width / 2) - ( UIScreen.main.bounds.width / 1.1 / 2),
                                       y: UIScreen.main.bounds.height / 8.2,
                                       width: UIScreen.main.bounds.width / 1.1,
                                       height: UIScreen.main.bounds.height / 2.88)
        return backgroundWhite
    }()
    private let logo: UIImageView = {
        let logo = UIImageView()
        logo.image = UIImage(named: "logoTrans")
        logo.frame = CGRect(x: UIScreen.main.bounds.width / 1.57,
                            y: UIScreen.main.bounds.height / 6.88,
                            width: UIScreen.main.bounds.width / 3.23,
                            height: UIScreen.main.bounds.height / 7.116)
        return logo
    }()
    private let goodDayLabel: UILabel = {
       let goodDayLabel = UILabel()
        let textColor = UIColor(red: 36/255.0, green: 14/255.0, blue: 70/255.0, alpha: 1.0)
        goodDayLabel.text = "გამარჯობა"
        goodDayLabel.textColor = textColor
        goodDayLabel.textAlignment = .left
        goodDayLabel.font = UIFont(name: "FiraGO-Regular", size: 14)
        goodDayLabel.frame = CGRect(x: UIScreen.main.bounds.width / 16.3,
                                    y: UIScreen.main.bounds.height / 5.8,
                                    width: UIScreen.main.bounds.width / 1.9,
                                    height: UIScreen.main.bounds.height / 42.7)
        return goodDayLabel
    }()
    private let nameLabel: UILabel = {
        let nameLabel = UILabel()
        let textColor = UIColor(red: 36/255.0, green: 14/255.0, blue: 70/255.0, alpha: 1.0)
        nameLabel.textColor = textColor
        nameLabel.textAlignment = .left
        nameLabel.font = UIFont(name: "FiraGO-Regular", size: 22)
        nameLabel.frame = CGRect(x: UIScreen.main.bounds.width / 16.3,
                                 y: UIScreen.main.bounds.height / 4.2,
                                 width: UIScreen.main.bounds.width / 3.5,
                                 height: UIScreen.main.bounds.height / 21.4)
        return nameLabel
    }()
    private let generalLabel: UILabel = {
        let generalLabel = UILabel()
        let textColor = UIColor(red: 36/255.0, green: 14/255.0, blue: 70/255.0, alpha: 1.0)
        generalLabel.text = "გთხოვ მოკალათდე კომფორტულად და მიჰყევი ინსტრუქციას."
        generalLabel.textColor = textColor
        generalLabel.numberOfLines = 4
        generalLabel.textAlignment = .left
        generalLabel.font = UIFont(name: "FiraGO-Regular", size: 16)
        generalLabel.frame = CGRect(x: UIScreen.main.bounds.width / 16.3,
                                 y: UIScreen.main.bounds.height / 3.25,
                                 width: UIScreen.main.bounds.width / 1.16,
                                 height: UIScreen.main.bounds.height / 7.25)
        return generalLabel
    }()
    private let signOut: UIButton = {
       let signOut = UIButton()
        signOut.setTitle("გამოსვლა", for: .normal)
        signOut.setTitleColor(.systemBlue, for: .normal)
        signOut.setTitleColor(.systemBlue, for: .highlighted)
        
        signOut.frame = CGRect(x: UIScreen.main.bounds.width / 97.25,
                                  y: UIScreen.main.bounds.height / 18.18,
                                  width: UIScreen.main.bounds.width / 4.84,
                                  height: UIScreen.main.bounds.height / 24.18)
        signOut.addTarget(self, action: #selector(signOutButton), for: .touchUpInside)
        return signOut
    }()
//    private let headphoneLabel: UILabel = {
//       let headphoneLabel = UILabel()
//        headphoneLabel.textColor = .systemBlue
//        headphoneLabel.numberOfLines = 2
//        headphoneLabel.textAlignment = .center
//        headphoneLabel.text = "If you can put your headphones on, If it's not possible you can mute sound."
//        headphoneLabel.font = UIFont(name: "Helvetica", size: 12)
//        headphoneLabel.frame = CGRect(x: UIScreen.main.bounds.width /  5.27,
//                                      y: UIScreen.main.bounds.height / 1.2,
//                                      width: UIScreen.main.bounds.width / 1.61157,
//                                      height: UIScreen.main.bounds.height / 26.375)
//        return headphoneLabel
//    }()
    private let muteButton: UIButton = {
       let muteButton = UIButton()
        muteButton.setImage(UIImage(named: "mute"), for: .normal)
        muteButton.frame = CGRect(x: UIScreen.main.bounds.width / 2.2413,
                                  y: UIScreen.main.bounds.height / 1.106,
                                  width: UIScreen.main.bounds.width / 9.285,
                                  height: UIScreen.main.bounds.height / 20.095)
        return muteButton
    }()
    private let profileButton: UIButton = {
    let profileButton = UIButton()
    profileButton.setImage(UIImage(named: "profileLogo"), for: .normal)
    profileButton.frame = CGRect(x: UIScreen.main.bounds.width / 24.375,
                                    y: UIScreen.main.bounds.height / 10.9846 ,
                                    width: UIScreen.main.bounds.width / 8.833,
                                    height: UIScreen.main.bounds.height / 21.4444)
    profileButton.addTarget(self, action: #selector(profileButtonTapped), for: .touchUpInside)
    return profileButton
}()
    private let historyButton: UIButton = {
       let historyButton = UIButton()
        historyButton.setImage(UIImage(named: "historyLogo"), for: .normal)
        historyButton.frame = CGRect(x: UIScreen.main.bounds.width / 1.153846,
                                     y: UIScreen.main.bounds.height / 10.9846,
                                     width: UIScreen.main.bounds.width / 8.833,
                                     height: UIScreen.main.bounds.height / 21.4444)
        return historyButton
    }()
    private let logoSmall: UIImageView = {
       let logoSmall = UIImageView()
        logoSmall.image = UIImage(named: "logoSmall")
        logoSmall.frame = CGRect(x: UIScreen.main.bounds.width / 23.4,
                                 y: UIScreen.main.bounds.height / 1.95,
                                 width: UIScreen.main.bounds.width / 8.5,
                                 height: UIScreen.main.bounds.height / 20)
        return logoSmall
    }()
    private let chooseLabel: UILabel = {
        let chooseLabel = UILabel()
        chooseLabel.text = "Choose your Gender"
        chooseLabel.textColor = .orange
        chooseLabel.font = UIFont(name: "FiraGO-Regular", size: 16)
        chooseLabel.frame = CGRect(x: UIScreen.main.bounds.width / 5.6,
                                     y: UIScreen.main.bounds.height / 1.94,
                                     width: UIScreen.main.bounds.width / 1.52,
                                     height: UIScreen.main.bounds.height / 33.83)
        return chooseLabel
    }()
    private let backgroundWhite2: UIImageView = {
       let backgroundWhite2 = UIImageView()
        backgroundWhite2.image = UIImage(named: "newBackgroundWhite")
        backgroundWhite2.frame = CGRect(x: UIScreen.main.bounds.width / 23.43,
                                        y: UIScreen.main.bounds.height / 1.71,
                                        width: UIScreen.main.bounds.width / 1.1,
                                        height: UIScreen.main.bounds.height / 5.4)
        return backgroundWhite2
    }()
    private let label1: UILabel = {
       let label1 = UILabel()
        let textColor = UIColor(red: 36/255.0, green: 14/255.0, blue: 70/255.0, alpha: 1.0)
        label1.text = "სულ ცოტა დაგრჩა ადგილი სადაც გაჩერდა"
        label1.numberOfLines = 2
        label1.textAlignment = .left
        label1.textColor = textColor
        label1.font = UIFont(name: "FiraGO-Regular", size: 16)
        label1.frame = CGRect(x: UIScreen.main.bounds.width / 16.3,
                              y: UIScreen.main.bounds.height / 1.65,
                              width: UIScreen.main.bounds.width / 1.8,
                              height: UIScreen.main.bounds.height / 19.8)
        return label1
    }()
    private let label2: UILabel = {
       let label2 = UILabel()
        let textColor = UIColor(red: 36/255.0, green: 14/255.0, blue: 70/255.0, alpha: 1.0)
        label2.text = "შემდეგ სესიამდე დარჩა 2 დღე"
        label2.textAlignment = .left
        label2.numberOfLines = 2
        label2.textColor = textColor
        label2.font = UIFont(name: "Helvetica", size: 16)
        label2.frame = CGRect(x: UIScreen.main.bounds.width / 16.3,
                              y: UIScreen.main.bounds.height / 1.45,
                              width: UIScreen.main.bounds.width / 2.8,
                              height: UIScreen.main.bounds.height / 15.92)
        return label2
    }()
    private let nextButton: UIButton = {
       let nextButton = UIButton()
        nextButton.setImage(UIImage(named: "arrowRight"), for: .normal)
        nextButton.frame = CGRect(x: UIScreen.main.bounds.width / 1.31,
                                  y: UIScreen.main.bounds.height / 1.44,
                                  width: UIScreen.main.bounds.width / 8.9,
                                  height: UIScreen.main.bounds.height / 19.3)
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        return nextButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let backgroundColor = UIColor(red: 255/255.0, green: 252/255.0, blue: 245/255.0, alpha: 1.0)
        view.backgroundColor = backgroundColor
        view.addSubview(backgroundWhite)
        view.addSubview(logo)
        view.addSubview(goodDayLabel)
        view.addSubview(nameLabel)
        view.addSubview(generalLabel)
        view.addSubview(signOut)
//        view.addSubview(headphoneLabel)
        view.addSubview(muteButton)
        view.addSubview(profileButton)
        view.addSubview(historyButton)
        view.addSubview(logoSmall)
        view.addSubview(chooseLabel)
        view.addSubview(backgroundWhite2)
        view.addSubview(label1)
        view.addSubview(label2)
        view.addSubview(nextButton)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
        fetchUserName(myLabel: nameLabel)
    }
    @objc func signOutButton() {
   GIDSignIn.sharedInstance().signOut()
        do {
        try!   Auth.auth().signOut()
        }
        let vc = loginViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: false)
    }
    @objc func profileButtonTapped() {
        let vc = profileViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: false, completion: nil)
    }
    @objc func nextButtonTapped() {
        let vc = QuestionsPageViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: false, completion: nil)
    }
}
