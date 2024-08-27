//
//  SearchViewController.swift
//  Team6_Movie
//
//  Created by 김정원 on 8/27/24.
//

import UIKit

class SearchViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {

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
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        view.backgroundColor = UIColor(red: 30/255, green: 32/255, blue: 30/255, alpha: 1.0)
        setupSearchBar()
        
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
            recentSearchTableView.heightAnchor.constraint(equalToConstant: 320)
        ])
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            self.view.endEditing(true)
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
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        recentSearchTableView.isHidden = true
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
        contentView.backgroundColor = UIColor(red: 30/255, green: 32/255, blue: 30/255, alpha: 1.0)
        
        
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
