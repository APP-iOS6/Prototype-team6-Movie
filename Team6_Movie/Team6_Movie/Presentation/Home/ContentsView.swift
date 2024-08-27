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
    private let heightSize = 150
    private let titleButton = UIButton(type: .system)
    var onItemSelected: ((Contents) -> Void)?
    var onTitleButtonTapped: (() -> Void)?

   
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
        titleButton.setTitle("\(title) >", for: .normal)
        titleButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        titleButton.setTitleColor(.white, for: .normal)
        titleButton.contentHorizontalAlignment = .left
        titleButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(titleButton)
        // UIButton 클릭 시 클로저 호출
        titleButton.addAction(UIAction(handler: { [weak self] _ in
            self?.onTitleButtonTapped?()
        }), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            titleButton.topAnchor.constraint(equalTo: topAnchor),
            titleButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
    }
    
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ContentCell.self, forCellWithReuseIdentifier: "ContentCell")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: titleButton.bottomAnchor, constant: 3),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 200)
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
}

#Preview {
    ContentsView(contents: content)
}
