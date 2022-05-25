//
//  ViewController.swift
//  Post
//
//  Created by John Nguyen on 1/30/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let postView = PostView(frame: .zero, content: getPostContent())
        postView.translatesAutoresizingMaskIntoConstraints = false
        postView.delegate = self
        
        view.addSubview(postView)
        
        NSLayoutConstraint.activate([
            postView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            postView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            postView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
    }
    
    private func getPostContent() -> PostView.Content {
        return PostView.Content(
            headerText: "Test Header Tes",
            headerImage: UIImage(),
            headerSubtext: "Test Subtext",
            image: UIImage(),
            contentCallToActionText: "Test content call to action",
            footerCallToActionText: "Test footer call to action",
            footerDescriptionText: "Test footer description Test footer descriptionTest footer descriptionTest footer descriptionTest footer descriptionTest footer descriptionTest footer descriptionTest footer descriptionTest footer descriptionTest footer descriptionTest footer descriptionTest footer descriptionTest footer descriptionTest footer descriptionTest footer descriptionTest footer descriptionTest footer descriptionTest footer descriptionTest footer descriptionTest footer descriptionTest footer descriptionTest footer descriptionTest footer descriptionTest footer descriptionTest footer descriptionTest footer descriptionTest footer descriptionTest footer description")
    }
}

extension ViewController: PostViewDelegate {
    func handleMoreButtonTap() {
        
    }
}

