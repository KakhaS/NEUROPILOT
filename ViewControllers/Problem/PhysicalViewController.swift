//
//  PhysicalViewController.swift
//  NeuroPilot
//
//  Created by Kakha Sepashvili on 09.10.21.
//

import UIKit

class PhysicalViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    let tableView = UITableView()
    var cellData = [CellFunctions(tableviewData: "ტრავმა რომ კიდევ მივიღო, დავემშვიდობები კარიერას/ ვეღარ გადავიტან"),
                    CellFunctions(tableviewData: "თითქოს ჩემი შესაძლებლობების ბოლომდე რეალიზებას ვერ ვახერხებ"),
                     CellFunctions(tableviewData: "ვფიქრობ, რომ მეტი შემიძლია, მაგრამ რაღაცა მაკავებს"),
                    CellFunctions(tableviewData: "ხშირად ვიღებ ტრავმებს და ეს არის ჩემი წარუმატებლობის მიზეზი"),
                    CellFunctions(tableviewData: "ხანდახან გადამწყვეტ მომენტში არასწორ მანევრირებას ვაკეთებ"),
                    CellFunctions(tableviewData: "ბრძოლაში თავგანწირული ვარ და შიძლება ეს არის ჩემი ხშირი ტრავმის მიზეზი"),
                    CellFunctions(tableviewData: "დაგვიანებული რეაქციის გამო მიმიღია ხშირად ტრავმა)")
    
    ]
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
    private let homeButton: UIButton = {
        let homeButton = UIButton()
        homeButton.setImage(UIImage(named: "homeLogo"), for: .normal)
        homeButton.frame = CGRect(x: UIScreen.main.bounds.width / 1.2, y: UIScreen.main.bounds.height / 18.18, width: UIScreen.main.bounds.width / 8.84, height: UIScreen.main.bounds.height / 19.18)
        homeButton.addTarget(self, action: #selector(dismissViewController), for: .touchUpInside)
        return homeButton
    }()
    private let logo: UIImageView = {
        let logo = UIImageView()
        logo.image = UIImage(named: "emotionalLogo")
        logo.frame = CGRect(x: UIScreen.main.bounds.width / 1.36,
                            y: UIScreen.main.bounds.height / 8.14,
                            width: UIScreen.main.bounds.width / 4.57,
                            height: UIScreen.main.bounds.height / 8.37)
        return logo
    }()
    private let kitxvariLabel: UILabel = {
       let kitxvariLabel = UILabel()
        let textColor = UIColor(red: 36/255.0, green: 14/255.0, blue: 70/255.0, alpha: 1.0)
        kitxvariLabel.text = "ფიზიკური ტრავმის შიშის დაძლევა"
        kitxvariLabel.textAlignment = .left
        kitxvariLabel.textColor = textColor
        kitxvariLabel.numberOfLines = 3
        kitxvariLabel.font = UIFont(name: "Helvetica", size: 16)
        kitxvariLabel.frame = CGRect(x: UIScreen.main.bounds.width / 25,
                                     y: UIScreen.main.bounds.height / 7.88,
                                     width: UIScreen.main.bounds.width / 1.573,
                                     height: UIScreen.main.bounds.height / 10.54)
        return kitxvariLabel
    }()
    private let explanationLabel: UILabel = {
       let explanationLabel = UILabel()
        let textColor = UIColor(red: 36/255.0, green: 14/255.0, blue: 70/255.0, alpha: 1.0)
        explanationLabel.text = "შეგიძლიათ მონიშნოთ 1 ან რამოდენიმე"
        explanationLabel.textAlignment = .left
        explanationLabel.numberOfLines = 2
        explanationLabel.textColor = textColor
        explanationLabel.font = UIFont(name: "Helvetica", size: 14)
        explanationLabel.frame = CGRect(x: UIScreen.main.bounds.width / 23.47,
                                        y: UIScreen.main.bounds.height / 4.8,
                                        width: UIScreen.main.bounds.width / 2.17,
                                        height: UIScreen.main.bounds.height / 15)
        return explanationLabel
    }()
    private let cellEndButton: UIButton = {
        let cellEndButton = UIButton()
         cellEndButton.setImage(UIImage(named: "nextPage"), for: .normal)
         cellEndButton.frame = CGRect(x: (UIScreen.main.bounds.width / 2) - (UIScreen.main.bounds.width / 1.037 / 2),
                                      y: UIScreen.main.bounds.height / 1.14,
                                      width: UIScreen.main.bounds.width / 1.037,
                                      height: UIScreen.main.bounds.height / 14.2)
         cellEndButton.addTarget(self, action: #selector(nextButtonPressed), for: .touchUpInside)
         return cellEndButton
     }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(patternImage: UIImage(named: "XIBBackground")!)
        view.addSubview(tableView)
        tableViewSetup()
        view.addSubview(backButton)
        view.addSubview(homeButton)
        view.addSubview(logo)
        view.addSubview(kitxvariLabel)
        view.addSubview(explanationLabel)
        view.addSubview(cellEndButton)
        cellEndButton.alpha = 0.3
        cellEndButton.isEnabled = false
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        tableView.frame = CGRect(x: (UIScreen.main.bounds.width / 2) - (UIScreen.main.bounds.width /  1.085 / 2),
                                 y: UIScreen.main.bounds.height / 3.8,
                                 width: UIScreen.main.bounds.width / 1.085,
                                 height: UIScreen.main.bounds.height / 1.65)
    }
    
    func tableViewSetup() {
        tableView.backgroundColor = .red
        let nib = UINib(nibName: "DemoTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "DemoTableViewCell")
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.backgroundColor = UIColor(patternImage: UIImage(named: "XIBBackground")!)
        tableView.allowsSelection = false
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @objc func dismissViewController() {
        presentViewController(myView: firstPageViewController())
    }
    func presentViewController(myView: UIViewController) {
        let vc = myView
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: false)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DemoTableViewCell", for: indexPath) as! DemoTableViewCell
        cell.setUp(cell: cellData[indexPath.row])
        cell.cellDesign.tag = indexPath.row
        cell.cellLabel.textAlignment = .left
        cell.cellLabel.textColor = UIColor(red: 36/255.0, green: 14/255.0, blue: 70/255.0, alpha: 1.0)
        cell.cellDesign.addTarget(self, action: #selector(customCellButtonTapped), for: .touchUpInside)
        cell.backgroundColor = UIColor.clear
        return cell
    }
    var tagCounter: [String] = []
    @objc func customCellButtonTapped(_ sender: UIButton) {
        let counter = "\(sender.tag)"
        if cellData[sender.tag].isSelected == .isSelected {
            cellData[sender.tag].isSelected = .isNotSelected
            tagCounter.removeAll{$0 == counter}
        } else {
            cellData[sender.tag].isSelected = .isSelected
            tagCounter.append(counter)
        }
        if tagCounter == [] {
            cellEndButton.alpha = 0.3
            cellEndButton.isEnabled = false
        } else {
            cellEndButton.alpha = 1
            cellEndButton.isEnabled = true
        }
        tableView.reloadData()
    }
    @objc func nextButtonPressed() {
        presentViewController(myView: SessionViewController())
        SessionViewController().identification = "Physical"
    }
}
