//
//  SlideshowView.swift
//  Team6_Movie
//
//  Created by 김정원 on 8/28/24.
//

import UIKit

class SlideshowViewController: UIViewController {
    
    private var onboardingImages: [UIImage] = [] // 이미지를 저장할 배열
    private var selectedImageIndex: Int = 0
    private var timer: Timer?
    
    private let scrollView = UIScrollView()
    private let pageControl = UIPageControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .mainColor()
        setupUI()
        setupImages()
        startTimer()
    }
    
    private func setupUI() {
        
        scrollView.backgroundColor = .mainColor()
        // ScrollView 설정
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.delegate = self
        scrollView.backgroundColor = .clear
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.8)
        ])
        
        // PageControl 설정
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.currentPageIndicatorTintColor = .orange
        //pageControl.pageIndicatorTintColor = UIColor(white: 0.7, alpha: 1.0)
        view.addSubview(pageControl)
        
        NSLayoutConstraint.activate([
            pageControl.topAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 20),
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func setupImages() {
        onboardingImages = [
            UIImage(named: "Group 27")!,
            UIImage(named: "Group 31")!,
            UIImage(named: "Group 29")!,
            UIImage(named: "Group 28")!,
            UIImage(named: "Group 30")!
        ]
        
        pageControl.numberOfPages = onboardingImages.count
        
        for (index, image) in onboardingImages.enumerated() {
            let imageView = UIImageView(image: image)
            imageView.contentMode = .scaleAspectFit
            imageView.translatesAutoresizingMaskIntoConstraints = false
            
            scrollView.addSubview(imageView)
            
            NSLayoutConstraint.activate([
                imageView.topAnchor.constraint(equalTo: scrollView.topAnchor),
                imageView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
                imageView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.8),
                imageView.heightAnchor.constraint(equalTo: scrollView.heightAnchor),
                imageView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor, constant: CGFloat(index) * view.bounds.width)
            ])
        }
        
        scrollView.contentSize = CGSize(width: view.bounds.width * CGFloat(onboardingImages.count), height: view.bounds.height * 0.8)
    }
    
    private func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(moveToNextPage), userInfo: nil, repeats: true)
    }
    
    @objc private func moveToNextPage() {
        selectedImageIndex = (selectedImageIndex + 1) % onboardingImages.count
        let offsetX = CGFloat(selectedImageIndex) * view.bounds.width * 1
        scrollView.setContentOffset(CGPoint(x: offsetX, y: 0), animated: true)
        pageControl.currentPage = selectedImageIndex
    }
    func resetTimer() {
        timer?.invalidate()
        startTimer()
    }
    
    deinit {
        timer?.invalidate()
    }
}

extension SlideshowViewController: UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        selectedImageIndex = Int(scrollView.contentOffset.x / view.bounds.width)
        pageControl.currentPage = selectedImageIndex
        resetTimer()
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        timer?.invalidate()
    }
}
