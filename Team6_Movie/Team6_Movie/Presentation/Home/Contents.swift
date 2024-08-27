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
    let date = Calendar.current.date(from: DateComponents(year: 2024, month: (8...12).randomElement()!, day: (1...21).randomElement()!, hour: (12...19).randomElement()!, minute: 0))!
    let location: String
    let image: UIImage?
}

enum ContentCategory: String, CaseIterable {
    case KBO
    case Movie
    case Concert
}

let kboContents: [Contents] = [
    Contents(category: .KBO, location: "서울", image: UIImage(named: "image-19")),
    Contents(category: .KBO, location: "대전", image: UIImage(named: "image-20")),
    Contents(category: .KBO, location: "광주", image: UIImage(named: "image-22")),
    Contents(category: .KBO, location: "서울", image: UIImage(named: "image-23")),
    Contents(category: .KBO, location: "대전", image: UIImage(named: "image-24")),
    Contents(category: .KBO, location: "광주", image: UIImage(named: "image-25"))
]

let movieContents: [Contents] = [
    Contents(category: .Movie, location: "서울", image: UIImage(named: "image-1")),
    Contents(category: .Movie, location: "대전", image: UIImage(named: "image-2")),
    Contents(category: .Movie, location: "광주", image: UIImage(named: "image-3")),
    Contents(category: .Movie, location: "광주", image: UIImage(named: "image-4")),
    Contents(category: .Movie, location: "광주", image: UIImage(named: "image-5")),
    Contents(category: .Movie, location: "광주", image: UIImage(named: "image-6"))
]

let concertContents: [Contents] = [
    Contents(category: .Concert, location: "서울", image: UIImage(named: "image-7")),
    Contents(category: .Concert, location: "서울", image: UIImage(named: "image-8")),
    Contents(category: .Concert, location: "서울", image: UIImage(named: "image-9")),
    Contents(category: .Concert, location: "서울", image: UIImage(named: "image-10")),
    Contents(category: .Concert, location: "서울", image: UIImage(named: "image-11")),
    Contents(category: .Concert, location: "서울", image: UIImage(named: "image-12"))
]
