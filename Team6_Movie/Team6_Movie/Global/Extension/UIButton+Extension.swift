//
//  UIButton+Extension.swift
//  Team6_Movie
//
//  Created by 김정원 on 8/28/24.
//

import Foundation
import UIKit

extension UIButton {
    static func createButton(_ title: String) -> UIButton {
        let applyButton = UIButton()
        if let buttonImage = UIImage(named: "popcorn") {
            let resizedImage = buttonImage.resized(toWidth: 30) // 이미지의 너비를 조정
            applyButton.setImage(resizedImage?.withRenderingMode(.alwaysOriginal), for: .normal)
        }
        applyButton.setTitle(title, for: .normal)
        applyButton.setTitleColor(.black, for: .normal) // 텍스트 색상을 검정색으로 설정
        applyButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        applyButton.backgroundColor = .gray
        applyButton.tintColor = .black
        applyButton.layer.cornerRadius = 10
        applyButton.translatesAutoresizingMaskIntoConstraints = false
        return applyButton
    }
}
