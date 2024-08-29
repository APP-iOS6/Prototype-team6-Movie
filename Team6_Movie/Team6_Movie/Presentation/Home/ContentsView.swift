//
//  ContentsView.swift
//  Team6_Movie
//
//  Created by 김정원 on 8/27/24.
//

import Foundation
import UIKit

class ContentsView: UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    private let collectionView: UICollectionView
    private let contents: [Contents]
    private let widthSize = 98
    private let heightSize = 180
    private let titleButton = UIButton(type: .system)
    var onItemSelected: ((Contents) -> Void)?
    var onTitleButtonTapped: ((ContentCategory) -> Void)?
    
    
    init(contents: [Contents]) {
        self.contents = contents
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: widthSize, height: heightSize)
        layout.minimumLineSpacing = 10
        
        self.collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        self.collectionView.backgroundColor = .mainColor()
        super.init(frame: .zero)
        self.backgroundColor = .mainColor()
        setupTitleButton(title: contents[0].category.rawValue)
        setupCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupTitleButton(title: String) {
        titleButton.setTitle(title, for: .normal)
        titleButton.titleLabel?.font = .bold24
        titleButton.setTitleColor(.white, for: .normal)
        titleButton.contentHorizontalAlignment = .left
        titleButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(titleButton)
        
        // 오른쪽 화살표 이미지가 있는 UIButton 추가
        let arrowButton = UIButton(type: .system)
        arrowButton.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        arrowButton.tintColor = .white
        arrowButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(arrowButton)
        
        // UIButton 클릭 시 클로저 호출
        arrowButton.addAction(UIAction(handler: { [weak self] _ in
            guard let self = self else { return }
            self.onTitleButtonTapped?(self.contents[0].category)
        }), for: .touchUpInside)
        
        titleButton.addAction(UIAction(handler: { [weak self] _ in
            guard let self = self else { return }
            self.onTitleButtonTapped?(self.contents[0].category)
        }), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            titleButton.topAnchor.constraint(equalTo: topAnchor),
            titleButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleButton.trailingAnchor.constraint(equalTo: arrowButton.leadingAnchor, constant: -8),
            
            arrowButton.centerYAnchor.constraint(equalTo: titleButton.centerYAnchor),
            arrowButton.trailingAnchor.constraint(equalTo: titleButton.trailingAnchor, constant: -10),
            arrowButton.widthAnchor.constraint(equalToConstant: 12),
            arrowButton.heightAnchor.constraint(equalToConstant: 18)
        ])
    }
    
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ContentCell.self, forCellWithReuseIdentifier: "ContentCell")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: titleButton.bottomAnchor, constant: 0),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 180)
        ])
    }
    
    // UICollectionViewDataSource 메서드
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return contents.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ContentCell", for: indexPath) as! ContentCell
        let content = contents[indexPath.item]
        cell.configure(with: content)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedContent = contents[indexPath.item]
        onItemSelected?(selectedContent) // 선택된 셀이 있을 경우 클로저 호출
    }
}
