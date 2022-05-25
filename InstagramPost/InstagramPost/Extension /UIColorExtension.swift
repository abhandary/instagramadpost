//
//  UIColorExtension.swift
//  InstagramPost
//
//  Created by John Nguyen on 2/27/22.
//

import Foundation
import UIKit

extension UIColor {
    static var random: UIColor {
        return UIColor(red: .random(in: 0...1),
                     green: .random(in: 0...1),
                       blue: .random(in: 0...1),
                       alpha: 1)
    }
}
