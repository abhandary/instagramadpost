//
//  PostViewModel.swift
//  InstagramPost
//
//  Created by John Nguyen on 2/27/22.
//

import Foundation
import UIKit

class PostViewModel {
    private var headerTitle: String
    private var headerSubtitle: String
    private var headerImage: UIImage
    
    private var middleContentImage: UIImage
    private var middleContentHeight: CGFloat
    private var middleCTATitle: String
    
    let footerDescriptionType: PostFooterView.FooterDescriptionType
    
    init(headerTitle: String,
         headerSubtitle: String,
         headerImage: UIImage,
         middleContentImage: UIImage,
         middleContentHeight: CGFloat,
         middleCTATitle: String,
         footerDescriptionType: PostFooterView.FooterDescriptionType) {
        
        self.headerTitle = headerTitle
        self.headerSubtitle = headerSubtitle
        self.headerImage = headerImage
        
        self.middleContentImage = middleContentImage
        self.middleContentHeight = middleContentHeight
        self.middleCTATitle = middleCTATitle
        
        self.footerDescriptionType = footerDescriptionType
    }
    
    public func getHeaderContent() -> PostHeaderView.Content {
        return PostHeaderView.Content(
            headerTitle: headerTitle,
            headerSubtitle: headerSubtitle,
            headerImage: headerImage)
    }
    
    public func getBodyContent() -> PostBodyView.Content {
        return PostBodyView.Content(
            middleContentImage: middleContentImage,
            middleContentHeight: middleContentHeight,
            middleCTATitle: middleCTATitle)
    }
    
    public func getFooterContent() -> PostFooterView.Content {
        return PostFooterView.Content(
            footerDescriptionType: footerDescriptionType)
    }
}
