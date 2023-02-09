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
    case point
}

extension UIColor {
    static func appColor(_ name: mainColorSet) -> UIColor {
        switch name {
        case .gray1:
            return #colorLiteral(red: 0.9688159823, green: 0.9688159823, blue: 0.9688159823, alpha: 1)
        case .gray2:
            return #colorLiteral(red: 0.8861967921, green: 0.8861967921, blue: 0.8861967921, alpha: 1)
        case .gray3:
            return #colorLiteral(red: 0.7370622158, green: 0.7370622158, blue: 0.7370622158, alpha: 1)
        case .gray4:
            return #colorLiteral(red: 0.4834214449, green: 0.4834213853, blue: 0.4834214449, alpha: 1)
        case .point:
            return #colorLiteral(red: 0.4411054254, green: 0.47596246, blue: 0.9510416389, alpha: 1)
        }
      }
    
}
