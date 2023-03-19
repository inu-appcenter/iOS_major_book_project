//
//  Service.swift
//  majorBookProject
//
//  Created by 김민정 on 2023/02/24.
//

import Foundation
import UIKit
import Alamofire

class Service {
    
    static let header: HTTPHeaders = ["Content-Type": "application/json","X-AUTH-TOKEN": "eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhbHN3amRzbGE0N0BpbnUuYWMua3IiLCJyb2xlcyI6WyJST0xFX1VTRVIiXSwiaWF0IjoxNjc5MjIzMDY4LCJleHAiOjE2NzkyNDEwNjh9.RPfWNEWkZ-QOYxaCts_cFDYXPNjH9jeQrLUPzw_NWsk"]

    
    static func signIn(data:loginModel, completion: @escaping ((loginSuccessModel) -> Void)) {
        let url = URL(string: "https://book-service.inuappcenter.kr/members/sign-in")!
        
        let request = AF.request(url,
                                 method: .post,
                                 parameters: data,
                                 encoder: JSONParameterEncoder.default,
                                 headers: header
        )
        
        request.responseDecodable(of: loginSuccessModel.self){
            dataResponse in
            
            switch dataResponse.result {
            case .success(let data):
                print("로그인 성공")
                completion(data)
            case .failure(let error):
                print(error)
                let data = loginSuccessModel(msg: "로그인 실패", success: false, token: "")
                completion(data)
            }
        }
        
    }
    
    static func getSubjects(data:postSubject, completion: @escaping ([Subject])->Void) {
        
        var urlComponent = URLComponents(string:"https://book-service.inuappcenter.kr/subjects")!
        if data.department != "" {
            let departmentQuery = URLQueryItem(name: "departmentName", value:data.department)
            urlComponent.queryItems = [departmentQuery]
        }
        else if data.professor != "" {
            let professorQuery = URLQueryItem(name:"professorName",value:data.professor)
            urlComponent.queryItems = [professorQuery]

        }
        else if data.name != ""{
            let nameQuery = URLQueryItem(name: "subjectName", value: data.name)
            urlComponent.queryItems = [nameQuery]
        }
        else {
            return
        }
        print(urlComponent)
        let request = AF.request(urlComponent,
                                     method: .get,
                                     parameters: data,
        headers: header)

        request.responseDecodable(of:[Subject].self) {
            dataResponse in

            switch dataResponse.result {

            case .success(let data):
                print("검색 성공")
                completion(data)
            case .failure(let error):
                print("검색 실패")
                print(error)
                completion([])

            }
        }
        
    }
    
    static func getBooks(id: Int, completion: @escaping (Book)->Void) {
        
        let url = URL(string: "https://book-service.inuappcenter.kr/books/" + "\(id)")!
        
        let request = AF.request(url,
                                method: .get,
                                encoding: JSONEncoding.default,
                                headers: header
        )
        
        request.responseDecodable(of: Book.self) {
            dataResponse in
            
            switch dataResponse.result {
            case.success(let data):
                print("책 조회 성공")
                completion(data)
                
            case.failure(let error):
                print("책 조회 실패")
                print(error)
            }
            
        }
        
    }
    
}
