//
//  UIColorExtension.swift
//  Post
//
//  Created by John Nguyen on 1/30/22.
//

import UIKit

extension UIColor {
    static var random: UIColor {
        return .init(hue: .random(in: 0...1),
                     saturation: 1,
                     brightness: 1,
                     alpha: 1)
    }
}



