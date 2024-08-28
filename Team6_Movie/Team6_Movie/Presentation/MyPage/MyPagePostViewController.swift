//
//  MyPagePostViewController.swift
//  Team6_Movie
//
//  Created by 김정원 on 8/28/24.
//

import UIKit

class MyPagePostViewController: BaseViewController {
    
    private var filteredPartys: [Party] = []
    
    private lazy var postSegmentedControl: UISegmentedControl = {
        
        let segmentedControl = UISegmentedControl(items: ["작성한 글", "댓글단 글"])
        segmentedControl.selectedSegmentIndex = 0
        
        return segmentedControl
    }()
    
    private lazy var firstView: UIView = {
        let view = UIView()
        view.backgroundColor = .mainColor()
        return view
    }()
    
    private lazy var firstLabel: UILabel = {
        let label = UILabel()
        label.text = "첫 커뮤니티 이야기를 모두에게 들려주세요."
        label.textColor = .systemGray4
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var firstButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("커뮤니티 글쓰기", for: .normal)
        button.setTitleColor(.mainColor(), for: .normal)
        button.backgroundColor = .systemGray4
        button.layer.cornerRadius = 10
        
        button.addAction(UIAction(handler: { [weak self] _ in
            let nextVC = WriteViewController()
            self?.navigationController?.pushViewController(nextVC, animated: true)
        }), for: .touchUpInside)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var secondView: UIView = {
        let view = UIView()
        view.backgroundColor = .mainColor()
        return view
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(PartyCell.self, forCellReuseIdentifier: "PartyCell")
        tableView.backgroundColor = .mainColor()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.contentInset = UIEdgeInsets(top: 30, left: 0, bottom: 0, right: 0)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .mainColor()
        
        setupInterface()
        setupLayout()
        
        // 네비게이션 타이틀 색상 설정
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .mainColor() // 네비게이션 바 배경색
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white] // 타이틀 텍스트 색상
        
        navigationController?.navigationBar.tintColor = .white
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        self.title = "커뮤니티 활동"
        
        filteredPartys = partys.filter { $0.mainText == "아임 히어로-더 스타디움" }
    }
    
    func setupInterface() {
        view.addSubview(postSegmentedControl)
        view.addSubview(firstView)
        firstView.addSubview(firstLabel)
        firstView.addSubview(firstButton)
        view.addSubview(secondView)
        secondView.addSubview(tableView)
    }
    
    func setupLayout() {
        for subview in view.subviews {
            subview.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            // SegmentedControl
            postSegmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            postSegmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            postSegmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            // 작성한 글 뷰
            firstView.topAnchor.constraint(equalTo: postSegmentedControl.bottomAnchor, constant: 10),
            firstView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            firstView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            firstView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            // 첫번째 뷰 컴포넌트
            firstLabel.centerXAnchor.constraint(equalTo: firstView.centerXAnchor),
            firstLabel.topAnchor.constraint(equalTo: firstView.topAnchor, constant: 130),
            
            firstButton.centerXAnchor.constraint(equalTo: firstView.centerXAnchor),
            firstButton.topAnchor.constraint(equalTo: firstLabel.bottomAnchor, constant: 50),
            firstButton.widthAnchor.constraint(equalToConstant: 130),
            
            // 댓글단 글 뷰
            secondView.topAnchor.constraint(equalTo: postSegmentedControl.bottomAnchor, constant: 10),
            secondView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            secondView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            secondView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            // 세컨 뷰 테이블뷰
            tableView.topAnchor.constraint(equalTo: secondView.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: secondView.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: secondView.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: secondView.bottomAnchor)
        ])
        
        secondView.isHidden = true
        
        postSegmentedControl.addAction(UIAction(handler: { _ in
            self.updateView()
        }), for: .valueChanged)
    }
    
    // 선택된 세그먼트에 따라 화면 업데이트
    private func updateView() {
        switch postSegmentedControl.selectedSegmentIndex {
        case 0:
            firstView.isHidden = false
            secondView.isHidden = true
        case 1:
            firstView.isHidden = true
            secondView.isHidden = false
        default:
            break
        }
    }
    
    private func setupNavigationBar() {
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate
extension MyPagePostViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredPartys.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PartyCell", for: indexPath) as! PartyCell
        let party = filteredPartys[indexPath.row]
        cell.partyImageView.image = UIImage(named: party.imageFileName)
        cell.mainLabel.text = party.mainText
        cell.mainLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        cell.subLabel.text = party.subText
        cell.subLabel.font = UIFont.preferredFont(forTextStyle: .footnote)
        cell.contentView.backgroundColor = .mainColor()
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 상세 정보로 네비게이션
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
