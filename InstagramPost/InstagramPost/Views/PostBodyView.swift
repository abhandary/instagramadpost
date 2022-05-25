//
//  PostBodyView.swift
//  InstagramPost
//
//  Created by John Nguyen on 2/27/22.
//

import Foundation
import UIKit

class PostBodyView: UIView {
    
    struct Constants {
        static let smallSpacing: CGFloat = 10
        static let mediumSpacing: CGFloat = 20
        static let largeSpacing: CGFloat = 30
        
        static let ctaHeight: CGFloat = 50
    }
    
    struct Content {
        let middleContentImage: UIImage
        let middleContentHeight: CGFloat
        let middleCTATitle: String
    }

    private lazy var contentImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .random
        return imageView
    }()
    
    // TODO: Custom CTA View
    private lazy var ctaView: UIView = {
        let ctaView = UIView()
        ctaView.translatesAutoresizingMaskIntoConstraints = false
        ctaView.backgroundColor = .random
        return ctaView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(content: Content) {
        super.init(frame: .zero)
        setupViews(withImageHeight: content.middleContentHeight)
    }
    
    // TODO: Disable for now
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews(withImageHeight imageHeight: CGFloat) {
        addSubview(contentImageView)
        addSubview(ctaView)
        
        NSLayoutConstraint.activate([
            contentImageView.topAnchor.constraint(equalTo: topAnchor),
            contentImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentImageView.heightAnchor.constraint(equalToConstant: imageHeight),
            
            ctaView.heightAnchor.constraint(equalToConstant: Constants.ctaHeight),
            ctaView.topAnchor.constraint(equalTo: contentImageView.bottomAnchor),
            ctaView.leadingAnchor.constraint(equalTo: leadingAnchor),
            ctaView.trailingAnchor.constraint(equalTo: trailingAnchor),
            ctaView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func setContent(withContent content: Content) {
        contentImageView.image = content.middleContentImage
        
        //TODO: Set custom cta
//        ctaView.configure(ctaText: content.middleCTAContent)
    }
}
