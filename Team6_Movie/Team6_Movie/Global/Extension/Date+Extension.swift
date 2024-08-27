//
//  Date+Extension.swift
//  Team6_Movie
//
//  Created by 김정원 on 8/27/24.
//

import Foundation

extension Date {
    func toFormattedString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM.dd(E) HH:mm"
        formatter.locale = Locale(identifier: "ko_KR") // 한국어 요일 표시
        return formatter.string(from: self)
    }
}
