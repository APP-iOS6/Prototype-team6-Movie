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
    case Sports
    case Movie
    case Concert
}

let kboContents: [Contents] = [
    Contents(category: .Sports, location: "서울", image: UIImage(named: "sport1")),
    Contents(category: .Sports, location: "대전", image: UIImage(named: "sport2")),
    Contents(category: .Sports, location: "광주", image: UIImage(named: "sport3")),
    Contents(category: .Sports, location: "서울", image: UIImage(named: "sport4")),
    Contents(category: .Sports, location: "대전", image: UIImage(named: "sport5")),
    Contents(category: .Sports, location: "광주", image: UIImage(named: "sport7"))
]

let movieContents: [Contents] = [
    Contents(category: .Movie, location: "서울", image: UIImage(named: "animation1")),
    Contents(category: .Movie, location: "대전", image: UIImage(named: "animation2")),
    Contents(category: .Movie, location: "광주", image: UIImage(named: "animation3")),
    Contents(category: .Movie, location: "광주", image: UIImage(named: "animation4")),
    Contents(category: .Movie, location: "광주", image: UIImage(named: "animation5")),
    Contents(category: .Movie, location: "광주", image: UIImage(named: "animation6"))
]

let concertContents: [Contents] = [
    Contents(category: .Concert, location: "서울", image: UIImage(named: "concert1")),
    Contents(category: .Concert, location: "서울", image: UIImage(named: "concert2")),
    Contents(category: .Concert, location: "서울", image: UIImage(named: "concert3")),
    Contents(category: .Concert, location: "서울", image: UIImage(named: "concert4")),
    Contents(category: .Concert, location: "서울", image: UIImage(named: "concert5")),
    Contents(category: .Concert, location: "서울", image: UIImage(named: "concert6"))
]
