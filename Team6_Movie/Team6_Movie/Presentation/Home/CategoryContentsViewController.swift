//
//  CategoryContentsViewController.swift
//  Team6_Movie
//
//  Created by 김정원 on 8/27/24.
//

import UIKit

class CategoryContentsViewController: UIViewController {
    
    private var contents: [Contents] = [] // 카테고리 콘텐츠 배열
    
    // UICollectionView 설정
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 5
        return UICollectionView(frame: .zero, collectionViewLayout: layout)
    }()
    
    // MARK: - Public Method
    
    public func setCategory(_ category: ContentCategory) {
        switch category {
        case .Sports:
            contents = kboContents
        case .Movie:
            contents = movieContents
        case .Concert:
            contents = concertContents
            
        }
        self.title = category.rawValue
        if isViewLoaded {
            collectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .mainColor()
        
        setupUI()
        collectionView.reloadData()
    }
    
    private func setupUI() {
        // UICollectionView 설정
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CategoryViewCell.self, forCellWithReuseIdentifier: "CategoryViewCell") // 셀 등록 수정
        collectionView.backgroundColor = .mainColor()
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(collectionView)
        
        // 오토레이아웃 설정
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension CategoryContentsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return contents.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryViewCell", for: indexPath) as! CategoryViewCell
        let content = contents[indexPath.item]
        cell.configure(with: content)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numberOfItemsPerRow: CGFloat = 3
        let spacing: CGFloat = 10
        let totalSpacing = (numberOfItemsPerRow - 1) * spacing + collectionView.contentInset.left + collectionView.contentInset.right
        let width = (collectionView.bounds.width - totalSpacing) / numberOfItemsPerRow
        return CGSize(width: width, height: width + 80) // 정사각형 + 라벨 높이 추가
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedContent = contents[indexPath.item]
        // 선택된 콘텐츠 처리 (예: 상세 페이지로 이동)
        let detailVC = DetailViewController()
        detailVC.setContent(selectedContent)
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
