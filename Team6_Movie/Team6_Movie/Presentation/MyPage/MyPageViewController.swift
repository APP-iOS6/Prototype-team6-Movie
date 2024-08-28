//
//  MyPageViewController.swift
//  Team6_Movie
//
//  Created by 김정원 on 8/27/24.
//

import UIKit

class MyPageViewController: BaseViewController {
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    
    private lazy var profileView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var wantedPartyView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var comminityView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var calendarView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Group 12")
        imageView.layer.cornerRadius = 40
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    // 닉네임
    private lazy var profileName: UILabel = {
        let label = UILabel()
        label.text = "씨네"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // 소개말
    private lazy var introductionLabel: UILabel = {
        let label = UILabel()
        label.text = "영화가 조아(소개말)"
        label.font = UIFont.preferredFont(forTextStyle: .footnote)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var profileButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("수정", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .mainColor()
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 15
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .footnote)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.addAction(UIAction(handler: { _ in
            let viewController = MyPageEditViewController()
            viewController.profileNameText = self.profileName.text
            viewController.introductionText = self.introductionLabel.text
            
            viewController.saveAction = { (image, name, introduction) in
                self.profileImageView.image = image
                self.profileName.text = name
                self.introductionLabel.text = introduction
            }
            self.navigationController?.pushViewController(viewController, animated: true)
        }), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var partyNameLabel: UILabel = {
        let label = UILabel()
        label.text = "신청한 파티"
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var partyImageButtonOne: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "image 28"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.addAction(UIAction(handler: { [weak self] _ in
            let detailVC = DetailViewController()
            detailVC.setContent(Contents(category: .Concert, location: "서울", image: UIImage(named: "concert7")))
            self?.navigationController?.pushViewController(detailVC, animated: true)
        }), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var partyImageButtonTwo: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "image-24"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.addAction(UIAction(handler: { [weak self] _ in
            let detailVC = DetailViewController()
            detailVC.setContent(Contents(category: .Movie, location: "서울", image: UIImage(named: "animation12")))
            self?.navigationController?.pushViewController(detailVC, animated: true)        }), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var partyImageButtonThree: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "animation3"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.addAction(UIAction(handler: { [weak self] _ in
            let detailVC = DetailViewController()
            detailVC.setContent(Contents(category: .Movie, location: "서울", image: UIImage(named: "animation3")))
            self?.navigationController?.pushViewController(detailVC, animated: true)        }), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var partyInfoOne: UILabel = {
        let label = UILabel()
        label.text = "08/27 17:00, 서울"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 10)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var partyInfoTwo: UILabel = {
        let label = UILabel()
        label.text = "08/15 17:00, 서울"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 10)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var partyInfoThree: UILabel = {
        let label = UILabel()
        label.text = "08/15 12:00, 서울"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 10)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var communityLabel: UILabel = {
        let label = UILabel()
        label.text = "커뮤니티"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var communityButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "doc.text"), for: .normal)
        button.setTitle("  작성한 게시글 및 댓글", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addAction(UIAction(handler: { _ in
            let viewController = MyPagePostViewController()
            self.navigationController?.pushViewController(viewController, animated: true)
        }), for: .touchUpInside)
        return button
    }()
    
    private lazy var calendarLabel: UILabel = {
        let label = UILabel()
        label.text = "캘린더"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var calendarImageButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "calendar"), for: .normal)
        button.layer.cornerRadius = 15
        button.layer.masksToBounds = true
        button.addAction(UIAction(handler: { _ in
            let viewController = MyPageCalendarViewController()
            self.navigationController?.pushViewController(viewController, animated: true)
        }), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var divider1: UIView = {
        let view = createDivider()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var divider2: UIView = {
        let view = createDivider()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var divider3: UIView = {
        let view = createDivider()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .mainColor()
        self.title = "마이페이지"
        setupInterface()
        setupLayout()
        
        // 네비게이션 타이틀 색상 설정
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .mainColor() // 네비게이션 바 배경색
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white] // 타이틀 텍스트 색상
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    func setupInterface() {
        view.addSubview(scrollView)
        scrollView.addSubview(profileView)
        scrollView.addSubview(wantedPartyView)
        scrollView.addSubview(comminityView)
        scrollView.addSubview(calendarView)
        
        profileView.addSubview(profileImageView)
        profileView.addSubview(profileName)
        profileView.addSubview(introductionLabel)
        profileView.addSubview(profileButton)
        profileView.addSubview(divider1)
        
        wantedPartyView.addSubview(partyNameLabel)
        wantedPartyView.addSubview(partyImageButtonOne)
        wantedPartyView.addSubview(partyInfoOne)
        wantedPartyView.addSubview(partyImageButtonTwo)
        wantedPartyView.addSubview(partyInfoTwo)
        wantedPartyView.addSubview(partyImageButtonThree)
        wantedPartyView.addSubview(partyInfoThree)
        wantedPartyView.addSubview(divider2)
        
        comminityView.addSubview(communityLabel)
        comminityView.addSubview(communityButton)
        comminityView.addSubview(divider3)
        
        calendarView.addSubview(calendarLabel)
        calendarView.addSubview(calendarImageButton)
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
            
            // 프로필 뷰 🍅
            profileView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            profileView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            profileView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            profileView.widthAnchor.constraint(equalTo: scrollView.widthAnchor), // 스크롤 뷰의 폭에 맞춤
            profileView.bottomAnchor.constraint(equalTo: divider1.bottomAnchor),
            
            // 프로필 이미지뷰
            profileImageView.topAnchor.constraint(equalTo: profileView.topAnchor, constant: 20),
            profileImageView.centerXAnchor.constraint(equalTo: profileView.centerXAnchor),
            profileImageView.widthAnchor.constraint(equalTo: profileView.widthAnchor, multiplier: 0.2),
            profileImageView.heightAnchor.constraint(equalTo: profileImageView.widthAnchor),
            
            // 프로필 닉네임 라벨
            profileName.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 10),
            profileName.centerXAnchor.constraint(equalTo: profileView.centerXAnchor),
            
            // 프로필 소개말 라벨
            introductionLabel.topAnchor.constraint(equalTo: profileName.bottomAnchor, constant: 10),
            introductionLabel.centerXAnchor.constraint(equalTo: profileView.centerXAnchor),
            
            // 프로필 수정 버튼
            profileButton.widthAnchor.constraint(equalToConstant: 60),
            profileButton.topAnchor.constraint(equalTo: profileImageView.topAnchor),
            profileButton.trailingAnchor.constraint(equalTo: profileView.trailingAnchor, constant: -20),
            
            // ----------- 구분선 -----------
            divider1.topAnchor.constraint(equalTo: introductionLabel.bottomAnchor, constant: 20),
            divider1.leadingAnchor.constraint(equalTo: profileView.leadingAnchor, constant: 20),
            divider1.trailingAnchor.constraint(equalTo: profileView.trailingAnchor, constant: -20),
            divider1.heightAnchor.constraint(equalToConstant: 0.5),
            
            // 파티 뷰 🍅
            wantedPartyView.topAnchor.constraint(equalTo: profileView.bottomAnchor),
            wantedPartyView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 0),
            wantedPartyView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: 0),
            wantedPartyView.widthAnchor.constraint(equalTo: scrollView.widthAnchor), // 스크롤 뷰의 폭에 맞춤
            wantedPartyView.bottomAnchor.constraint(equalTo: divider2.bottomAnchor), // 임의의 높이 설정
            
            // 신청한 파티 레이블
            partyNameLabel.topAnchor.constraint(equalTo: divider1.bottomAnchor, constant: 20),
            partyNameLabel.leadingAnchor.constraint(equalTo: wantedPartyView.leadingAnchor, constant: 20),
            
            // 파티 이미지 버튼 1
            partyImageButtonOne.topAnchor.constraint(equalTo: partyNameLabel.bottomAnchor, constant: 15),
            partyImageButtonOne.leadingAnchor.constraint(equalTo: wantedPartyView.leadingAnchor, constant: 20),
        
            // 파티 정보 레이블 1
            partyInfoOne.centerXAnchor.constraint(equalTo: partyImageButtonOne.centerXAnchor),
            partyInfoOne.topAnchor.constraint(equalTo: partyImageButtonOne.bottomAnchor, constant: 2),
            
            // 파티 이미지 버튼 2
            partyImageButtonTwo.topAnchor.constraint(equalTo: partyNameLabel.bottomAnchor, constant: 15),
            partyImageButtonTwo.leadingAnchor.constraint(equalTo: partyInfoOne.trailingAnchor, constant: 20),
            
            // 파티 정보 레이블 2
            partyInfoTwo.centerXAnchor.constraint(equalTo: partyImageButtonTwo.centerXAnchor),
            partyInfoTwo.topAnchor.constraint(equalTo: partyImageButtonTwo.bottomAnchor, constant: 2),
            
            // 파티 정보 버튼 3
            partyImageButtonThree.topAnchor.constraint(equalTo: partyNameLabel.bottomAnchor, constant: 15),
            partyImageButtonThree.leadingAnchor.constraint(equalTo: partyInfoTwo.trailingAnchor, constant: 20),
            
            // 파티 정보 레이블 3
            partyInfoThree.centerXAnchor.constraint(equalTo: partyImageButtonThree.centerXAnchor),
            partyInfoThree.topAnchor.constraint(equalTo: partyImageButtonThree.bottomAnchor, constant: 2),
            
            // ----------- 구분선 -----------
            divider2.topAnchor.constraint(equalTo: partyInfoOne.bottomAnchor, constant: 20),
            divider2.leadingAnchor.constraint(equalTo: wantedPartyView.leadingAnchor, constant: 20),
            divider2.trailingAnchor.constraint(equalTo: wantedPartyView.trailingAnchor, constant: -20),
            divider2.heightAnchor.constraint(equalToConstant: 0.2),
            
            // 커뮤니티 뷰 🍅
            comminityView.topAnchor.constraint(equalTo: wantedPartyView.bottomAnchor),
            comminityView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            comminityView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            comminityView.widthAnchor.constraint(equalTo: scrollView.widthAnchor), // 스크롤 뷰의 폭에 맞춤
            comminityView.bottomAnchor.constraint(equalTo: divider3.bottomAnchor), // 임의의 높이 설정
            
            // 커뮤니티 레이블
            communityLabel.leadingAnchor.constraint(equalTo: comminityView.leadingAnchor, constant: 20),
            communityLabel.topAnchor.constraint(equalTo: divider2.topAnchor, constant: 20),
            
            // 커뮤니티 버튼
            communityButton.leadingAnchor.constraint(equalTo: comminityView.leadingAnchor, constant: 20),
            communityButton.topAnchor.constraint(equalTo: communityLabel.bottomAnchor, constant: 20),
            
            // ----------- 구분선 -----------
            divider3.topAnchor.constraint(equalTo: communityButton.bottomAnchor, constant: 20),
            divider3.leadingAnchor.constraint(equalTo: comminityView.leadingAnchor, constant: 20),
            divider3.trailingAnchor.constraint(equalTo: comminityView.trailingAnchor, constant: -20),
            divider3.heightAnchor.constraint(equalToConstant: 0.3),
            
            // 캘린더 뷰 🍅
            calendarView.topAnchor.constraint(equalTo: comminityView.bottomAnchor),
            calendarView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            calendarView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            calendarView.widthAnchor.constraint(equalTo: scrollView.widthAnchor), // 스크롤 뷰의 폭에 맞춤
            calendarView.bottomAnchor.constraint(equalTo: calendarImageButton.bottomAnchor, constant: 20),
            
            // 캘린더 레이블
            calendarLabel.leadingAnchor.constraint(equalTo: calendarView.leadingAnchor, constant: 20),
            calendarLabel.topAnchor.constraint(equalTo: divider3.bottomAnchor, constant: 20),
            
            // 캘린더 이미지뷰
            calendarImageButton.leadingAnchor.constraint(equalTo: calendarView.leadingAnchor, constant: 20),
            calendarImageButton.topAnchor.constraint(equalTo: calendarLabel.bottomAnchor, constant: 20),
            calendarImageButton.widthAnchor.constraint(equalTo: calendarView.widthAnchor, multiplier: 0.9),
            calendarImageButton.heightAnchor.constraint(equalTo: calendarImageButton.widthAnchor, multiplier: 1.3),
            
            calendarView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor) // 스크롤되도록
        ])
    }
    
    private func createDivider() -> UIView {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }
    
    @objc func didTapDoneButton() {
        // 현재 네비게이션 스택에서 이 뷰 컨트롤러를 제거하고 이전 화면으로 돌아갑니다.
        self.navigationController?.popViewController(animated: true)
    }
}

#Preview {
    MyPageViewController()
}
