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
        scrollView.translatesAutoresizingMaskIntoConstraints = false
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
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    lazy var profileName: UILabel = {
        let label = UILabel()
        label.text = "씨네"
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    lazy var profileButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("프로필 수정", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        
        button.addAction(UIAction(handler: { _ in
            let viewController = MyPageEditViewController()
            viewController.modalPresentationStyle = .fullScreen
            self.present(viewController, animated: true)
        }), for: .touchUpInside)
        return button
    }()
    
    lazy var partyNameLabel: UILabel = {
        let label = UILabel()
        label.text = "신청한 파티"
        label.font = UIFont.preferredFont(forTextStyle: .title2)
        label.textColor = .white
        return label
    }()
    
    lazy var partyImageButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "image 22"), for: .normal)
        
        button.addAction(UIAction(handler: { _ in
            // 액션 수정
        }), for: .touchUpInside)
        
        return button
    }()
    
    lazy var partyInfo: UILabel = {
        let label = UILabel()
        label.text = "24.07.21(일) 17:00 / 서울"
        label.textColor = .white
        label.font = UIFont.preferredFont(forTextStyle: .footnote)
        return label
    }()
    
    lazy var communityLabel: UILabel = {
        let label = UILabel()
        label.text = "커뮤니티"
        label.textColor = .white
        label.font = UIFont.preferredFont(forTextStyle: .title2)
        return label
    }()
    
    lazy var communityButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "doc.text"), for: .normal)
        button.setTitle(" 작성한 게시글 및 댓글", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.tintColor = .white
//        button.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)

        button.addAction(UIAction(handler: { _ in
            print("작성한 게시글 및 댓글 확인")
        }), for: .touchUpInside)
        return button
    }()
    
    
    lazy var calendarLabel: UILabel = {
        let label = UILabel()
        label.text = "캘린더"
        label.textColor = .white
        label.font = UIFont.preferredFont(forTextStyle: .title2)
        return label
    }()
    
    
    lazy var calendarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "calendar")
        imageView.layer.cornerRadius = 15
        imageView.layer.masksToBounds = true
        
        return imageView
    }()
    
    lazy var divider1 = createDivider()
    lazy var divider2 = createDivider()
    lazy var divider3 = createDivider()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .mainColor()
        
        setupInterface()
        setupLayout()
    }
    
    func setupInterface() {
        view.addSubview(scrollView)
        scrollView.addSubview(stackView)
        
        
        
        stackView.addArrangedSubview(profileImageView)
        stackView.addArrangedSubview(profileName)
        stackView.addArrangedSubview(profileButton)
        stackView.addArrangedSubview(divider1)
        
        stackView.addArrangedSubview(partyNameLabel)
        stackView.addArrangedSubview(partyImageButton)
        stackView.addArrangedSubview(partyInfo)
        stackView.addArrangedSubview(divider2)
        
        stackView.addArrangedSubview(communityLabel)
        stackView.addArrangedSubview(communityButton)
        stackView.addArrangedSubview(divider3)
        
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
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            // 스택뷰 제약 조건
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor), // StackView의 너비를 ScrollView와 같게 설정

            // 프로필 이미지뷰
            profileImageView.heightAnchor.constraint(equalToConstant: 64),
            profileImageView.widthAnchor.constraint(equalToConstant: 64),
            
            
            // 프로필 수정 버튼
            profileButton.heightAnchor.constraint(equalToConstant: 35),
            profileButton.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 250),
            profileButton.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -50),
            
            divider1.heightAnchor.constraint(equalToConstant: 0.2),
            // 신청한 파티 레이블
            partyNameLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 20),
            //partyNameLabel.topAnchor.constraint(equalTo: profileButton.bottomAnchor, constant: 40),
            
            // 파티 이미지 버튼
            partyImageButton.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: -250),
            partyImageButton.topAnchor.constraint(equalTo: partyNameLabel.bottomAnchor, constant: 100),
            partyImageButton.widthAnchor.constraint(equalToConstant: 90),
            partyImageButton.heightAnchor.constraint(equalToConstant: 150),
            
            // 파티 정보 레이블
            partyInfo.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 20),
            partyInfo.topAnchor.constraint(equalTo: partyImageButton.bottomAnchor, constant: 10),
            
            divider2.heightAnchor.constraint(equalToConstant: 0.2),

            // 커뮤니티 레이블
            communityLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 20),
            communityLabel.topAnchor.constraint(equalTo: partyImageButton.bottomAnchor, constant: 40),
            
            // 커뮤니티 버튼
            communityButton.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: -190),
            communityButton.topAnchor.constraint(equalTo: communityLabel.bottomAnchor, constant: 20),
            
            divider3.heightAnchor.constraint(equalToConstant: 0.2),

            // 캘린더 레이블
            calendarLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 20),
            
            // 캘린더 이미지뷰
            calendarImageView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 20),
            calendarImageView.topAnchor.constraint(equalTo: calendarLabel.bottomAnchor, constant: 10),
            calendarImageView.widthAnchor.constraint(equalToConstant: 100),
            calendarImageView.heightAnchor.constraint(equalTo: calendarImageView.widthAnchor, multiplier: 1.2),
            
        ])
    }
    
    private func createDivider() -> UIView {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }
}

#Preview {
    MyPageViewController()
}

