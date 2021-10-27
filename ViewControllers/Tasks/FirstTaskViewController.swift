//
//  FirstTaskViewController.swift
//  NeuroPilot
//
//  Created by Kakha Sepashvili on 30.09.21.
//

import UIKit


class FirstTaskViewController: UIViewController {
    
    var indexTag: Int = 0
    
    
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
    private let taskTitle: UILabel = {
       let taskTitle = UILabel()
        taskTitle.textAlignment = .center
        taskTitle.textColor =  UIColor(red: 36/255.0, green: 14/255.0, blue: 70/255.0, alpha: 1.0)
        taskTitle.numberOfLines = 2
        taskTitle.font = UIFont(name: "FiraGO-Regular", size: 17)
        taskTitle.frame = CGRect(x: (UIScreen.main.bounds.width / 2) - (UIScreen.main.bounds.width / 1.1 / 2), y: UIScreen.main.bounds.height / 6.82, width: UIScreen.main.bounds.width / 1.1, height: UIScreen.main.bounds.height /  12.6875)
        return taskTitle
    }()
    private let whiteView: UIImageView = {
       let whiteView = UIImageView()
        whiteView.image = UIImage(named: "backgroundWhite")
        whiteView.frame = CGRect(x: (UIScreen.main.bounds.width / 2) - (UIScreen.main.bounds.width / 1.136 / 2),
                                 y: UIScreen.main.bounds.height / 3.148 ,
                                 width: UIScreen.main.bounds.width / 1.136,
                                 height: UIScreen.main.bounds.height / 1.77)
        return whiteView
    }()
    private let logo: UIImageView = {
        let logo = UIImageView()
        logo.image = UIImage(named: "circleTask")
        logo.frame = CGRect(x: (UIScreen.main.bounds.width / 2) - (UIScreen.main.bounds.width / 2.72 / 2),
                            y: UIScreen.main.bounds.height / 4.29,
                            width: UIScreen.main.bounds.width / 2.72,
                            height: UIScreen.main.bounds.height / 5.88)
        return logo
    }()
    private let descriptionLabel: UILabel = {
        let descriptoonLabel = UILabel()
        descriptoonLabel.textAlignment = .left
        descriptoonLabel.numberOfLines = 13
        descriptoonLabel.textColor = UIColor(red:
                                                36/255.0, green: 14/255.0, blue: 70/255.0, alpha: 1.0)
        descriptoonLabel.font = UIFont(name: "FiraGO-Regular", size: 13)
        descriptoonLabel.frame = CGRect(x: (UIScreen.main.bounds.width / 2) - (UIScreen.main.bounds.width / 1.214 / 2),
                                        y: UIScreen.main.bounds.height / 2.5,
                                        width: UIScreen.main.bounds.width / 1.214,
                                        height: UIScreen.main.bounds.height / 2.99)
        return descriptoonLabel
    }()
    private let remarkLabel: UILabel = {
       let remarkLabel = UILabel()
        remarkLabel.textAlignment = .center
        remarkLabel.numberOfLines = 1
        remarkLabel.text = "*პრობლემის დაძლევის კურსი სამსესიანია."
        remarkLabel.font = UIFont(name: "FiraGO-Regular", size: 10)
        remarkLabel.textColor = UIColor(red: 36/134.0, green: 14/89.0, blue: 70/165.0, alpha: 1.0)
        remarkLabel.frame = CGRect(x: (UIScreen.main.bounds.width / 2) - (UIScreen.main.bounds.width / 1.32 / 2),
                                   y: UIScreen.main.bounds.height / 1.38,
                                   width: UIScreen.main.bounds.width / 1.32,
                                   height: UIScreen.main.bounds.height / 22.556)
        return remarkLabel
    }()
    private let startButton: UIButton = {
       let startButton = UIButton()
        startButton.setImage(UIImage(named: "startButton"), for: .normal)
        startButton.frame = CGRect(x: (UIScreen.main.bounds.width / 2) - (UIScreen.main.bounds.width / 1.1 / 2),
                                   y: UIScreen.main.bounds.height / 1.33,
                                   width: UIScreen.main.bounds.width / 1.1,
                                   height: UIScreen.main.bounds.height / 10.3)
        startButton.addTarget(self, action: #selector(startButtonPressed), for: .touchUpInside)
        return startButton
    }()
    private let headPhonesLabel: UILabel = {
       let headPhonesLabel = UILabel()
        headPhonesLabel.text  = "if you can put your headphones on, if its not possible you can mute sound"
        headPhonesLabel.numberOfLines = 2
        headPhonesLabel.textAlignment = .center
        headPhonesLabel.textColor = UIColor(red: 36/134.0, green: 14/89.0, blue: 70/165.0, alpha: 1.0)
        headPhonesLabel.font = UIFont(name: "Helvetica", size: 12)
        headPhonesLabel.frame = CGRect(x: (UIScreen.main.bounds.width / 2 ) - (UIScreen.main.bounds.width / 1.5 / 2),
                                       y: UIScreen.main.bounds.height / 1.18 ,
                                       width: UIScreen.main.bounds.width / 1.5,
                                       height: UIScreen.main.bounds.height / 23.88)
        return headPhonesLabel
    }()
    private let muteButton: UIButton = {
       let muteButton = UIButton()
        muteButton.setImage(UIImage(named: "mute"), for: .normal)
        muteButton.frame = CGRect(x: (UIScreen.main.bounds.width / 2) - (UIScreen.main.bounds.width / 8.93 / 2),
                                  y: UIScreen.main.bounds.height / 1.12,
                                  width: UIScreen.main.bounds.width / 8.93,
                                  height: UIScreen.main.bounds.height / 19.33)
        return muteButton
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(patternImage: UIImage(named: "XIBBackground")!)
        view.addSubview(backButton)
        view.addSubview(taskTitle)
        view.addSubview(whiteView)
        view.addSubview(logo)
        view.addSubview(descriptionLabel)
        view.addSubview(remarkLabel)
        view.addSubview(startButton)
        view.addSubview(headPhonesLabel)
        view.addSubview(muteButton)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
        
        if indexTag == 0 {
            taskTitle.text = "მარცხის სცენარებზე ფიქრის ჩანაცვლება გამარჯვებული ადამიანის აზროვნებით "
            descriptionLabel.text = "მიმართვა: ზედმეტი კონცენტაცია იმაზე თუ რას ფიქრობენ სხვები (მწვრთნელი, თანაგუნდელი, მშობელი, მაყურებელი და ა.შ.) თქვენზე, ანუ თამაშის პროცესში სხვისი აზრების კითხვა, სპორტსმენის შესაძლებლობების დაქვეითებას იწვევს. საკუთარი თავით უკმაყოფილება და მარცხის სცენარებზე წინასწარ ფიქრის კასკადი იწყება, რასაც თვითკრიტიკისა და სხვათა ზეწოლისგან თავდასაცავად იყენებთ. საკუთარი შესაძლებლობების უკეთ წარდგენა კი, მხოლოდ სხვისი აზრების კითხვის და წარუმატებლობის შიშის სცენარების გარეშეა შესაძლებელი."
            
        } else if indexTag == 1 {
                taskTitle.text = "ემოციური წონასწორობის და კონცენტრაციის გაძლიერება"
            descriptionLabel.text = "სპორტული კარიერა  640-ზე მეტი განსხვავებული დადებითი და უარყოფითი სტრესორით ხასიათდება. ადვილი არ არის ემოციების გაკონტროლება და სიმშვიდის შენარჩუნება შეჯიბრის დროს, თუმცა თამაშის გონებრივ-ემოციური კონტროლი სპორტული განვითარებისათვის უკიდურესად აუცილებელია. როდესაც ფიზიკურად ყველა საჭირო ინსტრუმენტი გაქვთ, რომ იყოთ საუკეთესო, მაგრამ ემოციური დისბალანსი გიშლით ხელს, ერთ-ერთი მიზეზი მრავალი აღმასვლის და ვარდნის შედეგად ემოციური კონტროლს შესუსტებაა, მაგრამ ყველა დიდი სპორტსმენის სურვილი გაწონასწორებული მდგომარეობის შენარჩუნებაა"
            remarkLabel.isHidden = true
            } else if indexTag == 2 {
                taskTitle.text = "ფიზიკური ტრავმის შიშის დაძლევა"
                descriptionLabel.text = "სპორტულ ტრავმას სპორტსმენისთვის აქვს როგორც ფიზიკური, ასევე ფსიქოლოგიური შედეგები. პოსტ-დაზიანების საერთო ფსიქოლოგიური პასუხი არის გაზრდილი შიში ხელახალი დაზიანებისა. შიშის თავიდან აცილებას შეუძლია მნიშვნელოვანი როლი შეასრულოს დაზიანებისადმი ადაპტირებულ რეაქციებში. დაშავებულ სპორტსმენებში ტკივილთან დაკავშირებული შიში ან შიშის თავიდან აცილება მნიშვნელოვან გავლენას ახდენს, ვარჯიშის და თამაშის დროს სხეულის რეაქციებზე, რაც ახალი ტრავმის მიზეზი ან ტრავმის მიღებისადმი გადაჭარბებული სიფრთხილის მიზეზი ხდება."
                remarkLabel.isHidden = true
            }
    }
    @objc func dismissViewController() {
        presentViewController(myView: taskViewController())
    }
    @objc func startButtonPressed() {
        if indexTag == 0 {
            presentViewController(myView: ProblemExchangeViewController())
        } else if indexTag == 1 {
            presentViewController(myView: EmotionalViewController())
        } else if indexTag == 2 {
            presentViewController(myView: PhysicalViewController())
        }
       
    }
    func presentViewController(myView: UIViewController) {
        let vc = myView
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: false)
    }
}
