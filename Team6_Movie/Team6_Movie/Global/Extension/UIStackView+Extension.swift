//
//  UIStackView+Extension.swift
//  Team6_Movie
//
//  Created by 김정원 on 8/27/24.
//

import Foundation
import UIKit

extension UIStackView {
    
    func addArrangedSubviews(_ views: UIView...) {
        for view in views {
            self.addArrangedSubview(view)
        }
    }
}
