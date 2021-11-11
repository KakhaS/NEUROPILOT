//
//  QuestionsPageViewController.swift
//  NeuroPilot
//
//  Created by Kakha Sepashvili on 29.09.21.
//

import UIKit

class QuestionsPageViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var cellData = [CellFunctions(tableviewData: "დაძაბულობა და ნერვიულობა მუდმივად თანმდევია ჩემი ყოველდღიური ცხოვრების", identification: "A"),
                    CellFunctions(tableviewData: "არაფრის ხალისი არ მაქვს, ყველაფრის ძალით კეთება მიწევს", identification: "A"),
                    CellFunctions(tableviewData: "მაწუხებს უარყოფითი ფიქრები, რომ რამე ცუდი მოხდება ან ვინმეს რამე დაემართება", identification: "A"),
                    CellFunctions(tableviewData: "სხვა ადამიანების აზრს, თუ რას ფიქრობენ ჩემზე, დიდ მნიშვნელობას ვანიჭებ", identification: "B"),
                    CellFunctions(tableviewData: "ვისურვებდი, რომ უკეთესი ვყოფილიყავი", identification: "B")
    ]
    let cellData2 = [CellFunctions(tableviewData: "დანაშულის გრძნობა, რომ რაიმე ისე ვერ გავაკეთე ხშირად მაწუხებს", identification: "B"),
                    CellFunctions(tableviewData: "არ მაქვს წარმატებისთვის საჭირო ყველა უნარ-ჩვევა", identification: "C"),
                     CellFunctions(tableviewData: "საკუთარ ქცევაზე გადამეტებული კონცენტრაცია მაქვს, რაიმე შეცდომა ხომ არ დავუშვი", identification: "C"),
                    CellFunctions(tableviewData: "მუდამ პროცესში ვარ წარსული მოვლენების შემდგომი გადამუშვებით", identification: "C"),
                    CellFunctions(tableviewData: "ვფიქრობ, რომ იმედს ვუცრუებ საკუთარ თავს და სხვებს",identification: "C")
    ]
   
    let backgroundColor = UIColor(red: 255/255.0, green: 252/255.0, blue: 245/255.0, alpha: 1.0)
    
    var tableView = UITableView()
 
    
    private let logo: UIImageView = {
        let logo = UIImageView()
        logo.image = UIImage(named: "logoMini")
        logo.frame = CGRect(x: UIScreen.main.bounds.width / 1.36,
                            y: UIScreen.main.bounds.height / 8.14,
                            width: UIScreen.main.bounds.width / 4.57,
                            height: UIScreen.main.bounds.height / 8.37)
        return logo
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
    private let homeButton: UIButton = {
        let homeButton = UIButton()
        homeButton.setImage(UIImage(named: "homeLogo"), for: .normal)
        homeButton.frame = CGRect(x: UIScreen.main.bounds.width / 1.2, y: UIScreen.main.bounds.height / 18.18, width: UIScreen.main.bounds.width / 8.84, height: UIScreen.main.bounds.height / 19.18)
        homeButton.addTarget(self, action: #selector(dismissViewController), for: .touchUpInside)
        return homeButton
    }()
    private let kitxvariLabel: UILabel = {
       let kitxvariLabel = UILabel()
        let textColor = UIColor(red: 36/255.0, green: 14/255.0, blue: 70/255.0, alpha: 1.0)
        kitxvariLabel.text = "კითხვარი"
        kitxvariLabel.textAlignment = .left
        kitxvariLabel.textColor = textColor
        kitxvariLabel.font = UIFont(name: "FiraGO-Regular", size: 18)
        kitxvariLabel.frame = CGRect(x: UIScreen.main.bounds.width / 25,
                                     y: UIScreen.main.bounds.height / 8,
                                     width: UIScreen.main.bounds.width / 4.21,
                                     height: UIScreen.main.bounds.height / 35.3)
        return kitxvariLabel
    }()
    private let explanationLabel: UILabel = {
       let explanationLabel = UILabel()
        let textColor = UIColor(red: 36/255.0, green: 14/255.0, blue: 70/255.0, alpha: 1.0)
        explanationLabel.text = "შეგიძლიათ მონიშნოთ 1 ან მეტი"
        explanationLabel.textAlignment = .left
        explanationLabel.numberOfLines = 3
        explanationLabel.textColor = textColor
        explanationLabel.font = UIFont(name: "FiraGO-Regular", size: 14)
        explanationLabel.frame = CGRect(x: UIScreen.main.bounds.width / 23.47,
                                        y: UIScreen.main.bounds.height / 5.8,
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
        tableViewSetup()
       
        view.backgroundColor = backgroundColor
        view.addSubview(logo)
        view.addSubview(backButton)
        view.addSubview(homeButton)
        view.addSubview(kitxvariLabel)
        view.addSubview(explanationLabel)
        view.addSubview(tableView)
        view.addSubview(cellEndButton)
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        tableView.frame = CGRect(x: (UIScreen.main.bounds.width / 2) - (UIScreen.main.bounds.width /  1.085 / 2),
                                 y: UIScreen.main.bounds.height / 4.1,
                                 width: UIScreen.main.bounds.width / 1.085,
                                 height: UIScreen.main.bounds.height / 1.55)
    }
    
    func tableViewSetup() {
        let nib = UINib(nibName: "DemoTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "DemoTableViewCell")
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.backgroundColor = backgroundColor
        tableView.allowsSelection = false
        tableView.delegate = self
        tableView.dataSource = self
    }
    
   
    @objc func dismissViewController() {
        let vc = firstPageViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: false)
    }
    @objc func finishedButtonPress() {
        let vc =  startTestViewController()
        vc.modalPresentationStyle = .fullScreen
        let diagnose = "\(diagnose(clicks: indexCounter))"
        vc.labelSecond.text = diagnose
        present(vc, animated: false)
    }
    
    @objc func nextButtonPressed() {
        cellEndButton.setImage(UIImage(named: "finishButton"), for: .normal)
        cellEndButton.addTarget(self, action: #selector(finishedButtonPress), for: .touchUpInside)
        cellData = cellData2
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DemoTableViewCell", for: indexPath) as! DemoTableViewCell
        cell.setUp(cell: cellData[indexPath.row])
        cell.cellDesign.tag = indexPath.row
        cell.cellLabel.textAlignment = .left
        cell.cellLabel.textColor = .black
        cell.cellDesign.addTarget(self, action: #selector(customCellButtonTapped), for: .touchUpInside)
        cell.backgroundColor = UIColor.clear
        return cell
    }
//    var tagCounter: [String] = []
    var indexCounter: [String] = []
    @objc func customCellButtonTapped(_ sender: UIButton) {
        if cellData[sender.tag].isSelected == .isSelected {
            cellData[sender.tag].isSelected = .isNotSelected
            indexCounter.removeAll{$0 == sender.accessibilityIdentifier}
        } else {
            cellData[sender.tag].isSelected = .isSelected
            indexCounter.append(sender.accessibilityIdentifier ?? "")
        }
        tableView.reloadData()
    }
    func diagnose(clicks: [String]) -> String {
        var result = "დიაგნოსზის დადგმა შეუძლებელია, გთხოვ გაიარო ტესტი თავიდან"
        let aCategory = indexCounter.filter{$0.contains("A")}
        let bCategory = indexCounter.filter{$0.contains("B")}
        let cCategory = indexCounter.filter{$0.contains("C")}
        
        if aCategory.count >= 2 && bCategory.count == 2{
           result = "თქვენ გამოგივლინდათ მსუბუქი დეპრესია. სურვილის შემთხვევაში, გთხოვთ მიმართოთ სპეციალისტს."
        } else if aCategory.count >= 1 && bCategory.count == 3 {
            result = "თქვენ გამოგივლინდათ საშუალო სიმძიმის დეპრესია. საჭიროებისამებრ მიმართეთ სპეციალისტს."
        } else if aCategory.count == 2 && bCategory.count == 4 {
            result = "თქვენ გამოგივლინდათ მძიმე დეპრესია. გთხოვთ, მიმართოთ სპეციალისტს."
        } else if aCategory.count >= 1 && cCategory.count == 2 {
            result = "თქვენ გამოგივლინდათ მსუბუქი შფოთვა. სურვილის შემთხვევაში, გთხოვთ მიმართოთ სპეციალისტს."
        } else if aCategory.count >= 1 && cCategory.count == 3 {
            result = "თქვენ გამოგივლინდათ საშუალო სიმძიმის შფოთვა. გთხოვთ, საჭიროებისამებრ მიმართოთ სპეციალისტს."
        } else if aCategory.count >= 2 && cCategory.count >= 4 {
            result = "თქვენ გამოგივლინდათ მძიმე შფოთვა. გთხოვთ, მიმართოთ სპეციალისტს."
        } else if aCategory.count >= 2 && bCategory.count >= 4 && cCategory.count >= 4 {
            result = "თქვენ გამოგივლინდათ დეპრესია და შფოთვა. გთხოვთ, მიმართოთ სპეციალისტს."
        } else {
            result = "გამოხატული დეპრესია ან შფოთვა არ შეინიშნება. გირჩევთ დასვენებას და თქვენთვის სასიამოვნო საქმიანობისთვის დროის გამოძებნას."
        }
        return result
        }
    }
