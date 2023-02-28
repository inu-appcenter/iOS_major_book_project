//
//  BookMarkModel.swift
//  majorBookProject
//
//  Created by 김민정 on 2023/02/14.
//

import Foundation
import SwiftUI


struct Book {
    let author: String
    let id: Int
    let isSaved: Bool
    let publisher: String
    let title: String
    let type:String
    let year: Int
}

struct SubjectResponse {
    let memberId: Int
    let name: String
    let major: String
    let bookList: [Book]
}

struct Welcome: Codable {
    let books, department: String
    let id: Int
    let name, professor, subjectType: String
}

struct Subject: Codable {
    let department: String
    let id: Int
    let name, professor, subjectType: String
}

struct postSubject: Codable { // 이건 데이터 보낼때 모델(body?)
    let department: String
    let name: String
    let professor: String
}

struct searchModel: Codable {
    let dropBtn: String
    let searchText: String
}


