//
//  CommentViewController.swift
//  Team6_Movie
//
//  Created by 김효정 on 8/28/24.
//

import UIKit

struct Comment {
    let userName: String
    let date: Date
    let content: String
    let image: UIImage
    
    var dateString: String {
        date.formatted(date: .abbreviated, time: .shortened)
    }
}

class CommentViewController: BaseViewController, UITableViewDataSource {
    
    var comments: [Comment] = []
    
    private lazy var commentTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(CommentCell.self, forCellReuseIdentifier: "CommentCell")
        tableView.dataSource = self
        tableView.backgroundColor = .mainColor()
        
        return tableView
    }()
    
    private lazy var searchTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "댓글을 입력해주세요."
        textField.font = .regular16
        textField.borderStyle = .roundedRect
        textField.clearButtonMode = .whileEditing

        
        return textField
    }()
    
    private lazy var sendCommentButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "arrowshape.up.fill"), for: .normal)
        button.backgroundColor = .white
        button.tintColor = .mainColor()
        button.layer.cornerRadius = 5
        
        button.addAction(UIAction { _ in
            self.searchTextField.text = ""
            self.searchTextField.resignFirstResponder()
        }, for: .touchUpInside)
        
        return button
    }()
    
    private lazy var hStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 5
        stackView.alignment = .center
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupInterface()
        setupLayout()
        loadComments()
    }
    
    private func setupInterface() {
        view.addSubview(commentTableView)
        view.addSubview(hStackView)
        hStackView.addArrangedSubview(searchTextField)
        hStackView.addArrangedSubview(sendCommentButton)
    }
    
    private func setupLayout() {
        commentTableView.translatesAutoresizingMaskIntoConstraints = false
        hStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            commentTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            commentTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            commentTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            commentTableView.bottomAnchor.constraint(equalTo: searchTextField.topAnchor),
            
            hStackView.leadingAnchor.constraint(equalTo: commentTableView.leadingAnchor, constant: 10),
            hStackView.trailingAnchor.constraint(equalTo: commentTableView.trailingAnchor, constant: -10),
            hStackView.bottomAnchor.constraint(equalTo: view.keyboardLayoutGuide.topAnchor, constant: -10),
            
            sendCommentButton.widthAnchor.constraint(equalToConstant: 40),
            sendCommentButton.heightAnchor.constraint(equalTo: searchTextField.heightAnchor)
        ])
    }
    
    private func loadComments() {
            comments = [
                Comment(userName: "이글", date: .now, content: "우와 재밌겠다~", image: UIImage(named: "1")!),
                Comment(userName: "가솜", date: .now, content: "저도 보고 싶네요", image: UIImage(named: "2")!),
                Comment(userName: "가디", date: .now, content: "재밌을 것 같아요", image: UIImage(named: "3")!),
                Comment(userName: "또또", date: .now, content: "같이 보실 분 신청하기 버튼 눌러주세요~!", image: UIImage(named: "4")!),
                Comment(userName: "농담곰", date: .now, content: "👍👍👍👍👍", image: UIImage(named: "5")!)
            ]
            commentTableView.reloadData()
        }

    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }
    
    // 셀 내용
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CommentCell = tableView.dequeueReusableCell(withIdentifier: "CommentCell", for: indexPath) as! CommentCell
        let comment = comments[indexPath.row]
        
        cell.commentNameLabel.text = comment.userName
        cell.commentDateLabel.text = comment.dateString
        cell.commentContentLabel.text = comment.content
        cell.profileImage.image = comment.image
        return cell
    }
}

#Preview {
    CommentViewController()
}
