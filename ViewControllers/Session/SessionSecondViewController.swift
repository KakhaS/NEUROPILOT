//
//  SessionSecondViewController.swift
//  NeuroPilot
//
//  Created by Kakha Sepashvili on 19.10.21.
//

import UIKit
import Lottie

let animationNames: [String] = [ "1", "2", "3", "4", "5", "6.", "7.", "8", "9.", "10.", "11", "12", "13.", "14.", "15.", "16", "17." ]
let animationNames2: [String] = [ "18", "19", "20", "21.", "22", "23." , "24", "25.", "26", "27", "28", "29.", "30."]
let animationTexts: [String] = [ "გთხოვ, მოაახლოვე მარჯვენა ნახევარსფეროს ზედა ცენტრალური ნაწილი.", "დააკვირდი კარგად ზედაპირს და დასვი მასზე „კლდე“.  დიდი, ბუნებრივი,  ნაპრალებით, მიხველ-მოხვეული გზებით. სადღაც შორს ხედავ სინათლესაც.", "შენი სურვილი, რომელიც არის „მე მინდა მეტი სიახლე, ნათელი ფერები ჩემს ცხოვრებაში, მეტის შეძლება“ ამის ასრულებაში დაგეხმაროს ეს კლდე. ხედავ სინათლეს. წარმოიდგინე, რომ ეს სინათლე ისეთი ძალით იწყებს ნათებს, რომ კლდეს ხეთქავს.  ისე, რომ კლდე ნაწილებად იფრქვევა და ქრება.", "კლდის გაქრობის შემდეგ, დააკვირდი კაშკაშა სინათლე, რომელმაც კდე გახეთქა, როგორ გადაიქცევა საშუალო ზომის კაშკაშა სინათლის ბურთად.", "დააკვირდი, როგორ იზრდება სინათლის ბურთი და ენერგია იწყებს მოძრაობას. თითქოს ვიბრირებს.", "ახლა, გთხოვ დააკვირდე მარცხენა ნახევარსფეროს ზედა ცენტრალურ ნაწილს და კარგად მოაახლოვო.", "მარცხენა ნახევარსფეროს ზედაპირზე დასვი „ჩამოსასრიალებელი“, ისეთი ბავშვობაში ან მოზრდილობაში, რომ გინახავს", "ახლა, მინდა გთხოვო შენი სურვილი, რომელიც არის „მე მინდა მეტი სიახლე, ნათელი ფერები ჩემს ცხოვრებაში, მეტის შეძლება“ ამის ასრულებაში დაგეხმაროს ეს ჩამოსასრიალებელი. ხედავ, როგორ იწყებს წყალი ჩამოდინებას ჩამომსასრიალებელზე. დინება ისე მატულობს, რომ ჩამომსასრიალებელს შლის და აქრობს მარცხენა ნახევარსფეროს ზედაპირიდან.", "ახლა დააკვირდი მარცხენა ნახევარსფეროს ზედაპირს და დასვი მასზე მარჯვენა ნახევარსფეროს მსგავსი სინათლის ბურთი.  ორივე ნახევარსფეროზე 2 ერთმანეთის მსგავსი სინათლის ბურთია - ორივე კაშკაშა, ორივე ბურთის შიდა ზედაპირიდან სხივი/ ენერგია გამოდის.", "ახლა მინდა გთხოვო, რომ ორივე სინათლის ბურთს თხოვო შენი სურვილის „მე მინდა მეტი სიახლე, ნათელი ფერები ჩემს ცხოვრებაში, მეტის შეძლება“ თხოვო ერთობლივად შასრულონ შენი სურვილი და დააკვირდი მათი ენერგიები როგორ ერთდება ნახევარსფეროებს შორის გამყოფ ღართან ერთდება, თითქოს ორივეს ენერგია ერთმანეთს უერთდება, მაგრამ მეტად აქტიურია მარჯვენა.", "ახლა, გთხოვ თავის ტვინის ზედა ცენტრალური ზედაპირიდან თავის ტვინის უკან, კეფისკენ ნათხემზე გადავინაცვლოთ.", "ნათხემს კარგად დააკვირდი, ის მოყავისფრო, მშრალი, პატარა, კურკის ფორმისა და ფაქტურისაა.", "გთხოვ, მშრალი და ყავისფერი პატარა კურკა ღია ფერის, რბილ, ჟელატინის მაგვარ მოცულობად გადააქციო.", "ახლა გთხოვ, გადავინაცვლოთ ტვინის სიღრმეში და დავაკვირდეთ ჯალღუზისებრ სხეულს. აღმოსავლურ ფილოსოფიაში მას, „მესამე თვალს“ ეძახიან.", "იგი, პარკუჭში იმოქცეული გამობურცული მასაა, თითქოს ფეთქავს კიდეც, პატარა ზომისაა.", "ახლა გთხოვ, პარკუჭში მოქცეულ მასას შიდა ზედაპირიდან, სიღრმიდან სინათლის ნაკადის წერტილი გააჩინმო და დააკვირდე, როგორ მოედინება სინათლის სხივი ლაზერის სხივის მსგავსად შუბლის შიდა ზედაპირისკენ და ანათებს მას.", "ახლა, შენი ყურადღება კვლავ ნახევარსფეროების ზედაპირისკენ გადაიტანე და კარგად დააკვირდი ორივე ნახევარსფეროზე 2 ერთმანეთის მსგავსი სინათლის ბურთები ისევ როგორ კაშკაშებენ, ორივე ბურთის შიდა ზედაპირიდან სხივი/ ენერგია გამოდის და ნახევარსფეროებს შორის გამყოფ ღართან ერთდება, თითქოს ორივეს ენერგია ერთდება, მაგრამ მეტად აქტიურია მარჯვენა." ]
class SessionSecondViewController: UIViewController {
    var clickIndex = 0
    private let homeButton: UIButton = {
        let homeButton = UIButton()
        homeButton.setImage(UIImage(named: "homeLogo"), for: .normal)
        homeButton.frame = CGRect(x: UIScreen.main.bounds.width / 1.2, y: UIScreen.main.bounds.height / 18.18, width: UIScreen.main.bounds.width / 8.84, height: UIScreen.main.bounds.height / 15)
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
    private let mainText: UILabel = {
       let mainText = UILabel()
        mainText.textAlignment = .center
        mainText.numberOfLines = 8
        if UIScreen.main.bounds.height <= 812.0 {
            mainText.font = UIFont(name: "FiraGO-Regular", size: 12)
        } else {
            mainText.font = UIFont(name: "FiraGO-Regular", size: 16)
        }
        mainText.textColor = UIColor(red: 36/255.0, green: 14/255.0, blue: 70/255.0, alpha: 1.0)
        mainText.frame = CGRect(x: (UIScreen.main.bounds.width / 2) - (UIScreen.main.bounds.width / 1.23 / 2),
                                y: UIScreen.main.bounds.height / 1.7,
                                width: UIScreen.main.bounds.width / 1.23,
                                height: UIScreen.main.bounds.height / 5)
        return mainText
    }()
    private let nextButton: UIButton =  {
        let nextButton = UIButton()
        nextButton.setImage(UIImage(named: "nextButton"), for: .normal)
        nextButton.frame = CGRect(x: (UIScreen.main.bounds.width / 2) - (UIScreen.main.bounds.width / 1.1 / 2), y: UIScreen.main.bounds.height / 1.2, width: UIScreen.main.bounds.width / 1.1, height: UIScreen.main.bounds.height / 11)
        nextButton.addTarget(self, action: #selector(nextButtonPressed), for: .touchUpInside)
        return nextButton
    }()
    private let muteButton: UIButton = {
       let muteButton = UIButton()
        muteButton.setImage(UIImage(named: "sessionMuteButton"), for: .normal)
        muteButton.frame = CGRect(x: (UIScreen.main.bounds.width / 2) - (UIScreen.main.bounds.width / 8.93 / 2), y: UIScreen.main.bounds.height / 1.28, width: UIScreen.main.bounds.width / 8.93, height: UIScreen.main.bounds.height / 19.3)
        return muteButton
    }()
    private let replayButton: UIButton = {
       let replayButton = UIButton()
        replayButton.setImage(UIImage(named: "LottieReplay"), for: .normal)
        replayButton.frame = CGRect(x: UIScreen.main.bounds.width / 1.2,
                                    y: UIScreen.main.bounds.height / 1.88,
                                    width: UIScreen.main.bounds.width / 8,
                                    height: UIScreen.main.bounds.height / 8)
        replayButton.addTarget(self, action: #selector(replayButtonPressed), for: .touchUpInside)
        return replayButton
    }()
    private var animationView: AnimationView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let backgroundColor = UIColor(red: 255/255.0, green: 252/255.0, blue: 245/255.0, alpha: 1.0)
        view.backgroundColor = backgroundColor
        view.addSubview(homeButton)
        view.addSubview(backButton)
        view.addSubview(mainText)
        view.addSubview(nextButton)
        view.addSubview(muteButton)
        print(UIScreen.main.bounds.height)
      setUpAnimation(name: animationNames[clickIndex], text: animationTexts[clickIndex])
    }
    @objc func replayButtonPressed() {
        animationView!.isHidden = true
        setUpAnimation(name: animationNames[clickIndex], text: animationTexts[clickIndex])
      }
  
    @objc func dismissViewController() {
        let vc = SessionViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: false)
    }
    @objc func nextButtonPressed() {
        clickIndex += 1
        animationView?.isHidden = true
        replayButton.isHidden = true
        if clickIndex < animationNames.count {
            setUpAnimation(name: animationNames[clickIndex], text: animationTexts[clickIndex])
        } else if clickIndex == animationNames.count {
            let vc = PurchasePageViewController()
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true)
        }
    }
  
    func setUpAnimation(name: String, text: String) {
        self.nextButton.isEnabled = false
        self.nextButton.alpha = 0.6
        animationView = .init(name: name)
        mainText.text = text
        view.addSubview(animationView!)
        animationView!.frame = CGRect(x: (UIScreen.main.bounds.width / 2) - (UIScreen.main.bounds.width / 1.1 / 2),
                                      y: UIScreen.main.bounds.height / 8,
                                      width: UIScreen.main.bounds.width / 1.1,
                                      height: UIScreen.main.bounds.height / 2.3)
        animationView!.contentMode = .scaleAspectFit
        animationView!.loopMode = .playOnce
        animationView!.play { finished in
            self.view.addSubview(self.replayButton)
            self.replayButton.isHidden = false
            self.nextButton.isEnabled = true
            self.nextButton.alpha = 1
        }
    }
}
