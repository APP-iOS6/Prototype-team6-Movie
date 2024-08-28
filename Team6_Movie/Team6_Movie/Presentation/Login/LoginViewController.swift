//
//  LoginViewController.swift
//  Team6_Movie
//
//  Created by 김정원 on 8/28/24.
//

import UIKit

class LoginViewController: UIViewController {

    // 다른 뷰 컨트롤러를 LoginViewController에 추가하기 위한 프로퍼티
    private lazy var slideshowViewController: SlideshowViewController = {
        let vc = SlideshowViewController()
        return vc
    }()

    private lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [kakaoLoginButton, appleLoginButton, googleLoginButton])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 15
        return stackView
    }()

    private lazy var kakaoLoginButton: UIButton = {
        let button = UIButton()
        button.setTitle(" 카카오 로그인", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.backgroundColor = .yellow
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)

        if let buttonImage = UIImage(named: "symbolKakao") {
            button.setImage(buttonImage.withRenderingMode(.alwaysOriginal), for: .normal)
            button.imageView?.contentMode = .scaleAspectFit
        }
        return button
    }()

    private lazy var googleLoginButton: UIButton = {
        let button = UIButton()
        button.setTitle(" Google 로그인", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.backgroundColor = .white
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)

        if let buttonImage = UIImage(named: "symbolGoogle") {
            button.setImage(buttonImage.withRenderingMode(.alwaysOriginal), for: .normal)
            button.imageView?.contentMode = .scaleAspectFit
        }
        return button
    }()

    private lazy var appleLoginButton: UIButton = {
        let button = UIButton()
        button.setTitle(" Apple 로그인", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.backgroundColor = .black
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 0.2
        button.layer.borderColor = CGColor(red: 255, green: 255, blue: 255, alpha: 1)
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)

        if let buttonImage = UIImage(named: "symbolApple") {
            button.setImage(buttonImage.withRenderingMode(.alwaysOriginal), for: .normal)
            button.imageView?.contentMode = .scaleAspectFit
        }
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 뷰 컨트롤러를 자식 뷰 컨트롤러로 추가
        addChild(slideshowViewController)
        view.addSubview(slideshowViewController.view)
        slideshowViewController.didMove(toParent: self)
        
        view.addSubview(buttonStackView)
        view.backgroundColor = .mainColor()
        setLayout()
    }

    func setLayout() {
        // SlideshowViewController의 뷰에 대한 레이아웃 설정
        slideshowViewController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            slideshowViewController.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            slideshowViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            slideshowViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            slideshowViewController.view.heightAnchor.constraint(equalToConstant: 500),
            
            buttonStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            buttonStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            buttonStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30)
        ])
    }
}
//
//#Preview {
//    LoginViewController()
//}

extension LoginViewController {
    
    @objc func handleLogin() {
        // TabBarController를 생성하고 각 뷰컨트롤러 설정
        let recruitmentViewController = RecruitmentViewController()
        let myPageViewController = MyPageViewController()
        let searchViewController = SearchViewController()
        let homeViewController = HomeViewController()
        
        let recruitmentNavController = UINavigationController(rootViewController: recruitmentViewController)
        let myPageNavController = UINavigationController(rootViewController: myPageViewController)
        let searchNavController = UINavigationController(rootViewController: searchViewController)
        let homeNavController = UINavigationController(rootViewController: homeViewController)
        
        homeViewController.tabBarItem = UITabBarItem(title: "홈", image: UIImage(systemName: "house"), tag: 0)
        searchViewController.tabBarItem = UITabBarItem(title: "검색", image: UIImage(systemName: "magnifyingglass"), tag: 1)
        recruitmentViewController.tabBarItem = UITabBarItem(title: "모집", image: UIImage(systemName: "person.3"), tag: 2)
        myPageViewController.tabBarItem = UITabBarItem(title: "마이 페이지", image: UIImage(systemName: "person"), tag: 3)
        
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [homeNavController, searchNavController, recruitmentNavController, myPageNavController]
        
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground() // 불투명 배경 설정
        appearance.backgroundColor = .mainColor() // 탭바 배경색 설정
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.stackedLayoutAppearance.selected.iconColor = UIColor.white
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.gray]
        appearance.stackedLayoutAppearance.normal.iconColor = UIColor.gray
        
        tabBarController.tabBar.standardAppearance = appearance
        if #available(iOS 15.0, *) {
            tabBarController.tabBar.scrollEdgeAppearance = appearance
        }
        
        // 현재 윈도우를 가져와서 루트뷰 컨트롤러를 변경합니다.
        if let sceneDelegate = view.window?.windowScene?.delegate as? SceneDelegate {
            sceneDelegate.window?.rootViewController = tabBarController
        }
    }
    
    
}
