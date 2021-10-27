//
//  BankPageViewController.swift
//  NeuroPilot
//
//  Created by Kakha Sepashvili on 15.10.21.
//

import UIKit
import Lottie

class BankPageViewController: UIViewController {

    private let bankLogo: UIImageView = {
       let bankLogo = UIImageView()
        bankLogo.image = UIImage(named: "bankLogo")
        bankLogo.frame = CGRect(x: (UIScreen.main.bounds.width / 2) - (UIScreen.main.bounds.width / 1.89 / 2),
                                y: UIScreen.main.bounds.height / 14,
                                width: UIScreen.main.bounds.width / 1.89,
                                height: UIScreen.main.bounds.height / 8)
        return bankLogo
    }()
    private let amountLabel: UILabel = {
       let amountLabel = UILabel()
        amountLabel.text = "თანხა"
        amountLabel.textAlignment = .left
        amountLabel.textColor = .lightGray
        amountLabel.font = UIFont(name: "Helvetica", size: 16)
        amountLabel.frame = CGRect(x: UIScreen.main.bounds.width / 6,
                                   y: UIScreen.main.bounds.height / 6.5,
                                   width: UIScreen.main.bounds.width / 1.89,
                                   height: UIScreen.main.bounds.height / 8)
        return amountLabel
    }()
    private let gelLabel: UILabel = {
       let gelLabel = UILabel()
        gelLabel.text = "0.00 ₾"
        gelLabel.textAlignment = .left
        gelLabel.textColor = .lightGray
        gelLabel.font = UIFont(name: "Helvetica", size: 16)
        gelLabel.frame = CGRect(x: UIScreen.main.bounds.width / 1.4,
                                   y: UIScreen.main.bounds.height / 6.5,
                                   width: UIScreen.main.bounds.width / 1.89,
                                   height: UIScreen.main.bounds.height / 8)
        return gelLabel
    }()
    private let payLabel: UILabel = {
       let payLabel = UILabel()
        payLabel.text = "გადაიხადე ბარათით"
        payLabel.textColor = .orange
        payLabel.textAlignment = .center
        payLabel.font = UIFont(name: "Helvetica", size: 18)
        payLabel.frame = CGRect(x: (UIScreen.main.bounds.width / 2) - (UIScreen.main.bounds.width / 1.89 / 2),
                                y: UIScreen.main.bounds.height / 4.5,
                                width: UIScreen.main.bounds.width / 1.89,
                                height: UIScreen.main.bounds.height / 8)
        return payLabel
    }()
    private let cardNumber: UITextField = {
       let cardNumber = UITextField()
        cardNumber.placeholder = "ბარათის ნომერი"
        cardNumber.layer.cornerRadius =  5
        cardNumber.layer.borderColor = UIColor.lightGray.cgColor
        cardNumber.layer.borderWidth = 2
        let leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 10, height: 0))
              cardNumber.leftView = leftView
              cardNumber.leftViewMode = .always
        cardNumber.frame = CGRect(x: (UIScreen.main.bounds.width / 2 ) - (UIScreen.main.bounds.width / 1.15 / 2) ,
                                  y: UIScreen.main.bounds.height / 3,
                                  width:  UIScreen.main.bounds.width / 1.15,
                                  height: UIScreen.main.bounds.height / 18)
        return cardNumber
    }()
    private let validityField: UITextField = {
       let validityField = UITextField()
        validityField.placeholder = "მოქმედების ვადა"
        validityField.layer.cornerRadius =  5
        validityField.layer.borderColor = UIColor.lightGray.cgColor
        validityField.layer.borderWidth = 2
        let leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 5, height: 0))
        validityField.leftView = leftView
        validityField.leftViewMode = .always
        validityField.frame = CGRect(x: UIScreen.main.bounds.width / 16,
                                     y: UIScreen.main.bounds.height / 2.4,
                                     width:  UIScreen.main.bounds.width / 2.4,
                                  height: UIScreen.main.bounds.height / 20)
        return validityField
    }()
    private let CVV2: UITextField = {
       let CVV2 = UITextField()
        CVV2.placeholder = "CVV2"
        CVV2.layer.cornerRadius =  5
        CVV2.layer.borderColor = UIColor.lightGray.cgColor
        CVV2.layer.borderWidth = 2
        let leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 5, height: 0))
        CVV2.leftView = leftView
        CVV2.leftViewMode = .always
        CVV2.frame = CGRect(x: UIScreen.main.bounds.width / 1.9,
                                     y: UIScreen.main.bounds.height / 2.4,
                                     width:  UIScreen.main.bounds.width / 2.4,
                                  height: UIScreen.main.bounds.height / 20)
        return CVV2
    }()
    private let payButton: UIButton = {
       let payButton = UIButton()
        payButton.setImage(UIImage(named: "payButton"), for: .normal)
        payButton.frame = CGRect(x: (UIScreen.main.bounds.width / 2) - (UIScreen.main.bounds.width / 1.2 / 2),
                                 y: UIScreen.main.bounds.height / 1.8,
                                 width: UIScreen.main.bounds.width / 1.2,
                                 height: UIScreen.main.bounds.height / 6)
        payButton.addTarget(self, action: #selector(payPressed), for: .touchUpInside)
        return payButton
    }()
    private let visaImage: UIImageView = {
       let visaImage = UIImageView()
        visaImage.image = UIImage(named: "visaMasterCardAmex")
        visaImage.frame = CGRect(x: (UIScreen.main.bounds.width / 2) - (UIScreen.main.bounds.width / 1.89 / 2),
                                 y: UIScreen.main.bounds.height / 1.2,
                                 width: UIScreen.main.bounds.width / 1.89,
                                 height: UIScreen.main.bounds.height / 20)
        return visaImage
    }()
    private var animationView: AnimationView?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(bankLogo)
        view.addSubview(amountLabel)
        view.addSubview(gelLabel)
        view.addSubview(payLabel)
        view.addSubview(cardNumber)
        view.addSubview(validityField)
        view.addSubview(CVV2)
        view.addSubview(payButton)
        view.addSubview(visaImage)
        
}
    @objc func payPressed() {
        animationView = .init(name: "79952-successful")
        payButton.isHidden = true
        visaImage.isHidden = true
        
        view.addSubview(animationView!)
        animationView!.frame = CGRect(x: (UIScreen.main.bounds.width / 2) - (UIScreen.main.bounds.width / 1.2 / 2),
                                      y: UIScreen.main.bounds.height / 1.8,
                                     width: UIScreen.main.bounds.width / 1.2,
                                     height: UIScreen.main.bounds.height / 6)
        animationView!.contentMode = .scaleAspectFit
        animationView!.animationSpeed  = 0.8
        animationView!.loopMode = .playOnce
        animationView!.play()
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.5) {
            self.dismiss(animated: true, completion: nil)
        }
        
    }
    }
