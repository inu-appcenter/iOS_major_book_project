//
//  request.swift
//  majorBookProject
//
//  Created by 김민정 on 2023/02/24.
//

import Foundation
import UIKit
import Alamofire
    
func requestPost(data:postSubject, completion: @escaping ()->Void) {
    
    Service.getSubjects(data:data){
        completion()
    }
}
    
    
