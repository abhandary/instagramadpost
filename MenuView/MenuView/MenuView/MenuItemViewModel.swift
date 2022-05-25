//
//  MenuViewModel.swift
//  MenuView
//
//  Created by John Nguyen on 10/7/21.
//

import Foundation

typealias MenuItemHandler = (String) -> Void

struct MenuItemViewModel {
    let menuItemImageName: String
    let menuItemHandler: MenuItemHandler
}
