//
//  request.swift
//  majorBookProject
//
//  Created by 김민정 on 2023/02/24.
//

import Foundation
import UIKit
import Alamofire
    

func requestLogin(data: loginModel, completion: @escaping (loginSuccessModel)->Void) {
    Service.signIn(data:data) {res in
        completion(res)
    }
}
func requestGet(data:postSubject, completion: @escaping ([Subject])->Void) {
    
    Service.getSubjects(data:data){ res in
        completion(res)
    }
}

func requestGetBook(id: Int, completion: @escaping (Book)->Void ) {
    Service.getBooks(id: id) { res in
        completion(res)
    }
}


    
    
