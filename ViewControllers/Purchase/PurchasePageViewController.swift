//
//  PurchasePageViewController.swift
//  NeuroPilot
//
//  Created by Kakha Sepashvili on 13.10.21.
//

import UIKit

class PurchasePageViewController: UIViewController {
    private let homeButton: UIButton = {
        let homeButton = UIButton()
        homeButton.setImage(UIImage(named: "homeLogo"), for: .normal)
        homeButton.frame = CGRect(x: UIScreen.main.bounds.width / 1.2, y: UIScreen.main.bounds.height / 18.18, width: UIScreen.main.bounds.width / 8.84, height: UIScreen.main.bounds.height / 19.18)
//        homeButton.addTarget(self, action: #selector(dismissViewController), for: .touchUpInside)
        return homeButton
    }()
    private let topTitle: UILabel = {
       let topTitle = UILabel()
        topTitle.text = "დასარული"
        topTitle.textColor = UIColor(red: 36/255.0, green: 14/255.0, blue: 70/255.0, alpha: 1.0)
        topTitle.textAlignment = .center
        topTitle.frame = CGRect(x: (UIScreen.main.bounds.width / 2) - (UIScreen.main.bounds.width / 3.99 / 2),
                                y: UIScreen.main.bounds.height / 7.32,
                                width: UIScreen.main.bounds.width / 3.99,
                                height: UIScreen.main.bounds.height / 36.9)
        return topTitle
    }()
    private let mainLogo: UIImageView = {
       let mainLogo = UIImageView()
        mainLogo.image = UIImage(named: "purchaseLogo")
        mainLogo.frame = CGRect(x: (UIScreen.main.bounds.width / 2 ) - (UIScreen.main.bounds.width / 1.59 / 2),
                                y: UIScreen.main.bounds.height / 4.2,
                                width: UIScreen.main.bounds.width / 1.59,
                                height: UIScreen.main.bounds.height / 3.8)
        return mainLogo
    }()
    private let secondaryLabel: UILabel = {
       let secondaryLabel = UILabel()
        secondaryLabel.text = "გრძნობ როგორი ენერგიული ხარ. თითქოს ყველაფერს შეძლებ."
        secondaryLabel.numberOfLines = 2
        secondaryLabel.textAlignment = .center
        secondaryLabel.textColor = UIColor(red: 36/255.0, green: 14/255.0, blue: 70/255.0, alpha: 1.0)
        secondaryLabel.frame = CGRect(x: (UIScreen.main.bounds.width / 2) - (UIScreen.main.bounds.width / 1.33 / 2 ),
                                      y: UIScreen.main.bounds.height / 1.816,
                                      width: UIScreen.main.bounds.width / 1.33,
                                      height: UIScreen.main.bounds.height / 16.57)
        return secondaryLabel
    }()
    private let aboutLabel: UILabel = {
       let aboutLabel = UILabel()
        aboutLabel.text = "უფასო ვერსიით დასრულების შემდეგ 4 დღის განმავლობაში ვერ გადახვალთ შემდეგ სესიაზე"
        aboutLabel.textColor = UIColor(red: 134/255.0, green: 89/255.0, blue: 165/255.0, alpha: 1.0)
        aboutLabel.textAlignment = .center
        aboutLabel.numberOfLines = 2
        aboutLabel.font = UIFont(name: "Helvetica", size: 10)
        aboutLabel.frame = CGRect(x: (UIScreen.main.bounds.width / 2) - (UIScreen.main.bounds.width / 1.1 / 2),
                                  y: UIScreen.main.bounds.height / 1.46,
                                  width: UIScreen.main.bounds.width / 1.1,
                                  height: UIScreen.main.bounds.height / 26.19)
        return aboutLabel
    }()
    private let purchaseButton: UIButton = {
       let purchaseButton = UIButton()
        purchaseButton.setImage(UIImage(named: "purchaseButton"), for: .normal)
        purchaseButton.frame = CGRect(x: (UIScreen.main.bounds.width / 2) - (UIScreen.main.bounds.width / 1.093 / 2),
                                      y: UIScreen.main.bounds.height / 1.351,
                                      width: UIScreen.main.bounds.width / 1.093,
                                      height: UIScreen.main.bounds.height / 12.3)
        purchaseButton.addTarget(self, action: #selector(purchaseButtonPressed), for: .touchUpInside)
        return purchaseButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let backgroundColor = UIColor(red: 255/255.0, green: 252/255.0, blue: 245/255.0, alpha: 1.0)
        view.backgroundColor = backgroundColor
        view.addSubview(homeButton)
        view.addSubview(topTitle)
        view.addSubview(mainLogo)
        view.addSubview(secondaryLabel)
        view.addSubview(aboutLabel)
        view.addSubview(purchaseButton)
    }
    @objc func purchaseButtonPressed() {
        let vc = SaleItemsViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
}
