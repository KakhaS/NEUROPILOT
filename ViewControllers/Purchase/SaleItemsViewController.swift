//
//  SaleItemsViewController.swift
//  NeuroPilot
//
//  Created by Kakha Sepashvili on 14.10.21.
//

import UIKit



class SaleItemsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let imageNames: [String] = ["firstCell", "secondCell", "thirdCell"]
    let collectionView = UICollectionView(frame: CGRect(x: 0,
                                                        y: 200,
                                                        width: 400,
                                                        height: 380), collectionViewLayout: UICollectionViewFlowLayout())
    private let dismissButton: UIButton = {
        let dismissButton = UIButton()
        dismissButton.setImage(UIImage(systemName: "xmark"), for: .normal)
        dismissButton.frame = CGRect(x: UIScreen.main.bounds.width / 125,
                                     y: UIScreen.main.bounds.height / 11.94,
                                     width: UIScreen.main.bounds.width / 8.52,
                                     height: UIScreen.main.bounds.height / 18.45)
        dismissButton.addTarget(self, action: #selector(dismissButtonClicked), for: .touchUpInside)
        return dismissButton
    }()
    private let topText: UILabel = {
       let topText = UILabel()
        topText.text = "გააგრძელე დღესვე"
        topText.textColor = UIColor(red: 36/255.0, green: 14/255.0, blue: 70/255.0, alpha: 1.0)
        topText.textAlignment = .center
        topText.frame = CGRect(x: (UIScreen.main.bounds.width / 2) - (UIScreen.main.bounds.width / 1.89 / 2),
                               y: UIScreen.main.bounds.height / 6.1515,
                               width: UIScreen.main.bounds.width / 1.89,
                               height: UIScreen.main.bounds.height / 33.83)
        return topText
    }()
    private let secondaryText: UILabel = {
       let secondaryText = UILabel()
        secondaryText.text = "Sometimes I’ll start a sentence and I don’t even know where it’s going. I just hope I find it along the way."
        secondaryText.numberOfLines = 3
        secondaryText.textAlignment = .center
        secondaryText.font = UIFont(name: "Helvetica", size: 14)
        secondaryText.textColor = UIColor(red: 36/255.0, green: 14/255.0, blue: 70/255.0, alpha: 1.0)
        secondaryText.frame = CGRect(x: (UIScreen.main.bounds.width / 2) - (UIScreen.main.bounds.width / 1.5 / 2),
                                     y: UIScreen.main.bounds.height / 4.37,
                                     width: UIScreen.main.bounds.width  / 1.5,
                                     height: UIScreen.main.bounds.height / 14)
        return secondaryText
    }()
    private let purchaseButton: UIButton = {
       let purchaseButton = UIButton()
        purchaseButton.setImage(UIImage(named: "purchaseButton2"), for: .normal)
        purchaseButton.frame = CGRect(x: (UIScreen.main.bounds.width / 2) - (UIScreen.main.bounds.width / 1.1 / 2),
                                      y: UIScreen.main.bounds.height / 1.32,
                                      width: UIScreen.main.bounds.width / 1.1,
                                      height: UIScreen.main.bounds.height / 12.3)
        purchaseButton.addTarget(self, action: #selector(purchaPressed), for: .touchUpInside)
        return purchaseButton
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.showsHorizontalScrollIndicator = false
        view.backgroundColor = .white
        view.addSubview(dismissButton)
        view.addSubview(topText)
        view.addSubview(secondaryText)
        view.addSubview(collectionView)
        view.addSubview(purchaseButton)
        collectionView.delegate = self
        collectionView.dataSource = self
        let nib = UINib(nibName: "DemoCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "DemoCollectionViewCell")
        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.scrollDirection = .horizontal
        }

    }
    @objc func dismissButtonClicked() {
        dismiss(animated: false, completion: nil)
    }
    @objc func purchaPressed() {
        let vc = BankPageViewController()
        present(vc, animated: true)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionViewCells.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DemoCollectionViewCell", for: indexPath) as! DemoCollectionViewCell
        cell.setup(with: collectionViewCells[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var possibleChoices: [Int] = []
        let possibilities = 0..<collectionViewCells.count
        for i in possibilities {
            possibleChoices += [i]
        }
        let whatsLeft = possibleChoices.filter{$0 != indexPath.row}
        if collectionViewCells[indexPath.row].borderWith == 5 {
            collectionViewCells[indexPath.row].borderWith = 0
        } else {
            collectionViewCells[indexPath.row].borderWith = 5
        }
        for number in whatsLeft {
            collectionViewCells[number].borderWith = 0
        }
        collectionView.reloadData()
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 320, height: 320)
    }
}
