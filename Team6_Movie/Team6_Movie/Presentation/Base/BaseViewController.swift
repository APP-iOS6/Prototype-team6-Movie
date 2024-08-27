//
//  BaseViewController.swift
//  Team6_Movie
//
//  Created by 김정원 on 8/27/24.
//

import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCustomBackButton()
        view.backgroundColor = .mainColor()
        setupNavigationBarColor()
    }
    
    func setupNavigationBarColor() {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .mainColor() // 네비게이션 바 배경색
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white] // 타이틀 텍스트 색상
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    func setupUI() {
        for subView in view.subviews {
            subView.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    func setupCustomBackButton() {
        guard navigationController?.viewControllers.count ?? 0 > 1 else { return } // 루트 뷰 컨트롤러에서는 백 버튼을 설정하지 않음
        let backButtonImage = UIImage(systemName: "arrow.backward")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        let backButton = UIBarButtonItem(image: backButtonImage, style: .plain, target: self, action: #selector(handleBackButton))
        navigationItem.leftBarButtonItem = backButton
    }

    
    @objc private func handleBackButton() {
        navigationController?.popViewController(animated: true)
    }
    
}
