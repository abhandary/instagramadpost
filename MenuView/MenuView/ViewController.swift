//
//  ViewController.swift
//  MenuView
//
//  Created by John Nguyen on 10/7/21.
//

import UIKit

struct MenuItemModel {
    let imageURL: String
    let id: String
}

class ViewController: UIViewController {
    
    @IBOutlet weak var menuView: MenuView!
    
    var viewModel: [MenuItemModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuView.update(withMenuItems: createMenuItems())
    }
    
//    private func createMenuItems(withModels models: [MenuItemModel]) -> [MenuItemViewModel] {
//        var viewModels: [MenuItemViewModel] = []
//        for (index,model) in models.enumerated() {
//            let viewModel = MenuItemViewModel(menuItemImageName: model.imageURL, id: model.id, h) { (id) in
//                print("\(index) was clicked")
//
//            }
//
//            viewModels.append(viewModel)
//        }
//
//        return viewModels
//    }
    
    private func createMenuItems() -> [MenuItemViewModel] {
        let firstMenuItem = MenuItemViewModel(menuItemImageName: "play", menuItemHandler: menuItemOneHandler())
        let secondMenuItem = MenuItemViewModel(menuItemImageName: "sound", menuItemHandler: menuItemTwoHandler())
        let thirdMenuItem = MenuItemViewModel(menuItemImageName: "stop", menuItemHandler: menuItemThreeHandler())
        
        return [firstMenuItem, secondMenuItem, thirdMenuItem]
    }
    //Go to page with an index or id of some sort
    private func menuItemOneHandler() -> MenuItemHandler {
        return { (id) in
            print("menu item one clicked \(id)")
        }
    }
    
    private func menuItemTwoHandler() -> MenuItemHandler {
        return { (id) in
            print("menu item two clicked \(id)")
        }
    }
    
    private func menuItemThreeHandler() -> MenuItemHandler {
        return { (id) in
            print("menu item three clicked \(id)")
        }
    }
}

extension ViewController: MenuViewDelegate {
    func handleButtonTapped(withId id: String) {
        print("menuItem click \(id)")
    }
}

