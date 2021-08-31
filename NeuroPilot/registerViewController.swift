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
        bigLabel.font = UIFont(name: "FiraGO", size: 30)
        bigLabel.numberOfLines = 2
        bigLabel.frame = CGRect(x: UIScreen.main.bounds.width / 8.104,
                                y: UIScreen.main.bounds.height / 6.806,
                                width: UIScreen.main.bounds.width /  1.389,
                                height: UIScreen.main.bounds.height /  10.55)
        return bigLabel
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
        view.backgroundColor = .white
        view.addSubview(backButton)
        view.addSubview(bigLabel)
    }
    @objc func dismissViewController() {
        dismiss(animated: false)
    }
}
