//
//  request.swift
//  majorBookProject
//
//  Created by 김민정 on 2023/02/24.
//

import Foundation
import UIKit
import Alamofire
    
func requestGet(data:postSubject, completion: @escaping ([Subject])->Void) {
    
    Service.getSubjects(data:data){ data in
        completion(data)
    }
    
    
}

func requestGetBook(id: Int, completion: @escaping (Book)->Void ) {
    Service.getBooks(id: id) { data in
        completion(data)
    }
}
    
    
