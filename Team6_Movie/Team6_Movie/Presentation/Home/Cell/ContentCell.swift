//
//  ContentCell.swift
//  Team6_Movie
//
//  Created by 김정원 on 8/27/24.
//

import UIKit

class ContentCell: UICollectionViewCell {
    
    private let imageView = UIImageView()
    private let dateLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(imageView)
        
        dateLabel.font = .semibold12
        dateLabel.textColor = .white
        dateLabel.numberOfLines = 2
        dateLabel.textAlignment = .center
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(dateLabel)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 141),
            
            dateLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 4),
            dateLabel.centerXAnchor.constraint(equalTo: imageView.centerXAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 콘텐츠 설정
    func configure(with content: Contents) {
        imageView.image = content.image
        dateLabel.text = "\(content.date.toFormattedString()) \n \(content.location)"
    }
    

}
