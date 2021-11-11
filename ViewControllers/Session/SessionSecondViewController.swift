//
//  SessionSecondViewController.swift
//  NeuroPilot
//
//  Created by Kakha Sepashvili on 19.10.21.
//

import UIKit
import Lottie

class SessionSecondViewController: UIViewController {
    var selectedRoot = rootController.problem
//    var selectedRoot = rootController.problem1Session3
    func enumUsability() {
        switch selectedRoot {
        case .problem:
            setUpAnimation(name: animationNames[clickIndex], text: animationTexts[clickIndex])
        case .emotional:
            setUpAnimation(name: animationProblem2[clickIndex], text: animationProblem2Text[clickIndex])
        case .physical:
            print("not yet ready")
        case .problem1Session2:
            setUpAnimation(name: animationNames2[clickIndex], text: animationTexts2[clickIndex])
        case .problem1Session3:
            setUpAnimation(name: animationNames3[clickIndex], text: animationTexts3[clickIndex])
        case .problem2Session2:
            setUpAnimation(name: animationProblem2S2[clickIndex], text: animationProblem2TextS2[clickIndex])
        case .problem2Session3:
            setUpAnimation(name: animationProblem2S3[clickIndex], text: animationProblem2TextS3[clickIndex])
        }
    }
    var clickIndex = 0
    private let homeButton: UIButton = {
        let homeButton = UIButton()
        homeButton.setImage(UIImage(named: "homeLogo"), for: .normal)
        homeButton.frame = CGRect(x: UIScreen.main.bounds.width / 1.2, y: UIScreen.main.bounds.height / 18.18, width: UIScreen.main.bounds.width / 8.84, height: UIScreen.main.bounds.height / 15)
        homeButton.addTarget(self, action: #selector(dismissViewController), for: .touchUpInside)
        return homeButton
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
    private let mainText: UILabel = {
       let mainText = UILabel()
        mainText.textAlignment = .center
        mainText.numberOfLines = 8
        if UIScreen.main.bounds.height <= 812.0 {
            mainText.font = UIFont(name: "FiraGO-Regular", size: 12)
        } else {
            mainText.font = UIFont(name: "FiraGO-Regular", size: 16)
        }
        mainText.textColor = UIColor(red: 36/255.0, green: 14/255.0, blue: 70/255.0, alpha: 1.0)
        mainText.frame = CGRect(x: (UIScreen.main.bounds.width / 2) - (UIScreen.main.bounds.width / 1.23 / 2),
                                y: UIScreen.main.bounds.height / 1.7,
                                width: UIScreen.main.bounds.width / 1.23,
                                height: UIScreen.main.bounds.height / 5)
        return mainText
    }()
    private let nextButton: UIButton =  {
        let nextButton = UIButton()
        nextButton.setImage(UIImage(named: "nextButton"), for: .normal)
        nextButton.frame = CGRect(x: (UIScreen.main.bounds.width / 2) - (UIScreen.main.bounds.width / 1.1 / 2), y: UIScreen.main.bounds.height / 1.2, width: UIScreen.main.bounds.width / 1.1, height: UIScreen.main.bounds.height / 11)
        nextButton.addTarget(self, action: #selector(nextButtonPressed), for: .touchUpInside)
        return nextButton
    }()
    private let muteButton: UIButton = {
       let muteButton = UIButton()
        muteButton.setImage(UIImage(named: "sessionMuteButton"), for: .normal)
        muteButton.frame = CGRect(x: (UIScreen.main.bounds.width / 2) - (UIScreen.main.bounds.width / 8.93 / 2), y: UIScreen.main.bounds.height / 1.28, width: UIScreen.main.bounds.width / 8.93, height: UIScreen.main.bounds.height / 19.3)
        return muteButton
    }()
    private let replayButton: UIButton = {
       let replayButton = UIButton()
        replayButton.setImage(UIImage(named: "LottieReplay"), for: .normal)
        replayButton.frame = CGRect(x: UIScreen.main.bounds.width / 1.2,
                                    y: UIScreen.main.bounds.height / 1.88,
                                    width: UIScreen.main.bounds.width / 8,
                                    height: UIScreen.main.bounds.height / 8)
        replayButton.addTarget(self, action: #selector(replayButtonPressed), for: .touchUpInside)
        return replayButton
    }()
    private var animationView: AnimationView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        enumUsability()
        let backgroundColor = UIColor(red: 255/255.0, green: 252/255.0, blue: 245/255.0, alpha: 1.0)
        view.backgroundColor = backgroundColor
        view.addSubview(homeButton)
        view.addSubview(backButton)
        view.addSubview(mainText)
        view.addSubview(nextButton)
        view.addSubview(muteButton)
    }
    @objc func replayButtonPressed() {
        animationView!.isHidden = true
        if selectedRoot == .problem {
            setUpAnimation(name: animationNames[clickIndex], text: animationTexts[clickIndex])
        } else if selectedRoot == .emotional {
            setUpAnimation(name: animationProblem2[clickIndex], text: animationProblem2Text[clickIndex])
        } else if selectedRoot == .problem1Session2 {
            setUpAnimation(name: animationNames2[clickIndex], text: animationTexts2[clickIndex])
        } else if selectedRoot == .problem1Session3 {
            setUpAnimation(name: animationNames3[clickIndex], text: animationTexts3[clickIndex])
        } else if selectedRoot == .problem2Session2 {
            setUpAnimation(name: animationProblem2S2[clickIndex], text: animationProblem2TextS2[clickIndex])
        } else if selectedRoot == .problem2Session3 {
            setUpAnimation(name: animationProblem2S3[clickIndex], text: animationProblem2TextS3[clickIndex])
        }
        
      }
  
    @objc func dismissViewController() {
        let vc = SessionViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: false)
    }
    @objc func nextButtonPressed() {
        clickIndex += 1
        animationView?.isHidden = true
        replayButton.isHidden = true
        if selectedRoot == .problem {
        
            buttonClickConfig(quantity: animationNames.count, namesAnimation: animationNames[clickIndex], textAnimation: animationTexts[clickIndex])
        } else if selectedRoot == .emotional {
            buttonClickConfig(quantity: animationProblem2.count, namesAnimation: animationProblem2[clickIndex], textAnimation: animationProblem2Text[clickIndex])
        } else if selectedRoot == .problem1Session2 {
            buttonClickConfig(quantity: animationNames2.count, namesAnimation: animationNames2[clickIndex], textAnimation: animationTexts2[clickIndex])
        } else if selectedRoot == .problem1Session3 {
            buttonClickConfig(quantity: animationNames3.count, namesAnimation: animationNames3[clickIndex], textAnimation: animationTexts3[clickIndex])
        } else if selectedRoot == .problem2Session2 {
            buttonClickConfig(quantity: animationProblem2S2.count, namesAnimation: animationProblem2S2[clickIndex], textAnimation: animationProblem2TextS2[clickIndex])
        } else if selectedRoot == .problem2Session3 {
            buttonClickConfig(quantity: animationProblem2S3.count, namesAnimation: animationProblem2S3[clickIndex], textAnimation: animationProblem2TextS3[clickIndex])
        }
    }
    
    func buttonClickConfig(quantity: Int, namesAnimation: String, textAnimation: String) {
        if clickIndex < quantity - 1 {
            setUpAnimation(name: namesAnimation, text: textAnimation)
        } else if clickIndex == quantity - 1  {
            let vc = PurchasePageViewController()
            vc.whichRoot = selectedRoot
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true)
        }
    }
  
    func setUpAnimation(name: String, text: String) {
        self.nextButton.isEnabled = false
        self.nextButton.alpha = 0.6
        animationView = .init(name: name)
        mainText.text = text
        view.addSubview(animationView!)
        animationView!.frame = CGRect(x: (UIScreen.main.bounds.width / 2) - (UIScreen.main.bounds.width / 1.1 / 2),
                                      y: UIScreen.main.bounds.height / 8,
                                      width: UIScreen.main.bounds.width / 1.1,
                                      height: UIScreen.main.bounds.height / 2.3)
        animationView!.contentMode = .scaleAspectFit
        animationView!.loopMode = .playOnce
        animationView!.play { finished in
            self.view.addSubview(self.replayButton)
            self.replayButton.isHidden = false
            self.nextButton.isEnabled = true
            self.nextButton.alpha = 1
        }
    }
}
