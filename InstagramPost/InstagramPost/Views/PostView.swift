//
//  PostView.swift
//  InstagramPost
//
//  Created by John Nguyen on 2/27/22.
//

import Foundation
import UIKit

class PostView: UIView {
    
    enum FooterDescriptionType {
        // TODO: Add documentation
        case WithBoldedAndStandard(String, String)
        case OnlyStandard(String)
    }
    
    private lazy var contentVerticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        return stackView
    }()
    
    init(viewModel: PostViewModel) {
        super.init(frame: .zero)
        setupViews(withViewModel: viewModel)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews(withViewModel viewModel: PostViewModel) {
        addSubview(contentVerticalStackView)
        
        contentVerticalStackView.addArrangedSubview(PostHeaderView(content: viewModel.getHeaderContent()))
        contentVerticalStackView.addArrangedSubview(PostBodyView(content: viewModel.getBodyContent()))
        contentVerticalStackView.addArrangedSubview(PostFooterView(content: viewModel.getFooterContent()))
        
        NSLayoutConstraint.activate([
            contentVerticalStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentVerticalStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentVerticalStackView.topAnchor.constraint(equalTo: topAnchor),
            contentVerticalStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
}
