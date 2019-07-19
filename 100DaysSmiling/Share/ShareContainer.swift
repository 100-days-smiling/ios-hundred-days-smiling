//
//  ShareContainer.swift
//  100DaysSmiling
//
//  Created by Dunya Kirkali on 19/07/2019.
//  Copyright © 2019 Felipe Florencio Garcia. All rights reserved.
//

import Foundation
import Swinject
import SwinjectStoryboard

class ShareContainer {
    
    private static let ShareKey = "Share"
    
    func setupContainer(with container: Container) {
        container.register(SwinjectStoryboard.self, name: ShareContainer.ShareKey) { _ -> SwinjectStoryboard in
            return SwinjectStoryboard.create(name: ShareContainer.ShareKey, bundle: nil, container: container)
        }
        
        container.register(ShareViewController.self) { resolver -> ShareViewController in
            let storyboard = resolver.resolve(SwinjectStoryboard.self, name: ShareContainer.ShareKey)
            return (storyboard?.instantiateInitialViewController() as? ShareViewController)!
        }
    }
}
