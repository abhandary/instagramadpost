//
//  MenuItemCollectionViewCell.swift
//  MenuView
//
//  Created by John Nguyen on 10/8/21.
//

import UIKit

class MenuItemCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var menuIcon: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    public func configure(menuIconImage: UIImage?) {
        guard let iconImage = menuIconImage else {
            return
        }
        
        menuIcon.image = iconImage
    }
}
