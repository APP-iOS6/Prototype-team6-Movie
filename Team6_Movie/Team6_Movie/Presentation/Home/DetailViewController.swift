//
//  DetailViewController.swift
//  Team6_Movie
//
//  Created by 김정원 on 8/27/24.
//

import UIKit

class DetailViewController: UIViewController {
    
    private var content: Contents?
    
    // UI 요소들
    private let imageView = UIImageView()
    private let titleLabel = UILabel()
    private let dateLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let applyButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .mainColor()
        
        setupUI()
        updateUI()
        setupNavigationBar()
    }
    
    // MARK: - Public Method
    public func setContent(_ content: Contents) {
        self.content = content
        
        // 만약 view가 이미 로드된 상태에서 데이터를 설정하는 경우
        if isViewLoaded {
            updateUI()
        }
    }
    
    // MARK: - UI 설정
    private func setupUI() {
        // 이미지 설정
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        // 제목 라벨 설정
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
        titleLabel.textColor = .white
        titleLabel.numberOfLines = 0
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // 날짜 라벨 설정
        dateLabel.font = UIFont.systemFont(ofSize: 18)
        dateLabel.textColor = .lightGray
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // 설명 라벨 설정
        descriptionLabel.font = UIFont.systemFont(ofSize: 16)
        descriptionLabel.textColor = .white
        descriptionLabel.numberOfLines = 0
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.text = "상세 설명"
        
        // 스택뷰 설정
        let stackView = UIStackView(arrangedSubviews: [imageView, titleLabel, dateLabel, descriptionLabel])
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        
        // 오토레이아웃 설정
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
        
        if let buttonImage = UIImage(named: "Group 14") {
            applyButton.setImage(buttonImage.withRenderingMode(.alwaysOriginal), for: .normal)
        }
        applyButton.setTitle(" 신청하기", for: .normal)
        applyButton.tintColor = .black
        applyButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        applyButton.backgroundColor = .white
        applyButton.layer.cornerRadius = 10
        applyButton.translatesAutoresizingMaskIntoConstraints = false
        applyButton.addTarget(self, action: #selector(applyButtonTapped), for: .touchUpInside)
        view.addSubview(applyButton)
        
        // "신청하기" 버튼 오토레이아웃 설정
        NSLayoutConstraint.activate([
            applyButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            applyButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            applyButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            applyButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func setupNavigationBar() {
        // 네비게이션 바에 공유 버튼 추가
        let shareButton = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareContent))
        navigationItem.rightBarButtonItem = shareButton
    }
    
    // MARK: - UI 업데이트
    private func updateUI() {
        guard let content = content else { return }
        
        imageView.image = content.image
        titleLabel.text = "\(content.category.rawValue)"
        dateLabel.text = content.date.toFormattedString() + " 3시간 "
    }
    
    // MARK: - 공유 기능
    @objc private func shareContent() {
        guard let content = content else { return }
        
        // 공유할 항목들
        let items: [Any] = [
            content.image ?? UIImage(), // 이미지가 있으면 이미지 공유
            "\(content.category.rawValue) - \(content.location)", // 카테고리와 위치
            content.date.toFormattedString() // 날짜
        ]
        
        let activityViewController = UIActivityViewController(activityItems: items, applicationActivities: nil)
        activityViewController.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem // iPad에서의 팝오버 설정
        present(activityViewController, animated: true, completion: nil)
    }
    
    @objc private func applyButtonTapped() {
        // 신청하기 버튼 클릭 시 동작 처리
        let alert = UIAlertController(title: "신청하시겠습니까?", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "취소", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
