//
//  TextFieldExtension++.swift
//  majorBookProject
//
//  Created by 한지훈 on 2023/02/04.
//

import UIKit

//TextField의 이미지를 넣기위한 Padding 추가, Image추가 Extension
extension UITextField {
    func addLeftPadding() {
        let padding = UIView(frame: CGRect(x: 16, y: 0, width: 15, height: frame.height))
        self.leftView = padding
        self.leftViewMode = .always
    }
}

