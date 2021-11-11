//
//  onboardingViewController.swift
//  NeuroPilot
//
//  Created by Kakha Sepashvili on 10.09.21.
//

import UIKit

class onboardingViewController: UIViewController {
    private let scrollview: UIScrollView = {
       let scrollView  = UIScrollView()
        scrollView.frame = CGRect(x: UIScreen.main.bounds.width / 11.363,
                                  y: UIScreen.main.bounds.height / 3.1,
                                                         width:  UIScreen.main.bounds.width / 1.2,
                                                         height:  UIScreen.main.bounds.height / 2.12)
        return scrollView
    }()
    private let topLabel: UILabel = {
       let topLabel = UILabel()
        topLabel.text = "NEUROPILOT"
        topLabel.textColor = .white
        topLabel.font = UIFont(name: "FiraGO-SemiBold", size: 25)
        topLabel.frame = CGRect(x: UIScreen.main.bounds.width / 8,
                                y: UIScreen.main.bounds.height / 8,
                                width: UIScreen.main.bounds.width / 1.339 ,
            height: UIScreen.main.bounds.height / 19.8)
        topLabel.textAlignment = .center
        
        return topLabel
    }()
    private let secondaryLabel: UILabel = {
       let secondaryLabel = UILabel()
        let textColor = UIColor(red: 255/255.0, green: 255/255.0, blue: 255/255.0, alpha: 0.7)
        secondaryLabel.text = "ვირტუალური ფსიქოლოგი"
        secondaryLabel.textColor = textColor
        secondaryLabel.textAlignment = .center
        secondaryLabel.font = UIFont(name: "FiraGO-Regular", size: 20)
        secondaryLabel.numberOfLines = 2
        secondaryLabel.frame = CGRect(x: UIScreen.main.bounds.width / 7.8125 ,
                                y: UIScreen.main.bounds.height / 6,
                                width: UIScreen.main.bounds.width / 1.339 ,
                                      height: UIScreen.main.bounds.height / 12.5)
        return secondaryLabel
    }()
    private let pageCotrol: UIPageControl =  {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = 3
        pageControl.frame = CGRect(x: UIScreen.main.bounds.width / 11.363,
                                   y: UIScreen.main.bounds.height / 1.24,
                                   width:  UIScreen.main.bounds.width / 1.213,
                                   height:  UIScreen.main.bounds.height / 20.32)
        pageControl.addTarget(self, action: #selector(pageControlDidChange(_ :)), for: .valueChanged)
        return pageControl
    }()
    private let getStartedButton: UIButton = {
       let getStartedButton = UIButton()
        getStartedButton.setImage(UIImage(named: "getStarted1"), for: .normal)
        getStartedButton.frame = CGRect(x: UIScreen.main.bounds.width / 35,
                                        y: UIScreen.main.bounds.height / 1.18,
                                        width:  UIScreen.main.bounds.width / 1.05,
                                                               height:  UIScreen.main.bounds.height / 12)
        getStartedButton.addTarget(self, action: #selector(didtapGetStarted), for: .touchUpInside)
        return getStartedButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let backgroundColor = UIColor(red: 61/255.0, green: 36/255.0, blue: 105/255.0, alpha: 1.0)
        view.backgroundColor = backgroundColor
        scrollview.delegate = self
        view.addSubview(topLabel)
        view.addSubview(secondaryLabel)
        view.addSubview(scrollview)
        view.addSubview(pageCotrol)
        view.addSubview(getStartedButton)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if scrollview.subviews.count == 2 {
            configureScrollView()
        }
    }
    func configureScrollView() {
        scrollview.contentSize = CGSize(width: (UIScreen.main.bounds.width / 1.2 ) * 3, height: scrollview.frame.size.height)
        scrollview.isPagingEnabled = true
        scrollview.showsHorizontalScrollIndicator = false
        let stackView = UIStackView()
        stackView.spacing = 10
        let imageNames: [String] = ["board1", "board2", "board3"]
        for i in 0..<3 {
            let ImageView = UIImageView()
            ImageView.frame = CGRect(x: CGFloat(i) * UIScreen.main.bounds.width / 1.2, y: 0, width: (UIScreen.main.bounds.width / 1.2) , height: scrollview.frame.size.height)
            ImageView.image = UIImage(named: imageNames[i])
            view.backgroundColor = UIColor(red: 84/255.0, green: 52/255.0, blue: 124/255.0, alpha: 1.0)
            ImageView.contentMode = .scaleAspectFit
            scrollview.addSubview(ImageView)
            scrollview.addSubview(stackView)
        }
    }
    @objc func pageControlDidChange(_ sender: UIPageControl) {
        let current = sender.currentPage
        scrollview.setContentOffset(CGPoint(x: CGFloat(current) * view.frame.size.width / 1.2, y: 0), animated: true)
    }
    @objc func didtapGetStarted() {
        let vc = loginOrRegisterViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: false, completion: nil)
    }
}
extension onboardingViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageCotrol.currentPage = Int((Float(scrollView.contentOffset.x) / Float(scrollView.frame.size.width)))
        if pageCotrol.currentPage == 0 {
            secondaryLabel.text = "ვირტუალური ფსიქოლოგი"
        } else if pageCotrol.currentPage == 1{
                secondaryLabel.text = "გონების ძალა სპორტში"
        } else if pageCotrol.currentPage == 2 {
                secondaryLabel.text = "გონება უსაზღვრო შესაძლებლობისაა"
            }
        }
    }

