//
//  MyPageViewController.swift
//  Team6_Movie
//
//  Created by 김정원 on 8/27/24.
//

import UIKit

class MyPageViewController: UIViewController {
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.contentSize = CGSize(width: view.frame.width, height: 1000)
        
        return scrollView
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 5
        
        return stackView
    }()
    
    lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Group 12")
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    lazy var profileName: UILabel = {
        let label = UILabel()
        label.text = "씨네"
        label.textAlignment = .center
        return label
    }()
    
    lazy var profileButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("프로필 수정", for: .normal)
        button.setTitleColor(.systemBackground, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        
        button.addAction(UIAction(handler: { _ in
            print("프로필 수정 버튼")
        }), for: .touchUpInside)
        return button
    }()
    
    lazy var partyNameLabel: UILabel = {
        let label = UILabel()
        label.text = "신청한 파티"
        label.font = UIFont.preferredFont(forTextStyle: .title2)
        return label
    }()
    
    lazy var partyImageButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "image 22"), for: .normal)
        
        button.addAction(UIAction(handler: { _ in
            print("파티 상세정보 이동")
        }), for: .touchUpInside)
        
        return button
    }()
    
    lazy var partyInfo: UILabel = {
        let label = UILabel()
        label.text = "24.07.21(일) 17:00 / 서울"
        label.font = UIFont.preferredFont(forTextStyle: .footnote)
        return label
    }()
    
    lazy var communityLabel: UILabel = {
        let label = UILabel()
        label.text = "커뮤니티"
        label.font = UIFont.preferredFont(forTextStyle: .title2)
        return label
    }()
    
    lazy var communityButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "doc.text"), for: .normal)
        button.setTitle(" 작성한 게시글 및 댓글", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.tintColor = .black
        
        button.addAction(UIAction(handler: { _ in
            print("작성한 게시글 및 댓글 확인")
        }), for: .touchUpInside)
        return button
    }()
    
    
    lazy var calendarLabel: UILabel = {
        let label = UILabel()
        label.text = "캘린더"
        label.font = UIFont.preferredFont(forTextStyle: .title2)
        return label
    }()
    
    
    lazy var calendarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "calendar")
        
        return imageView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        setupInterface()
        setupLayout()
    }
    
    func setupInterface() {
        view.addSubview(scrollView)
        scrollView.addSubview(stackView)
        
        stackView.addArrangedSubview(profileImageView)
        stackView.addArrangedSubview(profileName)
        stackView.addArrangedSubview(profileButton)
        stackView.addArrangedSubview(partyNameLabel)
        stackView.addArrangedSubview(partyImageButton)
        stackView.addArrangedSubview(partyInfo)
        stackView.addArrangedSubview(communityLabel)
        stackView.addArrangedSubview(communityButton)
        stackView.addArrangedSubview(calendarLabel)
        stackView.addArrangedSubview(calendarImageView)
    }
    
    func setupLayout() {
        
        for subview in view.subviews {
            subview.translatesAutoresizingMaskIntoConstraints = false
        }
        
        for subview in scrollView.subviews {
            subview.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            // 스크롤뷰 제약 조건
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            // 스택뷰 제약 조건
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            // 프로필 이미지뷰 제약 조건
            profileImageView.topAnchor.constraint(equalTo: stackView.topAnchor, constant: 20),
            profileImageView.centerXAnchor.constraint(equalTo: stackView.centerXAnchor),
            profileImageView.widthAnchor.constraint(equalToConstant: 50),
            profileImageView.heightAnchor.constraint(equalTo: profileImageView.widthAnchor),

            // 프로필 수정 버튼 제약 조건
            profileButton.heightAnchor.constraint(equalToConstant: 35),
            profileButton.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 250),
            profileButton.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -50),
            
            // 신청한 파티 레이블 제약 조건
            partyNameLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 20),
            partyNameLabel.topAnchor.constraint(equalTo: profileButton.bottomAnchor, constant: 40),
            
            // 파티 이미지 버튼 제약 조건
            partyImageButton.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: -250),
            partyImageButton.topAnchor.constraint(equalTo: partyNameLabel.bottomAnchor, constant: 70),
            partyImageButton.widthAnchor.constraint(equalToConstant: 100),
            partyImageButton.heightAnchor.constraint(equalTo: partyImageButton.widthAnchor, multiplier: 1.5),
            
            // 파티 정보 레이블 제약 조건
            partyInfo.leadingAnchor.constraint(equalTo: partyImageButton.trailingAnchor, constant: 50),
            partyInfo.topAnchor.constraint(equalTo: partyImageButton.bottomAnchor, constant: 10),
            
            // 커뮤니티 레이블 제약 조건
            communityLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 20),
            communityLabel.topAnchor.constraint(equalTo: partyImageButton.bottomAnchor, constant: 40),
            
            // 커뮤니티 버튼 제약 조건
            communityButton.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: -190),
            communityButton.topAnchor.constraint(equalTo: communityLabel.bottomAnchor, constant: 20),
            
            // 캘린더 레이블 제약 조건
            calendarLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 20),
            calendarLabel.topAnchor.constraint(equalTo: communityButton.bottomAnchor, constant: 40),
            
            // 캘린더 이미지뷰 제약 조건
            calendarImageView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 20),
            calendarImageView.topAnchor.constraint(equalTo: calendarLabel.bottomAnchor, constant: 10),
            calendarImageView.widthAnchor.constraint(equalToConstant: 100),
            calendarImageView.heightAnchor.constraint(equalTo: calendarImageView.widthAnchor, multiplier: 1.2),
        ])
    }
}

#Preview {
    MyPageViewController()
}

