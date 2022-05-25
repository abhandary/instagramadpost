//
//  PostHeaderView.swift
//  InstagramPost
//
//  Created by John Nguyen on 2/27/22.
//

import Foundation
import UIKit

class PostHeaderView: UIView {
    
    struct Constants {
        static let smallerSpacing: CGFloat = 5
        static let smallSpacing: CGFloat = 10
        static let mediumSpacing: CGFloat = 20
        static let largeSpacing: CGFloat = 30
        
        static let headerImageViewSize: CGSize = CGSize(width: 50, height: 50)
    }
     
    struct Content {
        let headerTitle: String
        let headerSubtitle: String
        let headerImage: UIImage
    }
    
    private lazy var headerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .random
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .random
        label.numberOfLines = 2
        return label
    }()
    
    private lazy var headerMoreButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .random
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    init(content: Content) {
        super.init(frame: .zero)
        setupViews()
        setContent(withContent: content)
        
    }
    
    // TODO: Disable for now
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(headerImageView)
        addSubview(headerLabel)
        addSubview(headerMoreButton)
        
        NSLayoutConstraint.activate([
            headerImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.smallSpacing),
            headerImageView.heightAnchor.constraint(equalToConstant: Constants.headerImageViewSize.height),
            headerImageView.widthAnchor.constraint(equalToConstant: Constants.headerImageViewSize.width),
            headerImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            headerLabel.leadingAnchor.constraint(equalTo: headerImageView.trailingAnchor, constant: Constants.smallSpacing), 
            headerLabel.topAnchor.constraint(equalTo: topAnchor, constant: Constants.smallSpacing),
            headerLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Constants.smallSpacing),
            headerLabel.trailingAnchor.constraint(equalTo: headerMoreButton.leadingAnchor, constant: Constants.smallerSpacing),
            
            headerMoreButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            headerMoreButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.smallSpacing)
        ])
    }
    
    private func setContent(withContent content: Content) {
        headerImageView.image = content.headerImage
        headerLabel.attributedText = getHeaderAttributedText(title: content.headerTitle, subTitle: content.headerSubtitle)
//        headerMoreButton.setTitle(UIImage(named: "more-button-icon"), for: .normal)
    }
    
    private func getHeaderAttributedText(title: String, subTitle: String) -> NSMutableAttributedString {
        let title: NSAttributedString = NSAttributedString(string: "\(title) \n")
        let subTitle: NSAttributedString = NSAttributedString(string: subTitle)
        
        let combinedAttributedString = NSMutableAttributedString()
        
        combinedAttributedString.append(title)
        combinedAttributedString.append(subTitle)
        
        return combinedAttributedString
    }
    
}
