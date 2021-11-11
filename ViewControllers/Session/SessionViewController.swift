//
//  sessionViewController.swift
//  NeuroPilot
//
//  Created by Kakha Sepashvili on 19.10.21.
//

import UIKit
import Lottie

class SessionViewController: UIViewController {
    
    var currentRoot = rootController.problem
    func enumUsability() {
        switch currentRoot {
        case .problem:
            setUpAnimation(name: "beforeSession")
        case .emotional:
            setUpAnimation(name: "beforeSession")
        case .physical:
            print("not yet ready")
        case .problem1Session2:
           setUpAnimation(name: "beforeSession")
        case .problem1Session3:
            setUpAnimation(name: "beforeSession")
        case .problem2Session2:
            setUpAnimation(name: "beforeSession")
        case .problem2Session3:
            setUpAnimation(name: "beforeSession")
        }
    }

    private var animationView: AnimationView?
    private let homeButton: UIButton = {
        let homeButton = UIButton()
        homeButton.setImage(UIImage(named: "homeLogo"), for: .normal)
        homeButton.frame = CGRect(x: UIScreen.main.bounds.width / 1.2, y: UIScreen.main.bounds.height / 18.18, width: UIScreen.main.bounds.width / 8.84, height: UIScreen.main.bounds.height / 19.18)
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
    private let greetingText: UILabel = {
       let greetingText = UILabel()
        greetingText.text = "მოგესალმები!"
        greetingText.textAlignment = .center
        greetingText.textColor = UIColor(red: 36/255.0, green: 14/255.0, blue: 70/255.0, alpha: 1.0)
        greetingText.frame = CGRect(x: (UIScreen.main.bounds.width / 2) - (UIScreen.main.bounds.width / 3.07 / 2), y: UIScreen.main.bounds.height / 2.3, width: UIScreen.main.bounds.width / 3.07, height: UIScreen.main.bounds.height / 36.9)
        return greetingText
    }()
    private let mainText: UILabel = {
       let mainText = UILabel()
        mainText.text = "წარმოიდგინე საკუთარი თავის ტვინი, შენს წინ 3D განზომილებაში. ნატურალური ტვინის მსგავსია, მოვარდისფრო, სველი ზედაპირით, ნაოჭებიანი, რბილი, ნელა დაატრიალე და დაათვალიერე ყველა მხრიდან."
        mainText.font = UIFont(name: "FiraGO-Regular", size: 14)
        mainText.textAlignment = .center
        mainText.numberOfLines = 5
        mainText.textColor = UIColor(red: 36/255.0, green: 14/255.0, blue: 70/255.0, alpha: 1.0)
        mainText.frame = CGRect(x: (UIScreen.main.bounds.width / 2) - (UIScreen.main.bounds.width / 1.09 / 2),
                                y: UIScreen.main.bounds.height / 2.04,
                                width: UIScreen.main.bounds.width / 1.09,
                                height: UIScreen.main.bounds.height / 6.15)
        return mainText
    }()
    private let remark: UILabel = {
       let remark = UILabel()
        remark.text = "*სესიის დასრულების  შემდეგ 4 დღის განმავლობაში ვერ გადახვალთ შემდეგ სესიაზე"
        remark.textAlignment = .center
        remark.numberOfLines = 2
        remark.font = UIFont(name: "FiraGO-Regular", size: 12)
        remark.textColor = UIColor(red: 134/255.0, green: 89/255.0, blue: 165/255.0, alpha: 1.0)
        remark.frame = CGRect(x: (UIScreen.main.bounds.width / 2) - (UIScreen.main.bounds.width / 1.25 / 2),
                                y: UIScreen.main.bounds.height / 1.484,
                                width: UIScreen.main.bounds.width / 1.25,
                                height: UIScreen.main.bounds.height / 20)
        return remark
    }()
    private let beginButton: UIButton =  {
        let beginButton = UIButton()
        beginButton.setImage(UIImage(named: "beginButton"), for: .normal)
        beginButton.frame = CGRect(x: (UIScreen.main.bounds.width / 2) - (UIScreen.main.bounds.width / 1.09 / 2), y: UIScreen.main.bounds.height / 1.3, width: UIScreen.main.bounds.width / 1.09, height: UIScreen.main.bounds.height / 12.3)
        beginButton.addTarget(self, action: #selector(beginButtonPressed), for: .touchUpInside)
        return beginButton
    }()
    private let muteButton: UIButton = {
       let muteButton = UIButton()
        muteButton.setImage(UIImage(named: "sessionMuteButton"), for: .normal)
        muteButton.frame = CGRect(x: (UIScreen.main.bounds.width / 2) - (UIScreen.main.bounds.width / 8.93 / 2), y: UIScreen.main.bounds.height / 1.12, width: UIScreen.main.bounds.width / 8.93, height: UIScreen.main.bounds.height / 19.3)
        return muteButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        enumUsability()
        let backgroundColor = UIColor(red: 255/255.0, green: 252/255.0, blue: 245/255.0, alpha: 1.0)
        view.backgroundColor = backgroundColor
        
        view.addSubview(homeButton)
        view.addSubview(backButton)
//        view.addSubview(logoImage)
        view.addSubview(greetingText)
        view.addSubview(mainText)
        view.addSubview(remark)
        view.addSubview(beginButton)
        view.addSubview(muteButton)
       
    }
    func setUpAnimation(name: String) {
        animationView = .init(name: name)
        view.addSubview(animationView!)
        animationView!.frame = CGRect(x: (UIScreen.main.bounds.width / 2) - (UIScreen.main.bounds.width / 1.588 / 2),
                                      y: UIScreen.main.bounds.height / 8.24,
                                      width: UIScreen.main.bounds.width / 1.588,
                                      height: UIScreen.main.bounds.height / 3.8)
        animationView!.contentMode = .scaleAspectFit
        animationView!.loopMode = .loop
        animationView!.play()
    }
  
    @objc func dismissViewController() {
        let vc = firstPageViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: false)
    }
    @objc func beginButtonPressed() {
        let vc = SessionSecondViewController()
        vc.clickIndex = 0
        vc.selectedRoot = currentRoot
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: false)
    }
}
