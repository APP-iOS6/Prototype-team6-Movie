//
//  RecruitmentModel.swift
//  Team6_Movie
//
//  Created by 김수민 on 8/27/24.
//

import Foundation

struct Party {
    let imageFileName: String
    let mainText: String
    let subText: String
}


let partys = [
 Party(imageFileName: "image 28",
       mainText: "아임 히어로-더 스타디움",
       subText: """
일정 : 2024년 8월 28일 19:00
장소 : CGV 강변
모집 인원 : 100명
"""),
 
 Party(imageFileName: "image-19",
       mainText: "KBO LG트윈스 VS NC다이노스",
       subText: """
일정 : 2024년 6월 30일 17:00
장소 : 롯네시네마 건대
모집 인원 : 50명
"""),
 
 Party(imageFileName: "image-16",
       mainText: "선재업고튀어 마지막화",
       subText: """
일정 : 2024년 7월 10일 20:00
장소 : 메가박스 성수
모집 인원 : 200명
"""),
 
 Party(imageFileName: "image 22",
       mainText: "BTS <LOVE YOURSELF>",
       subText: """
일정 : 2024년 1월 25일 18:00
장소 : CGV 강변
모집 인원 : 220명
"""),
 
 Party(imageFileName: "image-6",
       mainText: "챔피언스 리그 결승 2022",
       subText: """
일정 : 2022년 10월 28일 4:00
장소 : 롯데시네마 잠실
모집 인원 : 200명
"""),
 
 Party(imageFileName: "image-3",
       mainText: "더 퍼스트 슬램덩크 응원상영",
       subText: """
일정 : 2023년 8월 28일 14:00
장소 : CGV 용산
모집 인원 : 180명
"""),

 
 Party(imageFileName: "image-8",
       mainText: "K리그 인천유나이티드 VS FC서울 ",
       subText: """
일정 : 2024년 7월 27일 19:30
장소 : 롯데시네마 하남스타필드
모집 인원 : 100명
"""),

 
 Party(imageFileName: "image-27",
       mainText: "환승연애3 마지막화",
       subText: """
일정 : 2024년 3월 28일
장소 : CGV 건대
모집 인원 : 250명
"""),



]

let buttonCategory = ["KBO", "콘서트", "영화", "스포츠", "기타"]
