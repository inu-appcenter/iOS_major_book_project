//
//  BookMarkModel.swift
//  majorBookProject
//
//  Created by 김민정 on 2023/02/14.
//

import Foundation
import SwiftUI


struct Member {
    let memberId: Int
    let name: String
    let major: String
    let bookList: [Book]
}

struct Book {
    var bookId: Int
    var subjectId: Int
    var memberId: Int
    var title: String //책 제목
    var author: String //저자 이름
    var publisher: String // 출판사
    var year: Int // 발행년도
    var type: String // 교재분류
    var url: String // 도서정보 url
    var checked: Int // 저장횟수
    
}


