//
//  UIColor+Extension.swift
//  Team6_Movie
//
//  Created by 김정원 on 8/27/24.
//

import Foundation
import UIKit
extension UIColor {
    
    // MARK: 색상변환 메서드
    class func fromRGB(_ r:Double, _ g: Double, _ b: Double, _ a: Double) -> UIColor {
        return UIColor(red: CGFloat(r / 255.0), green: CGFloat(g / 255.0), blue: CGFloat(b / 255.0), alpha: CGFloat(a))
    }
    
    class func mainColor() -> UIColor {
        return .fromRGB(28, 28, 28, 1)
    }
    
}
