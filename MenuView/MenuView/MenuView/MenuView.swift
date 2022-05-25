//
//  MenuView.swift
//  MenuView
//
//  Created by John Nguyen on 10/7/21.
//

import UIKit


class MenuItemView: UIView {
    @IBOutlet weak var menuIcon: UIImageView!
    
    func configure(withViewModel viewModel: MenuItemViewModel) {
        menuIcon.image = UIImage(named: viewModel.menuItemImageName)
    }
}

protocol MenuViewDelegate: AnyObject {
    func handleButtonTapped(withId id: String)
}

class MenuView: UIView {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var horizontalStackView: UIStackView!
    
    private var menuItems: [MenuItemViewModel] = []
    
    weak var delegate: MenuViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        customInit()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        customInit()
    }
    
    public func update(withMenuItems menuItems: [MenuItemViewModel]) {
        self.menuItems = menuItems
        collectionView.reloadData()
 
    }
    
    private func customInit() {
        let nib = UINib(nibName: "MenuView", bundle: nil)
        if let view = nib.instantiate(withOwner: self, options: nil).first as? UIView {
            view.frame = bounds
            view.backgroundColor = UIColor.gray
            view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
            addSubview(view)
        }
        
        setupCollectionView()
    }
    
    
    private func setupCollectionView() {
        registerCells()
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    private func registerCells() {
        collectionView.register(UINib(nibName: "MenuItemCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MenuItemCollectionViewCell")
    }
}

extension MenuView: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MenuItemCollectionViewCell", for: indexPath) as? MenuItemCollectionViewCell {
            let menuItem = menuItems[indexPath.row]
            let menuItemImage = UIImage(named: menuItem.menuItemImageName)
            cell.configure(menuIconImage: menuItemImage)
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let menuItem = menuItems[indexPath.row]
        let tapHandler = menuItem.menuItemHandler
        tapHandler(menuItem.menuItemImageName)
        
        delegate?.handleButtonTapped(withId: menuItem.menuItemImageName)
    }
}
