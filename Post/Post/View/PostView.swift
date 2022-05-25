//
//  PostView.swift
//  PostView
//
//  Created by John Nguyen on 1/30/22.
//

import UIKit

protocol PostViewDelegate: AnyObject {
    func handleMoreButtonTap()
}

class PostView: UIView {
    
    private struct Constants {
        static let maxLinesHeader = 2
        static let footerInitialLines = 1
        static let footerMoreLines = 1
        
        static let smallSpacing: CGFloat = 10
        static let mediumSpacing: CGFloat = 20
        static let smallSize: CGSize = CGSize(width: 30, height: 30)
        
        static let mainButtonStackHeight: CGFloat = 35
        static let headerViewHeight: CGFloat = 40
        static let contentViewHeight: CGFloat = 350
        static let footerMoreButtonHeight: CGFloat = 22
    }
    
    struct Content {
        let headerText: String
        let headerImage: UIImage
        let headerSubtext: String
        let image: UIImage
        let contentCallToActionText: String
        let footerCallToActionText: String
        let footerDescriptionText: String
    }
    
    private lazy var headerContainerView: UIView = {
        let view = getHeaderView()
        view.backgroundColor = .random
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var headerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = Constants.maxLinesHeader
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var headerMoreButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var contentContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .random
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var contentImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // TODO: Make custom view for Call to Action button.
    private lazy var contentCallToActionButton: UIView = {
        let view = UIView()
        view.backgroundColor = .random
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var footerContainerView: UIView = {
        let view = getFooterView()
        view.backgroundColor = .random
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var footerMainButtonStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [footerHeartButton,footerCommentButton, footerShareButton,spacerView])
        stackView.axis = .horizontal
        stackView.spacing = Constants.smallSpacing
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var footerHeartButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var footerCommentButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .random
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var footerShareButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .random
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var footerSaveButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .random
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var spacerView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var footerDescriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = Constants.footerInitialLines
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var footerDescriptionMoreButton: UIButton = {
        let button = UIButton()
        // TODO: Localize string
        button.setTitle("more", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.target(forAction: #selector(moreButtonTapped), withSender: self)
        return button
    }()
    
    weak var delegate: PostViewDelegate?
    
    init(frame: CGRect, content: Content) {
        super.init(frame: frame)
        setupView()
        setView(withContent: content)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        setupHeader()
        setupContent()
        setupFooter()
    }
    
    func setupHeader() {
        addSubview(headerContainerView)
        
        NSLayoutConstraint.activate([
            headerContainerView.topAnchor.constraint(equalTo: self.topAnchor),
            headerContainerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            headerContainerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            headerContainerView.heightAnchor.constraint(equalToConstant: Constants.headerViewHeight)
        ])
    }
    
    func setupContent() {
        addSubview(contentContainerView)
        
        NSLayoutConstraint.activate([
            contentContainerView.topAnchor.constraint(equalTo: headerContainerView.bottomAnchor),
            contentContainerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            contentContainerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            contentContainerView.heightAnchor.constraint(equalToConstant: Constants.contentViewHeight)
        ])
    }
    
    func setupFooter() {
        addSubview(footerContainerView)
        NSLayoutConstraint.activate([
            footerContainerView.topAnchor.constraint(equalTo: contentContainerView.bottomAnchor),
            footerContainerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            footerContainerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            footerContainerView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}

// MARK: Setting content
extension PostView {
    func getHeaderView() -> UIView {
        let view = UIView()
//        view.addSubview(headerImageView)
//        view.addSubview(headerLabel)
//        view.addSubview(headerMoreButton)
//
//        NSLayoutConstraint.activate([
//            headerImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.smallSpacing),
//            headerImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: Constants.mediumSpacing),
//            headerImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: Constants.smallSpacing),
//            headerImageView.trailingAnchor.constraint(equalTo: headerLabel.trailingAnchor, constant: Constants.smallSpacing),
//            headerImageView.trailingAnchor.constraint(equalTo: headerLabel.trailingAnchor, constant: Constants.smallSpacing),
//        ])
        
        return view
    }
    
    func getFooterView() -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(footerMainButtonStack)
        view.addSubview(footerSaveButton)
        view.addSubview(footerDescriptionLabel)
        view.addSubview(footerDescriptionMoreButton)
        
        NSLayoutConstraint.activate([
            footerMainButtonStack.topAnchor.constraint(equalTo: view.topAnchor),
            footerMainButtonStack.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            footerMainButtonStack.trailingAnchor.constraint(equalTo: footerSaveButton.leadingAnchor),
            
            footerHeartButton.widthAnchor.constraint(equalToConstant: Constants.smallSize.width),
            footerCommentButton.widthAnchor.constraint(equalToConstant: Constants.smallSize.width),
            
            footerShareButton.widthAnchor.constraint(equalToConstant: Constants.smallSize.width),
            footerHeartButton.widthAnchor.constraint(equalToConstant: Constants.smallSize.width),
            
            footerSaveButton.widthAnchor.constraint(equalToConstant: Constants.smallSize.width),
            footerMainButtonStack.heightAnchor.constraint(equalToConstant: Constants.mainButtonStackHeight),
            footerSaveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            footerDescriptionLabel.topAnchor.constraint(equalTo: footerMainButtonStack.bottomAnchor),
            footerDescriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.smallSpacing),
            footerDescriptionLabel.trailingAnchor.constraint(equalTo: footerDescriptionMoreButton.leadingAnchor),
            footerDescriptionLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            footerDescriptionMoreButton.topAnchor.constraint(equalTo: footerDescriptionLabel.topAnchor),
            footerDescriptionMoreButton.heightAnchor.constraint(equalToConstant: Constants.footerMoreButtonHeight),
            footerDescriptionMoreButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.smallSpacing),
        ])
        return view
    }
    
    
    func setView(withContent content: Content) {
        headerImageView.image = content.image
        headerLabel.attributedText = getHeaderLabelAttributedText(
            withHeaderText: content.headerText,
            headerSubtext: content.headerSubtext)
        
        contentImageView.image = content.image
        
        // TODO: Set Content Call to action
        
        footerDescriptionLabel.attributedText = getFooterLabelAttributedText(
            withCallToActionText: content.footerCallToActionText,
            descriptionText: content.footerDescriptionText)
    }
    
    private func getHeaderLabelAttributedText(withHeaderText headerText: String,
                                              headerSubtext: String) -> NSAttributedString {
        let combinedAttributedString = NSMutableAttributedString()
        let mainString = NSAttributedString(string: headerText)
        let descriptionString = NSAttributedString(string: headerSubtext)
        
        combinedAttributedString.append(mainString)
        combinedAttributedString.append(descriptionString)
        
        return combinedAttributedString
    }
    
    private func getFooterLabelAttributedText(withCallToActionText ctaText: String,
                                              descriptionText: String) -> NSAttributedString {
        let combinedAttributedString = NSMutableAttributedString()
        let ctaString = NSAttributedString(string: ctaText)
        let descriptionString = NSAttributedString(string: descriptionText)
        
        combinedAttributedString.append(ctaString)
        combinedAttributedString.append(descriptionString)
        
        return combinedAttributedString
    }
    
    @objc func moreButtonTapped() {
        footerDescriptionMoreButton.setTitle("See less", for: .normal)
        footerDescriptionLabel.numberOfLines = Constants.footerMoreLines
    }
}


