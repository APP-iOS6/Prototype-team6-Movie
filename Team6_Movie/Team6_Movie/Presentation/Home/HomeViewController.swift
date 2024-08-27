//
//  HomeViewController.swift
//  Team6_Movie
//
//  Created by 김정원 on 8/27/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let scrollView = UIScrollView()
    private let stackView = UIStackView()
    
    let kboContents: [Contents] = [
        Contents(category: .KBO, location: "서울", image: UIImage(named: "image-19")),
        Contents(category: .KBO, location: "대전", image: UIImage(named: "image-20")),
        Contents(category: .KBO, location: "광주", image: UIImage(named: "image-22")),
        Contents(category: .KBO, location: "서울", image: UIImage(named: "image-23")),
        Contents(category: .KBO, location: "대전", image: UIImage(named: "image-24")),
        Contents(category: .KBO, location: "광주", image: UIImage(named: "image-25"))
    ]
    
    let movieContents: [Contents] = [
        Contents(category: .Movie, location: "서울", image: UIImage(named: "movieSeoul")),
        Contents(category: .Movie, location: "대전", image: UIImage(named: "movieDaejeon")),
        Contents(category: .Movie, location: "광주", image: UIImage(named: "movieGwangju"))
    ]
    
    let concertContents: [Contents] = [
        Contents(category: .Concert, location: "서울", image: UIImage(named: "concertSeoul")),
        Contents(category: .Concert, location: "대전", image: UIImage(named: "concertDaejeon")),
        Contents(category: .Concert, location: "광주", image: UIImage(named: "concertGwangju"))
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        self.title = "홈"
        
        setupScrollView()
        setupStackView()
        
        // 콘텐츠 뷰 추가
        let kboView = ContentsView(contents: kboContents)
        let movieView = ContentsView(contents: movieContents)
        let concertView = ContentsView(contents: concertContents)
        
        stackView.addArrangedSubview(kboView)
        stackView.addArrangedSubview(movieView)
        stackView.addArrangedSubview(concertView)
    }
    
    private func setupScrollView() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func setupStackView() {
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor) // 스크롤뷰의 너비와 동일하게 설정
        ])
    }
}


