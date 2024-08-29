//
//  DetailViewController.swift
//  Team6_Movie
//
//  Created by 김정원 on 8/27/24.
//

import UIKit

class DetailViewController: BaseViewController {
    
    private var content: Contents?
    private var isHeart = false
    var isApply = false
    
    // UI 요소들
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.heightAnchor.constraint(equalToConstant: 230).isActive = true
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
        dateLabel.font = .regular16
        dateLabel.textColor = .lightGray
        return dateLabel
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.font = .bold24
        descriptionLabel.textColor = .white
        descriptionLabel.numberOfLines = 0
        descriptionLabel.text = "상세 설명"
        return descriptionLabel
    }()
    
    private lazy var descriptionTextLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 4
        
        let attributedString = NSAttributedString(
            string: "혈귀로 변해버린 여동생 네즈코를 다시 인간으로 되돌리기 위해 비밀조직 귀살대의 조직원이 된 탄지로는 젠이츠, 이노스케와 함께 무한 열차를 타고 임무 수행에 나선다.",
            attributes: [
                .paragraphStyle: paragraphStyle,
                .font: UIFont.regular16,
                .foregroundColor: UIColor.lightGray
            ]
        )
        
        label.attributedText = attributedString
        return label
    }()
    
    private lazy var graphLabel: UILabel = {
        let graphLabel = UILabel()
        graphLabel.font = .bold24
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
    
    private lazy var likeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(likeButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var commentButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "message"), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(commentButtonTapped), for: .touchUpInside)
        return button
    }()

    private lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [likeButton, commentButton])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var applyButton: UIButton = UIButton.createButton(!isApply ? " 신청하기" : " 신청취소")
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [imageView, titleLabel, dateLabel, descriptionLabel, descriptionTextLabel, graphLabel, graphImageView])
        stackView.axis = .vertical
        stackView.spacing = 30
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
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        scrollView.addSubview(buttonStackView)
        scrollView.addSubview(applyButton)
        contentView.addSubview(stackView)

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),

            buttonStackView.topAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 16),
            buttonStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            buttonStackView.widthAnchor.constraint(equalToConstant: 100),
            buttonStackView.heightAnchor.constraint(equalToConstant: 50),

            applyButton.topAnchor.constraint(equalTo: buttonStackView.bottomAnchor, constant: 16),
            applyButton.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            applyButton.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),
            applyButton.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -16),
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
        
        let items: [Any] = [
            content.image ?? UIImage(),
            "\(content.category.rawValue) - \(content.location)",
            content.date.toFormattedString()
        ]
        
        let activityViewController = UIActivityViewController(activityItems: items, applicationActivities: nil)
        activityViewController.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(activityViewController, animated: true, completion: nil)
    }
    
    @objc private func likeButtonTapped() {
        isHeart.toggle()
        let heartIcon = isHeart ? "heart.fill" : "heart"
        likeButton.setImage(UIImage(systemName: heartIcon), for: .normal)
    }
    
    @objc private func commentButtonTapped() {
        let nextvc = CommentViewController()
        navigationController?.pushViewController(nextvc, animated: true)
    }
    
    @objc private func applyButtonTapped() {
            navigationController?.popViewController(animated: true)
    }
}
