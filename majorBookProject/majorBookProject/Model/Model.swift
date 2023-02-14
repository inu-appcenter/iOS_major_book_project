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
    let bookId: Int
    let subjectId: Int
    let memberId: Int
    let title: String //책 제목
    let author: String //저자 이름
    let publisher: String // 출판사
    let year: Int // 발행년도
    let type: String // 교재분류
    let url: String // 도서정보 url
    var checked: Int // 저장횟수
}
