//
//  Contents.swift
//  Team6_Movie
//
//  Created by 김정원 on 8/27/24.
//

import Foundation
import UIKit

import UIKit

struct Contents {
    let category: ContentCategory
    let date = Calendar.current.date(from: DateComponents(year: 2024, month: 7, day: 21, hour: 17, minute: 0))!
    let location: String
    let image: UIImage?
}

enum ContentCategory: String, CaseIterable {
    case KBO
    case Movie
    case Concert
}

let content: [Contents] = [
    Contents(category: .KBO, location: "서울", image: UIImage(named: "kbo")),
    Contents(category: .KBO, location: "대전", image: UIImage(named: "kbo")),
    Contents(category: .KBO, location: "광주", image: UIImage(named: "kbo")),
    Contents(category: .KBO, location: "대구", image: UIImage(named: "kbo")),
    Contents(category: .KBO, location: "대구", image: UIImage(named: "kbo")),
]
