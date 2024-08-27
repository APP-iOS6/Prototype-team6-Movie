//
//  CategoryViewCell.swift
//  Team6_Movie
//
//  Created by 김정원 on 8/27/24.
//

import UIKit

class CategoryViewCell: UICollectionViewCell {
    
    private let imageView = UIImageView()
    private let titleLabel = UILabel()
    private let dateLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // 이미지뷰 설정
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8 // 이미지뷰에 모서리 둥글게
        imageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(imageView)
        
        // 타이틀 라벨 설정
        titleLabel.font = UIFont.boldSystemFont(ofSize: 12)
        titleLabel.textColor = .white
        titleLabel.numberOfLines = 2 // 타이틀이 두 줄까지 표시되도록 설정
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(titleLabel)
        
        // 날짜 라벨 설정
        dateLabel.font = UIFont.systemFont(ofSize: 10)
        dateLabel.textColor = .lightGray
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(dateLabel)
        
        // 오토레이아웃 설정
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 160),
            
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8),
            titleLabel.centerXAnchor.constraint(equalTo: imageView.centerXAnchor),
            
            dateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            dateLabel.centerXAnchor.constraint(equalTo: imageView.centerXAnchor),
            dateLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 콘텐츠 설정
    func configure(with content: Contents) {
        imageView.image = content.image
        titleLabel.text = "\(content.category.rawValue) - \(content.location)"
        dateLabel.text = content.date.toFormattedString()
    }
}
