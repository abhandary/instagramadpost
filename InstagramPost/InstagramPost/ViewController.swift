//
//  ViewController.swift
//  InstagramPost
//
//  Created by John Nguyen on 2/27/22.
//

import UIKit

class ViewController: UIViewController {
    
    struct Constants {
        static let contentHeight: CGFloat = 300
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let postView = PostView(viewModel: PostViewModel(
            headerTitle: "InterviewKickstart",
            headerSubtitle: "Sponsored",
            headerImage: UIImage(),
            middleContentImage: UIImage(),
            middleContentHeight: Constants.contentHeight,
            middleCTATitle: "Learn More",
            footerDescriptionType: .WithBoldedAndStandard("UserName", "My description text")))
        
        postView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(postView)
        
        postView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        postView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        postView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }


}

