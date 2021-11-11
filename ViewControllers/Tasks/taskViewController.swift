//
//  taskViewController.swift
//  NeuroPilot
//
//  Created by Kakha Sepashvili on 27.09.21.

import UIKit

class taskViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let tableView = UITableView()
    
    let backgroundColor = UIColor(red: 255/255.0, green: 252/255.0, blue: 245/255.0, alpha: 1.0)
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
    private let topLabel: UILabel = {
       let topLabel = UILabel()
        let textColor = UIColor(red: 36/255.0, green: 14/255.0, blue: 70/255.0, alpha: 1.0)
        topLabel.textColor = textColor
        topLabel.text = "რა გსურს?"
        topLabel.textAlignment = .center
        topLabel.font = UIFont(name: "Helvetica", size: 18)
        topLabel.frame = CGRect(x: (UIScreen.main.bounds.width / 2) - (UIScreen.main.bounds.width / 4.12 / 2),
                                y: UIScreen.main
                                    .bounds.height / 8.03,
                                width: UIScreen.main.bounds.width / 4.12,
                                height: UIScreen.main.bounds.height / 35.3)
        return topLabel
    }()
    private let secondaryLabel: UILabel = {
       let secondaryLabel = UILabel()
        let textColor = UIColor(red: 36/255.0, green: 14/255.0, blue: 70/255.0, alpha: 1.0)
        secondaryLabel.text = "შეგიძლიათ მონიშნოთ 1"
        secondaryLabel.textColor = textColor
        secondaryLabel.textAlignment = .center
        secondaryLabel.font = UIFont(name: "FiraGO-Regular", size: 13)
        secondaryLabel.frame = CGRect(x: (UIScreen.main.bounds.width / 2) - (UIScreen.main.bounds.width / 2.5 / 2),
                                      y: UIScreen.main.bounds.height / 5.84,
                                      width: UIScreen.main
                                        .bounds.width / 2.5,
                                      height: UIScreen.main
                                        .bounds.height / 54.133)
        return secondaryLabel
    }()
    
    let taskData = [CellFunctions(tableviewData: "მარცხის სცენარებზე ფიქრის ჩანაცვლება გამარჯვებული ადამიანის აზროვნებით "),
                    CellFunctions(tableviewData: "ემოციური წონასწორობის და კონცენტრაციის გაძლიერება"),
                     CellFunctions(tableviewData: "ფიზიკური ტრავმის შიშის დაძლევა")
    ]
    let taskImages: [String] = ["physicalIcon", "emotionIcon", "problemIcon"]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewSetup()
        
        view.backgroundColor = UIColor(patternImage: UIImage(named: "XIBBackground")!)
        view.addSubview(homeButton)
        view.addSubview(backButton)
        view.addSubview(topLabel)
        view.addSubview(secondaryLabel)
        view.addSubview(tableView)
      
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        tableView.frame = CGRect(x: (UIScreen.main.bounds.width / 2) - (UIScreen.main.bounds.width /  1.2 / 2),
                                 y: UIScreen.main.bounds.height / 4.2,
                                 width: UIScreen.main.bounds.width / 1.2,
                                 height: UIScreen.main.bounds.height / 1.1)
    }
    func tableViewSetup() {
        let nib = UINib(nibName: "DemoTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "DemoTableViewCell")
        tableView.backgroundColor = UIColor(patternImage: UIImage(named: "XIBBackground")!)
        tableView.isScrollEnabled = false
        tableView.allowsSelection = false
        tableView.backgroundColor = .clear
        tableView.delegate = self
        tableView.dataSource = self
    }
    @objc func dismissViewController() {
       presentViewController(myView: firstPageViewController())
    }
    @objc func didtapBackButton() {
        presentViewController(myView: QuestionsPageViewController())
    }
    
    func presentViewController(myView: UIViewController) {
        let vc = myView
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: false)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DemoTableViewCell", for: indexPath) as! DemoTableViewCell
        cell.setUp(cell: taskData[indexPath.row])
    
        cell.cellLabel.textColor = UIColor(red: 36/255.0, green: 14/255.0, blue: 70/255.0, alpha: 1.0)
        cell.cellDesign.setImage(UIImage(named: taskImages[indexPath.row]), for: .normal)
        cell.cellDesign.tag = indexPath.row
        cell.cellDesign.addTarget(self, action: #selector(circlePressed), for: .touchUpInside)
        cell.backgroundColor = UIColor.clear
        return cell
    }
    
    @objc func circlePressed(_ sender: UIButton) {
    let vc = FirstTaskViewController()
        vc.modalPresentationStyle = .fullScreen
    present(vc, animated: false)
        vc.indexTag = sender.tag
    }
}
