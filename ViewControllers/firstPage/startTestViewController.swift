//
//  startTestViewController.swift
//  NeuroPilot
//
//  Created by Kakha Sepashvili on 29.09.21.
//

import UIKit

class startTestViewController: UIViewController {
    public var completionHandler: ((String) -> Void)?
    let backgroundColor = UIColor(red: 255/255.0, green: 252/255.0, blue: 245/255.0, alpha: 1.0)
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
    private let bigLogo: UIImageView = {
       let bigLogo = UIImageView()
        bigLogo.image = UIImage(named: "bigLogo")
        bigLogo.frame = CGRect(x: ( UIScreen.main.bounds.width / 2 ) - (UIScreen.main.bounds.width / 1.824 / 2),
                               y: UIScreen.main.bounds.height / 10.02,
                               width: UIScreen.main.bounds.width / 1.824,
                               height: UIScreen.main.bounds.height / 3.26)
        return bigLogo
    }()
    private let labelFirst: UILabel = {
       let labelFirst = UILabel()
        labelFirst.text = "ტესტის პასუხი"
        labelFirst.textAlignment = .center
        labelFirst.textColor = UIColor(red: 36/255.0, green: 14/255.0, blue: 70/255.0, alpha: 1.0)
        labelFirst.font = UIFont(name: "FiraGO-Regular", size: 18)
        labelFirst.frame = CGRect(x: (UIScreen.main.bounds.width / 2) - (UIScreen.main.bounds.width / 2.57 / 2),
                                  y: UIScreen.main.bounds.height / 2,
                                  width: UIScreen.main.bounds.width / 2.57,
                                  height: UIScreen.main.bounds.height / 31.23)
        return labelFirst
    }()
     var labelSecond: UILabel = {
       var labelSecond = UILabel()
//        labelSecond.text = "მიღებული ინფორმაცია არის კვლევის მონაცემები ზოგადი მდგომარეობის შესასწავლად. მაგ.: შფოთვის, დეპრესიის და დაბალი თვითსეფასების ზღვარის განსასაზღვრად."
        labelSecond.textAlignment = .center
        labelSecond.numberOfLines = 6
        labelSecond.textColor = UIColor(red: 36/255.0, green: 14/255.0, blue: 70/255.0, alpha: 1.0)
        labelSecond.font = UIFont(name: "FiraGO-Regular", size: 16)
        labelSecond.frame = CGRect(x: (UIScreen.main.bounds.width / 2) - (UIScreen.main.bounds.width / 2 / 1.45),
                                   y: UIScreen.main.bounds.height / 1.87,
                                   width: UIScreen.main.bounds.width / 1.45,
                                   height: UIScreen.main.bounds.height / 4.64)
        return labelSecond
    }()
    private let startButton: UIButton = {
        let startButton = UIButton()
        startButton.setImage(UIImage(named: "startButton"), for: .normal)
        startButton.frame = CGRect(x: (UIScreen.main.bounds.width / 2) - (UIScreen.main.bounds.width / 1.1 / 2),
                                   y: UIScreen.main.bounds.height / 1.25,
                                   width: UIScreen.main.bounds.width / 1.1,
                                   height: UIScreen.main.bounds.height / 12.3)
        startButton.addTarget(self, action: #selector(startButtonPressed), for: .touchUpInside)
        
        return startButton
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = backgroundColor
        
        view.addSubview(backButton)
        view.addSubview(bigLogo)
        view.addSubview(labelFirst)
        view.addSubview(labelSecond)
        view.addSubview(startButton)
    }
    @objc func dismissViewController() {
        presentViewController(myView: QuestionsPageViewController())
    }
    @objc func startButtonPressed() {
        presentViewController(myView: taskViewController())
    }
    func presentViewController(myView: UIViewController) {
        let vc = myView
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: false)
    }
}
