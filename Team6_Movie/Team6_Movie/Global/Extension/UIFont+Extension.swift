//
//  UIFont+Extension.swift
//  Team6_Movie
//
//  Created by 김정원 on 8/27/24.
//

import Foundation
import UIKit
extension UIFont {
    /// 24 20 16
    static var bold24 = UIFont(name: "Pretendard-Bold", size: 24) ?? UIFont.systemFont(ofSize: 24, weight: .bold)
    static var bold20 = UIFont(name: "Pretendard-Bold", size: 20) ?? UIFont.systemFont(ofSize: 20, weight: .bold)
    static var bold16 = UIFont(name: "Pretendard-Bold", size: 16) ?? UIFont.systemFont(ofSize: 16, weight: .bold)
    
    static var semibold24 = UIFont(name: "Pretendard-SemiBold", size: 24) ?? UIFont.systemFont(ofSize: 24, weight: .semibold)
    static var semibold20 = UIFont(name: "Pretendard-SemiBold", size: 20) ?? UIFont.systemFont(ofSize: 20, weight: .semibold)
    static var semibold16 = UIFont(name: "Pretendard-SemiBold", size: 16) ?? UIFont.systemFont(ofSize: 16, weight: .semibold)
    static var semibold12 = UIFont(name: "Pretendard-SemiBold", size: 12) ?? UIFont.systemFont(ofSize: 12, weight: .semibold)
    static var semibold8 = UIFont(name: "Pretendard-SemiBold", size: 8) ?? UIFont.systemFont(ofSize: 8, weight: .semibold)
    
    /// 24 20 16 12 8
    static var regular24 = UIFont(name: "Pretendard-Regular", size: 24) ?? UIFont.systemFont(ofSize: 24, weight: .regular)
    static var regular20 = UIFont(name: "Pretendard-Regular", size: 20) ?? UIFont.systemFont(ofSize: 20, weight: .regular)
    static var regular16 = UIFont(name: "Pretendard-Regular", size: 16) ?? UIFont.systemFont(ofSize: 16, weight: .regular)
    static var regular12 = UIFont(name: "Pretendard-Regular", size: 12) ?? UIFont.systemFont(ofSize: 12, weight: .regular)
    static var regular10 = UIFont(name: "Pretendard-Regular", size: 10) ?? UIFont.systemFont(ofSize: 10, weight: .regular)
}
