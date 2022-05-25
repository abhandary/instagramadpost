//
//  PostFooterView.swift
//  InstagramPost
//
//  Created by John Nguyen on 2/27/22.
//

import Foundation
import UIKit

class PostFooterView: UIView {
    
    struct Constants {
        static let smallestSpacing: CGFloat = 2
        static let smallerSpacing: CGFloat = 5
        static let smallSpacing: CGFloat = 10
        static let mediumSpacing: CGFloat = 20
        static let largeSpacing: CGFloat = 30
        
        static let buttonStackHeight: CGFloat = 25
        static let moreButtonWidth: CGFloat = 30
    }
    
    enum FooterDescriptionType {
        // TODO: Add documentation
        case WithBoldedAndStandard(String, String)
        case OnlyStandard(String)
    }
    
    struct Content {
        let footerDescriptionType: FooterDescriptionType
    }
    
    private lazy var horizontalStackView: UIStackView = {
        let horizontalStackView = UIStackView(arrangedSubviews: [heartButton, commentButton, shareButton])
        horizontalStackView.translatesAutoresizingMaskIntoConstraints = false
        horizontalStackView.spacing = Constants.smallSpacing
        horizontalStackView.axis = .horizontal
        horizontalStackView.alignment = .fill
        return horizontalStackView
    }()
    
    private lazy var heartButton: UIButton = {
        let button = UIButton()
//        button.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        button.backgroundColor = .random
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var commentButton: UIButton = {
        let button = UIButton()
        //        button.setImage(UIImage(named: "comment"), for: .normal)
        button.backgroundColor = .random
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var shareButton: UIButton = {
        let button = UIButton()
        //        button.setImage(UIImage(named: "share"), for: .normal)
        button.backgroundColor = .random
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var saveButton: UIButton = {
        let button = UIButton()
        //        button.setImage(UIImage(named: "save"), for: .normal)
        button.backgroundColor = .random
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .random
        label.numberOfLines = 1
        return label
    }()
    
    private lazy var moreButton: UIButton = {
        let button = UIButton()
        button.setTitle("More", for: .normal)
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

        addSubview(horizontalStackView)
        addSubview(saveButton)
        addSubview(descriptionLabel)
        addSubview(moreButton)
        
        NSLayoutConstraint.activate([
            horizontalStackView.heightAnchor.constraint(equalToConstant: Constants.buttonStackHeight),
            horizontalStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.smallSpacing),
            horizontalStackView.topAnchor.constraint(equalTo: topAnchor, constant: Constants.smallSpacing),
            
            saveButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.smallSpacing),
            saveButton.topAnchor.constraint(equalTo: horizontalStackView.topAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: horizontalStackView.bottomAnchor, constant: Constants.smallSpacing),
            descriptionLabel.leadingAnchor.constraint(equalTo: horizontalStackView.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: moreButton.leadingAnchor, constant: Constants.smallestSpacing),
            descriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: Constants.smallSpacing),
            
            moreButton.topAnchor.constraint(equalTo: descriptionLabel.topAnchor),
            moreButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.smallSpacing),
            moreButton.widthAnchor.constraint(equalToConstant: Constants.moreButtonWidth)
        ])
    }
    
    private func setContent(withContent content: Content) {
        switch content.footerDescriptionType {
        case .OnlyStandard(let descriptionText):
            descriptionLabel.text = descriptionText
        case .WithBoldedAndStandard(let boldedText, let standardText):
            descriptionLabel.attributedText = getDescriptionAttributedText(
                boldedText: boldedText,
                standardText: standardText)
        }
    }
    
    private func getDescriptionAttributedText(boldedText: String, standardText: String) -> NSMutableAttributedString {
        let title: NSAttributedString = NSAttributedString(string: boldedText)
        let subTitle: NSAttributedString = NSAttributedString(string: standardText)
        
        let combinedAttributedString = NSMutableAttributedString()
        
        combinedAttributedString.append(title)
        combinedAttributedString.append(subTitle)
        
        return combinedAttributedString
    }
}
