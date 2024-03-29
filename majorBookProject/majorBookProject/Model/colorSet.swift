//
//  colorSet.swift
//  majorBookProject
//
//  Created by 김민정 on 2023/02/07.
//

import Foundation
import UIKit

enum mainColorSet {
    case gray1
    case gray2
    case gray3
    case gray4
    case gray5
    case point
    case iris
}

extension UIColor {
    static func appColor(_ name: mainColorSet) -> UIColor {
        switch name {
        case .gray1:
            return #colorLiteral(red: 0.9607843137, green: 0.9607843137, blue: 0.9607843137, alpha: 1) //#F5F5F5
        case .gray2:
            return #colorLiteral(red: 0.8588235294, green: 0.8588235294, blue: 0.8588235294, alpha: 1) //#DBDBDB
        case .gray3:
            return #colorLiteral(red: 0.6745098039, green: 0.6745098039, blue: 0.6745098039, alpha: 1) //#AEAEAE
        case .gray4:
            return #colorLiteral(red: 0.4078431373, green: 0.4078431373, blue: 0.4078431373, alpha: 1) //#686868
        case .point:
            return #colorLiteral(red: 0.3647058824, green: 0.3725490196, blue: 0.937254902, alpha: 1) //#5D5FEF
        case .gray5:
            return #colorLiteral(red: 0.4988793731, green: 0.4988793731, blue: 0.4988793731, alpha: 1)
        case .iris:
            return #colorLiteral(red: 0.4705882353, green: 0.4745098039, blue: 0.9450980392, alpha: 1)
        }
      }
    
}
