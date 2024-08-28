//
//  CommentCell.swift
//  Team6_Movie
//
//  Created by 김효정 on 8/28/24.
//

import UIKit

class CommentCell: UITableViewCell {
    public lazy var commentNameLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .headline)
        label.textColor = .white
        return label
    }()
    
    public lazy var commentDateLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .footnote)
        label.textColor = .systemGray3
        return label
    }()
    
    public lazy var commentContentLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        return label
    }()
    
    public lazy var profileImage: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 25
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var vStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 5
        return stackView
    }()
    
    private lazy var hStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 15
        stackView.alignment = .center
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .mainColor()
        contentView.addSubview(hStackView)
        hStackView.addArrangedSubview(profileImage)
        hStackView.addArrangedSubviews(vStackView)
        vStackView.addArrangedSubview(commentNameLabel)
        vStackView.addArrangedSubview(commentDateLabel)
        vStackView.addArrangedSubview(commentContentLabel)
        
        hStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            hStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            hStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            hStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            hStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            
            commentDateLabel.topAnchor.constraint(equalTo: commentNameLabel.bottomAnchor),
            
            profileImage.widthAnchor.constraint(equalToConstant: 50),
            profileImage.heightAnchor.constraint(equalTo: profileImage.widthAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
