//
//  MyPageCalendarViewController.swift
//  Team6_Movie
//
//  Created by 김효정 on 8/28/24.
//

import UIKit

class MyPageCalendarViewController: BaseViewController {

    private lazy var dateLabelOne: UILabel = {
        let label = UILabel()
        label.text = "15일"
        label.font = .bold24
        label.textColor = .white
        return label
    }()
    
    private lazy var countLabelOne: UILabel = {
        let label = UILabel()
        label.text = "2개"
        label.font = UIFont(name: "Pretendard-Regular", size: 15)
        label.textColor = .white
        return label
    }()
    
    private lazy var dateLabelTwo: UILabel = {
        let label = UILabel()
        label.text = "27일"
        label.font = .bold24
        label.textColor = .white
        return label
    }()
    
    private lazy var countLabelTwo: UILabel = {
        let label = UILabel()
        label.text = "1개"
        label.font = UIFont(name: "Pretendard-Regular", size: 15)
        label.textColor = .white
        return label
    }()
    
    private lazy var partyImageButtonOne: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "concert7"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.addAction(UIAction(handler: { _ in
            let detailVC = DetailViewController()
            detailVC.setContent(Contents(category: .Concert, location: "서울", image: UIImage(named: "concert7")))
            detailVC.isApply = true
            self.navigationController?.pushViewController(detailVC, animated: true)
        }), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var partyImageButtonTwo: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "animation12"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.addAction(UIAction(handler: { _ in
            let detailVC = DetailViewController()
            detailVC.setContent(Contents(category: .Movie, location: "서울", image: UIImage(named: "animation12")))
            detailVC.isApply = true
            self.navigationController?.pushViewController(detailVC, animated: true)        }), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var partyImageButtonThree: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "animation3"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.addAction(UIAction(handler: { _ in
            let detailVC = DetailViewController()
            detailVC.setContent(Contents(category: .Movie, location: "서울", image: UIImage(named: "animation3")))
            detailVC.isApply = true
            self.navigationController?.pushViewController(detailVC, animated: true)        }), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var partyInfoOne: UILabel = {
        let label = UILabel()
        label.text = "CGV 강변 17:00"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 10)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var partyInfoTwo: UILabel = {
        let label = UILabel()
        label.text = "롯데시네마 건대 17:00"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 10)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var partyInfoThree: UILabel = {
        let label = UILabel()
        label.text = "메가박스 성수 12:00"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 10)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "8월"
        
        setupInterface()
        setupLayout()
    }
    
    func setupInterface() {
        view.addSubview(dateLabelOne)
        view.addSubview(countLabelOne)
        view.addSubview(partyImageButtonTwo)
        view.addSubview(partyImageButtonThree)
        view.addSubview(dateLabelTwo)
        view.addSubview(countLabelTwo)
        view.addSubview(partyImageButtonOne)
        view.addSubview(partyInfoOne)
        view.addSubview(partyInfoTwo)
        view.addSubview(partyInfoThree)
    }
    
    func setupLayout() {
        for subview in view.subviews {
            subview.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            dateLabelOne.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            dateLabelOne.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            
            countLabelOne.topAnchor.constraint(equalTo: dateLabelOne.bottomAnchor, constant: 10),
            countLabelOne.trailingAnchor.constraint(equalTo: dateLabelOne.trailingAnchor),
            
            partyImageButtonTwo.topAnchor.constraint(equalTo: dateLabelOne.topAnchor),
            partyImageButtonTwo.leadingAnchor.constraint(equalTo: dateLabelOne.trailingAnchor, constant: 30),
            
            partyInfoTwo.topAnchor.constraint(equalTo: partyImageButtonTwo.bottomAnchor),
            partyInfoTwo.centerXAnchor.constraint(equalTo: partyImageButtonTwo.centerXAnchor),
            
            partyImageButtonThree.topAnchor.constraint(equalTo: dateLabelOne.topAnchor),
            partyImageButtonThree.leadingAnchor.constraint(equalTo: partyImageButtonTwo.trailingAnchor, constant: 2),
            
            partyInfoThree.topAnchor.constraint(equalTo: partyImageButtonThree.bottomAnchor),
            partyInfoThree.centerXAnchor.constraint(equalTo: partyImageButtonThree.centerXAnchor),
            
            dateLabelTwo.topAnchor.constraint(equalTo: partyImageButtonTwo.bottomAnchor, constant: 50),
            dateLabelTwo.leadingAnchor.constraint(equalTo: dateLabelOne.leadingAnchor),
            
            countLabelTwo.topAnchor.constraint(equalTo: dateLabelTwo.bottomAnchor, constant: 10),
            countLabelTwo.leadingAnchor.constraint(equalTo: countLabelOne.leadingAnchor),
            
            partyImageButtonOne.topAnchor.constraint(equalTo: dateLabelTwo.topAnchor),
            partyImageButtonOne.leadingAnchor.constraint(equalTo: dateLabelTwo.trailingAnchor, constant: 30),
            
            partyInfoOne.topAnchor.constraint(equalTo: partyImageButtonOne.bottomAnchor),
            partyInfoOne.centerXAnchor.constraint(equalTo: partyImageButtonOne.centerXAnchor),
        ])
    }
}
