//
//  SearchViewController.swift
//  Team6_Movie
//
//  Created by 김정원 on 8/27/24.
//

import UIKit

class SearchViewController: BaseViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {

    private var recentSearches: [(image: UIImage?, title: String, subtitle: String)] = [
        (UIImage(named: "image 28"), "임영웅 콘서트", "콘서트"),
        (UIImage(named: "image-3"), "슬램덩크", "애니메이션"),
        (UIImage(named: "image-19"), "야구 중계", "KBO"),
        (UIImage(named: "image-10"), "한국시리즈", "KBO"),
        (UIImage(named: "image-11"), "테니스", "스포츠")
    ]
    
    private lazy var queryTextField: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(string: "검색어를 입력해주세요.",
                                                             attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .darkGray
        textField.textColor = .systemGray6
        textField.tintColor = .systemGray6
        textField.delegate = self
        
        
        // 검색어 변경 시 처리
        textField.addAction(UIAction(handler: { _ in
            print("editingChanged: \(textField.text ?? "(none)")")
            
        }), for: .editingChanged)
        
        
        let image = UIImage(systemName: "magnifyingglass")
        textField.leftView = UIImageView(image: image)
        textField.leftViewMode = .always
        
        
        let clearButton = UIButton()
        clearButton.setImage(UIImage(systemName: "xmark.circle.fill"), for: .normal)
        clearButton.addAction(UIAction(handler: { _ in
            textField.text = ""
            self.recentSearchTableView.isHidden = true
            
        }), for: .touchUpInside)
        
        
        textField.rightView = clearButton
        textField.rightViewMode = .whileEditing
        
        
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    
    private lazy var kboButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "KBO2"), for: .normal)
//        button.setTitle("KBO", for: .normal)
//        button.titleLabel?.font = .systemFont(ofSize: 25)
//        button.setTitleColor(.white, for: .normal)
//        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        button.backgroundColor = .darkGray
        button.layer.cornerRadius = 11
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.addAction(UIAction { [weak self] _ in
            let detailVC = CategoryContentsViewController()
            detailVC.setCategory(.Sports)
            self?.navigationController?.pushViewController(detailVC, animated: true)        }, for: .touchUpInside)
        
        return button
    }()
    
    private lazy var movieButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Movie"), for: .normal)
//        button.setTitle("영화", for: .normal)
//        button.titleLabel?.font = .systemFont(ofSize: 25)
//        button.setTitleColor(.white, for: .normal)
//        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        button.backgroundColor = .darkGray
        button.layer.cornerRadius = 11
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.addAction(UIAction { [weak self] _ in
            let detailVC = CategoryContentsViewController()
            detailVC.setCategory(.Movie)
            self?.navigationController?.pushViewController(detailVC, animated: true)        }, for: .touchUpInside)
        
        return button
    }()
    
    private lazy var concertButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Concert"), for: .normal)
//        button.setTitle("콘서트", for: .normal)
//        button.titleLabel?.font = .systemFont(ofSize: 25)
//        button.setTitleColor(.white, for: .normal)
//        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        button.backgroundColor = .darkGray
        button.layer.cornerRadius = 11
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.addAction(UIAction { [weak self] _ in
            let detailVC = CategoryContentsViewController()
            detailVC.setCategory(.Concert)
            self?.navigationController?.pushViewController(detailVC, animated: true)        }, for: .touchUpInside)
        
        return button
    }()
    
    private lazy var animationButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Animation"), for: .normal)
//        button.setTitle("애니메이션", for: .normal)
//        button.titleLabel?.font = .systemFont(ofSize: 25)
//        button.setTitleColor(.white, for: .normal)
//        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        button.backgroundColor = .darkGray
        button.layer.cornerRadius = 11
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.addAction(UIAction { [weak self] _ in
            let detailVC = CategoryContentsViewController()
            detailVC.setCategory(.Concert)
            self?.navigationController?.pushViewController(detailVC, animated: true)        }, for: .touchUpInside)
        
        return button
    }()
    
    private lazy var sportButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Sport"), for: .normal)
//        button.setTitle("스포츠", for: .normal)
//        button.titleLabel?.font = .systemFont(ofSize: 25)
//        button.setTitleColor(.white, for: .normal)
//        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        button.backgroundColor = .darkGray
        button.layer.cornerRadius = 11
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.addAction(UIAction { [weak self] _ in
            let detailVC = CategoryContentsViewController()
            detailVC.setCategory(.Sports)
            self?.navigationController?.pushViewController(detailVC, animated: true)        }, for: .touchUpInside)
        
        return button
    }()
    
    private lazy var etcButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "etc"), for: .normal)
//        button.setTitle("기타", for: .normal)
//        button.titleLabel?.font = .systemFont(ofSize: 25)
//        button.setTitleColor(.white, for: .normal)
//        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        button.backgroundColor = .darkGray
        button.layer.cornerRadius = 11
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.addAction(UIAction { [weak self] _ in
            let detailVC = CategoryContentsViewController()
            detailVC.setCategory(.Sports)
            self?.navigationController?.pushViewController(detailVC, animated: true)        }, for: .touchUpInside)
        
        
        return button
    }()
    
    
    
    
    public lazy var hStackViewFirst: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    public lazy var hStackViewSecond: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    
    public lazy var hStackViewThird: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    
    
    public lazy var vStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    
    private lazy var recentSearchTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.dataSource = self
        tableView.delegate = self
        tableView.isHidden = true
        
        tableView.register(RecentSearchCell.self, forCellReuseIdentifier: "RecentSearchCell")
        
        tableView.layer.cornerRadius = 8
        tableView.layer.borderWidth = 1
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "검색"
        setupSearchBar()
        setupButtonInterface()
        setupButtonLayout()
    }
    
    
    func setupButtonInterface() {
        view.addSubview(vStackView)

        vStackView.addArrangedSubviews(hStackViewFirst,hStackViewSecond, hStackViewThird)
        hStackViewFirst.addArrangedSubviews(sportButton, movieButton)
        hStackViewSecond.addArrangedSubviews(concertButton, animationButton)
        hStackViewThird.addArrangedSubviews(kboButton, etcButton)
        
    }
    
    func setupButtonLayout() {
        
        NSLayoutConstraint.activate([
            vStackView.topAnchor.constraint(equalTo: queryTextField.bottomAnchor, constant: 50),
            vStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            vStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            hStackViewFirst.heightAnchor.constraint(equalToConstant: 100),
            hStackViewSecond.heightAnchor.constraint(equalToConstant: 100),
            hStackViewThird.heightAnchor.constraint(equalToConstant: 100)
            
            
        ])
    }
    

    
    private func setupSearchBar() {
        view.addSubview(queryTextField)
        view.addSubview(recentSearchTableView)
        
        // Auto Layout constraints for queryTextField
        NSLayoutConstraint.activate([
            queryTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            queryTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            queryTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            queryTextField.heightAnchor.constraint(equalToConstant: 40),
            
            recentSearchTableView.topAnchor.constraint(equalTo: queryTextField.bottomAnchor, constant: 8),
            recentSearchTableView.leadingAnchor.constraint(equalTo: queryTextField.leadingAnchor),
            recentSearchTableView.trailingAnchor.constraint(equalTo: queryTextField.trailingAnchor),
            recentSearchTableView.heightAnchor.constraint(equalToConstant: 345)
        ])
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            self.view.endEditing(true)
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = view.backgroundColor // 헤더 배경색 설정

        // "최근 검색한 항목" 레이블
        let titleLabel = UILabel()
        titleLabel.text = "최근 검색한 항목"
        titleLabel.font = .systemFont(ofSize: 12)
        titleLabel.textColor = .white
        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        // "지우기" 버튼
        let clearButton = UIButton(type: .system)
        clearButton.setTitle("지우기", for: .normal)
        clearButton.setTitleColor(.systemBlue, for: .normal)
        clearButton.translatesAutoresizingMaskIntoConstraints = false
        clearButton.addTarget(self, action: #selector(clearRecentSearches), for: .touchUpInside)

        // 스택 뷰에 레이블과 버튼 추가
        let stackView = UIStackView(arrangedSubviews: [titleLabel, clearButton])
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        headerView.addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: headerView.topAnchor, constant: -10),
            stackView.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -20),
            stackView.bottomAnchor.constraint(equalTo: headerView.bottomAnchor)
        ])

        return headerView
    }

    
    // 헤더 뷰의 높이 설정
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }

    
    // 지우기 버튼 액션
    @objc private func clearRecentSearches() {
        recentSearches.removeAll()
        recentSearchTableView.reloadData()
    }

    
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recentSearches.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecentSearchCell", for: indexPath) as! RecentSearchCell
        let searchItem = recentSearches[indexPath.row]
        cell.configure(with: searchItem.image, title: searchItem.title, subtitle: searchItem.subtitle)
        return cell
    }
    
    
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedSearch = recentSearches[indexPath.row].title
        queryTextField.text = selectedSearch
        tableView.isHidden = true
    }
    
    
    // MARK: - UITextFieldDelegate
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        recentSearchTableView.isHidden = false
        vStackView.isHidden = true

    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        recentSearchTableView.isHidden = true
        vStackView.isHidden = false
    }
    
}


// Custom UITableViewCell for Recent Searches
class RecentSearchCell: UITableViewCell {
    
    private let searchImageView = UIImageView()
    private let titleLabel = UILabel()
    private let subtitleLabel = UILabel()
    
    private let separator: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray // 원하는 구분선 색상
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        contentView.addSubview(separator)
        
        // 구분선 위치 설정 (아래쪽에 전체 폭으로 설정)
        NSLayoutConstraint.activate([
            separator.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 70),
            separator.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            separator.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            separator.heightAnchor.constraint(equalToConstant: 0.5) // 구분선 두께
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        contentView.backgroundColor = .mainColor()
        
        
        searchImageView.contentMode = .scaleAspectFill
        searchImageView.layer.cornerRadius = 8
        searchImageView.clipsToBounds = true
        searchImageView.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.textColor = .white
        titleLabel.font = .systemFont(ofSize: 16, weight: .bold)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        subtitleLabel.textColor = .lightGray
        subtitleLabel.font = .systemFont(ofSize: 14)
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(searchImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(subtitleLabel)
        
        NSLayoutConstraint.activate([
            searchImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            searchImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            searchImageView.widthAnchor.constraint(equalToConstant: 50),
            searchImageView.heightAnchor.constraint(equalToConstant: 50),
            
            titleLabel.leadingAnchor.constraint(equalTo: searchImageView.trailingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            
            subtitleLabel.leadingAnchor.constraint(equalTo: searchImageView.trailingAnchor, constant: 10),
            subtitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            subtitleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
    
    func configure(with image: UIImage?, title: String, subtitle: String) {
        searchImageView.image = image
        titleLabel.text = title
        subtitleLabel.text = subtitle
    }
}

#Preview {
    SearchViewController()
}


