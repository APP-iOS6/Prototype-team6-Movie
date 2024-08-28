//
//  DetailViewController.swift
//  Team6_Movie
//
//  Created by 김정원 on 8/27/24.
//

import UIKit

class DetailViewController: BaseViewController {
    
    private var content: Contents?
    
    // UI 요소들
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.heightAnchor.constraint(equalToConstant: 250).isActive = true
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = .bold24
        titleLabel.textColor = .white
        titleLabel.numberOfLines = 0
        return titleLabel
    }()
    
    private lazy var dateLabel: UILabel = {
        let dateLabel = UILabel()
        dateLabel.font = .regular20
        dateLabel.textColor = .lightGray
        return dateLabel
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.font = .regular16
        descriptionLabel.textColor = .white
        descriptionLabel.numberOfLines = 0
        descriptionLabel.text = "상세 설명"
        return descriptionLabel
    }()
    
    private lazy var graphLabel: UILabel = {
        let graphLabel = UILabel()
        graphLabel.font = .regular16
        graphLabel.textColor = .white
        graphLabel.numberOfLines = 0
        graphLabel.text = "모집 현황"
        return graphLabel
    }()
    
    private lazy var graphImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "graph")
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        return imageView
    }()
    
    private lazy var applyButton: UIButton = UIButton.createButton(" 신청하기")
    
    private lazy var stackView: UIStackView = {
       let stackView = UIStackView(arrangedSubviews: [imageView, titleLabel, dateLabel, descriptionLabel, graphLabel, graphImageView])
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "상세 정보"
        applyButton.addTarget(self, action: #selector(applyButtonTapped), for: .touchUpInside)

        setupUI()
        updateUI()
        setupNavigationBar()
    }
    
    // MARK: - Public Method
    public func setContent(_ content: Contents) {
        self.content = content
        if isViewLoaded {
            updateUI()
        }
    }
    
    // MARK: - UI 설정
    override func setupUI() {
        view.addSubview(stackView)
        view.addSubview(applyButton)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
    
        NSLayoutConstraint.activate([
            applyButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            applyButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            applyButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            applyButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func setupNavigationBar() {
        let shareButton = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareContent))
        navigationItem.rightBarButtonItem = shareButton
        navigationItem.rightBarButtonItem?.tintColor = .white
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
        let alert = UIAlertController(title: "신청하시겠습니까?", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "취소", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "확인", style: .default, handler: { [weak self] _ in
                self?.navigationController?.popViewController(animated: true)
        }))
        present(alert, animated: true, completion: nil)
    }
}
//git add .
//git commit -m "feat : 마이페이지 뷰"
//git push origin Hyojeong

