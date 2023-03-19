//
//  BookMarkModel.swift
//  majorBookProject
//
//  Created by 김민정 on 2023/02/14.
//

import Foundation
import SwiftUI


struct Book: Codable {
    var author: String?
    var id: Int
    var publisher: String?
    var title: String?
    var type:String?
    var year: Int?
    
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

struct Subject: Codable { //getSubjects 비회원 로그인 검색 get
    let departmentName: String
    let id: Int
    let subjectName, professorName, subjectType: String
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

struct loginModel: Codable {
    let email: String
    let password: String
}

struct loginSuccessModel: Codable {
    let msg: String
    let success: Bool
    let token: String
}


